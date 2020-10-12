package fr.insee.pearljam.api.bussinessrules;

import fr.insee.pearljam.api.domain.StateType;

public class BussinessRules {
	private BussinessRules() {
		throw new IllegalStateException("BusinessRules static class");
	}
	
	// Checks if a survey unit is allowed to pass from a state to another
	public static Boolean stateCanBeModified(StateType currentState, StateType targetState) {
		switch(targetState) {
			case NVA: return currentState != StateType.NVA;
			case ANV: return currentState == StateType.NNS;
			case VIN: return currentState == StateType.NNS || currentState == StateType.ANV;
			case VIC: return currentState == StateType.VIN;
			case FIN: return currentState == StateType.TBR || currentState == StateType.WFS;
			case WFT: return currentState == StateType.FIN || currentState == StateType.TBR
					|| currentState == StateType.INS;
			case PRC: return currentState == StateType.VIC;
			case AOC: return currentState == StateType.APS || currentState == StateType.PRC;
			case APS: return currentState == StateType.AOC || currentState == StateType.PRC;
			case INS: return currentState == StateType.APS || currentState == StateType.PRC 
					|| currentState == StateType.FIN || currentState == StateType.TBR;
			case WFS: return currentState == StateType.WFT;
			case TBR: return currentState == StateType.WFS;
			case NVM: return currentState == StateType.ANV;
			default: return false;
		}
	}
	
	/* Checks if a survey unit is allowed to pass from a state to another
	 * via a manager action
	 */
	public static Boolean stateCanBeModifiedByManager(StateType currentState, StateType targetState) {
		switch(targetState) {
			case NVA: return currentState != StateType.NVA;
			case ANV: return currentState == StateType.NNS;
			case VIN: return currentState == StateType.NNS || currentState == StateType.ANV;
			case FIN: return currentState == StateType.TBR;
			case WFT: return currentState == StateType.FIN || currentState == StateType.TBR;
			default: return false;
		}
	}
	
	/* Checks if a survey unit is allowed to pass from a state to another
	 * via an interviewer action
	 */
	public static Boolean stateCanBeModifiedByInterviewer(StateType currentState, StateType targetState) {
		switch(targetState) {
			case PRC: return currentState == StateType.VIC;
			case AOC: return currentState == StateType.APS || currentState == StateType.PRC;
			case APS: return currentState == StateType.AOC || currentState == StateType.PRC;
			case INS: return currentState == StateType.APS || currentState == StateType.PRC 
					|| currentState == StateType.FIN || currentState == StateType.TBR;
			case WFT: return currentState == StateType.INS;
			case WFS: return currentState == StateType.WFT;
			case TBR: return currentState == StateType.WFS;
			case FIN: return currentState == StateType.WFS;
			default: return false;
		}
	}
	
	/* Checks if a survey unit is allowed to pass from a state to another
	 * via an automatic bussiness rule
	 */
	public static Boolean stateCanBeModifiedBussinessRules(StateType currentState, StateType targetState) {
		switch(targetState) {
			case VIC: return currentState == StateType.VIN;
			case WFT: return currentState == StateType.INS;			
			case FIN: return currentState == StateType.WFS;
			case TBR: return currentState == StateType.WFS;
			case ANV: return currentState == StateType.FIN;
			case NVM: return currentState == StateType.ANV;
			default: return false;
		}
	}
	
	/* Checks if a survey unit can be seen by the interviewer
	 * via an automatic bussiness rule
	 */
	public static Boolean stateCanBeSeenByInterviewerBussinessRules(StateType currentState) {
		switch(currentState) {
			case NNS: return false;
			case ANV: return false;			
			case NVM: return false;
			case NVA: return false;
			default: return true;
		}
	}
}
