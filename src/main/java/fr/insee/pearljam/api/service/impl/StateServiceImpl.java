package fr.insee.pearljam.api.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import fr.insee.pearljam.api.constants.Constants;
import fr.insee.pearljam.api.dto.campaign.CampaignDto;
import fr.insee.pearljam.api.dto.organizationunit.OrganizationUnitDto;
import fr.insee.pearljam.api.dto.state.StateCountCampaignDto;
import fr.insee.pearljam.api.dto.state.StateCountDto;
import fr.insee.pearljam.api.exception.NotFoundException;
import fr.insee.pearljam.api.repository.CampaignRepository;
import fr.insee.pearljam.api.repository.ClosingCauseRepository;
import fr.insee.pearljam.api.repository.ContactOutcomeRepository;
import fr.insee.pearljam.api.repository.InterviewerRepository;
import fr.insee.pearljam.api.repository.OrganizationUnitRepository;
import fr.insee.pearljam.api.repository.StateRepository;
import fr.insee.pearljam.api.repository.SurveyUnitRepository;
import fr.insee.pearljam.api.repository.UserRepository;
import fr.insee.pearljam.api.repository.VisibilityRepository;
import fr.insee.pearljam.api.service.StateService;
import fr.insee.pearljam.api.service.UserService;
import fr.insee.pearljam.api.service.UtilsService;

/**
 * Implementation of the Service for the Interviewer entity
 * 
 * @author scorcaud
 *
 */
@Service
@Transactional
public class StateServiceImpl implements StateService {

	private static final Logger LOGGER = LoggerFactory.getLogger(StateServiceImpl.class);
	
	private static final String USER_CAMP_CONST_MSG = "No campaign with id %s  associated to the user %s";


	@Autowired
	CampaignRepository campaignRepository;

	@Autowired
	UserRepository userRepository;

	@Autowired
	ContactOutcomeRepository contactOutcomeRepository;

	@Autowired
	StateRepository stateRepository;
	
	@Autowired
	ClosingCauseRepository closingCauseRepository;

	@Autowired
	InterviewerRepository interviewerRepository;

	@Autowired
	SurveyUnitRepository surveyUnitRepository;

	@Autowired
	VisibilityRepository visibilityRepository;

	@Autowired
	OrganizationUnitRepository organizationUnitRepository;

	@Autowired
	UserService userService;

	@Autowired
	UtilsService utilsService;


	public StateCountDto getStateCount(String userId, String campaignId, String interviewerId, Long date,
			List<String> associatedOrgUnits) throws NotFoundException {
		StateCountDto stateCountDto = new StateCountDto();
		if (!utilsService.checkUserCampaignOUConstraints(userId, campaignId)) {
			throw new NotFoundException(String.format(USER_CAMP_CONST_MSG, campaignId, userId));
		}
		if (!interviewerRepository.findById(interviewerId).isPresent()) {
			LOGGER.error("No interviewer found for the id {}", interviewerId);
			throw new NotFoundException(String.format("No interviewers found for the id %s", interviewerId));

		}
		List<String> userOuIds;
		if(!userId.equals(Constants.GUEST)) {
			userOuIds = utilsService.getRelatedOrganizationUnits(userId);
		} else {
			userOuIds = organizationUnitRepository.findAllId();
		}
		
		List<String> intervIds = interviewerRepository.findInterviewersByOrganizationUnits(associatedOrgUnits);
		Long dateToUse = date;
		if (dateToUse == null) {
			dateToUse = System.currentTimeMillis();
		}
		if (!intervIds.isEmpty() && (intervIds.contains(interviewerId)) || userId.equals(Constants.GUEST)) {
			stateCountDto = new StateCountDto(stateRepository.getStateCount(campaignId, interviewerId, userOuIds, dateToUse));
			stateCountDto.addClosingCauseCount(closingCauseRepository.getStateClosedByClosingCauseCount(campaignId, interviewerId, userOuIds, dateToUse));
		}
		if (stateCountDto.getTotal() == null) {
			throw new NotFoundException(String.format("No matching interviewers %s were found for the user % and the campaign %s", interviewerId,
					userId, campaignId));
		}
		return stateCountDto;
	}

	public StateCountCampaignDto getStateCountByCampaign(String userId, String campaignId, Long date) throws NotFoundException {
		StateCountCampaignDto stateCountCampaignDto = new StateCountCampaignDto();
		if (!utilsService.checkUserCampaignOUConstraints(userId, campaignId)) {
			throw new NotFoundException(String.format(USER_CAMP_CONST_MSG, campaignId, userId));
		}
		List<StateCountDto> stateCountList = new ArrayList<>();
		Long dateToUse = date;
		if (dateToUse == null) {
			dateToUse = System.currentTimeMillis();
		}
		for (String id : organizationUnitRepository.findAllId()) {
			if(organizationUnitRepository.findChildren(id).isEmpty()
					&& visibilityRepository.findVisibilityByCampaignIdAndOuId(campaignId, id).isPresent()) {
		        StateCountDto dto = new StateCountDto(id, organizationUnitRepository.findLabel(id),
		        		stateRepository.getStateCountByCampaignAndOU(campaignId, id, dateToUse));
				dto.addClosingCauseCount(closingCauseRepository.getClosingCauseCountByCampaignAndOU(campaignId, id, dateToUse));
				stateCountList.add(dto);
			}
		}
		stateCountCampaignDto.setOrganizationUnits(stateCountList);
		
		StateCountDto dtoFrance = new StateCountDto(stateRepository.getStateCountByCampaignId(campaignId, dateToUse));
		dtoFrance.addClosingCauseCount(closingCauseRepository.getClosingCauseCountByCampaignId(campaignId, dateToUse));
		stateCountCampaignDto.setFrance(dtoFrance);
		if (stateCountCampaignDto.getFrance() == null || stateCountCampaignDto.getOrganizationUnits() == null
				) {
			throw new NotFoundException(String.format("No matching survey units states were found for the user %s and the campaign %s", userId,
					campaignId));
		}
		return stateCountCampaignDto;
	}

	public List<StateCountDto> getStateCountByCampaigns(String userId, Long date) {
		List<StateCountDto> returnList = new ArrayList<>();
		List<OrganizationUnitDto> organizationUnits = userService.getUserOUs(userId, true);
		for (OrganizationUnitDto dto : organizationUnits) {
			LOGGER.info(dto.getId());
		}
		List<String> userOrgUnitIds = organizationUnits.stream().map(OrganizationUnitDto::getId)
				.collect(Collectors.toList());
		Long dateToUse = date;
		if (dateToUse == null) {
			dateToUse = System.currentTimeMillis();
		}
		List<String> campaignIds = campaignRepository.findAllCampaignIdsByOuIds(userOrgUnitIds);
		
		for(String id : campaignIds) {
			StateCountDto campaignSum = new StateCountDto(
					stateRepository.getStateCountSumByCampaign(id, userOrgUnitIds, dateToUse)
					);
			campaignSum.addClosingCauseCount(closingCauseRepository.getgetStateClosedByClosingCauseCountByCampaign(id, userOrgUnitIds, dateToUse));
			if(campaignSum.getTotal() != null) {
				CampaignDto dto = campaignRepository.findDtoById(id);
				campaignSum.setCampaign(dto);
				returnList.add(campaignSum);
			}
		}
		return returnList;
	}

	public List<StateCountDto> getStateCountByInterviewer(String userId, Long date) {
		List<StateCountDto> returnList = new ArrayList<>();
		List<OrganizationUnitDto> organizationUnits = userService.getUserOUs(userId, true);
		List<String> userOrgUnitIds = organizationUnits.stream().map(OrganizationUnitDto::getId)
				.collect(Collectors.toList());
		Long dateToUse = date;
		if (dateToUse == null) {
			dateToUse = System.currentTimeMillis();
		}
		Set<String> interviewerIds = interviewerRepository.findIdsByOrganizationUnits(userOrgUnitIds);
		List<String> campaignIds = campaignRepository.findAllCampaignIdsByOuIds(userOrgUnitIds);
		for(String id : interviewerIds) {
			StateCountDto interviewerSum = new StateCountDto(
					stateRepository.getStateCountSumByInterviewer(campaignIds, id, userOrgUnitIds, dateToUse)
		      );
			interviewerSum.addClosingCauseCount(closingCauseRepository.getClosingCauseCountSumByInterviewer(campaignIds, id, userOrgUnitIds, dateToUse));
			if(interviewerSum.getTotal() != null) {
				interviewerSum.setInterviewer(interviewerRepository.findDtoById(id));
				returnList.add(interviewerSum);
			}
		}
		return returnList;
	}
	
	@Override
	public StateCountDto getNbSUNotAttributedStateCount(String userId, String id, Long date) throws NotFoundException {
		if (!utilsService.checkUserCampaignOUConstraints(userId, id)) {
			throw new NotFoundException(String.format(USER_CAMP_CONST_MSG, id, userId));
		}
		
		List<String> organizationUnits = userService.getUserOUs(userId, true)
				.stream().map(OrganizationUnitDto::getId)
				.collect(Collectors.toList());
		Long dateToUse = date;
		if (dateToUse == null) {
			dateToUse = System.currentTimeMillis();
		}
		
		StateCountDto interviewerSum = new StateCountDto(
				stateRepository.getStateCountNotAttributed(id, organizationUnits, dateToUse)
	      );
		interviewerSum.addClosingCauseCount(closingCauseRepository.getClosingCauseCountNotAttributed(id, organizationUnits, dateToUse));
		
		return interviewerSum;
	}
}
