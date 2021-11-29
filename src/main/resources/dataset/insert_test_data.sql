INSERT INTO public.address (dtype, l1, l2, l3, l4, l5, l6, l7, geographical_location_id) VALUES ('InseeAddress', 'Ted Farmer' ,'','','1b rue de valmy' ,'','59000 Lille' ,'France', '59350');
INSERT INTO public.address (dtype, l1, l2, l3, l4, l5, l6, l7, geographical_location_id) VALUES ('InseeAddress', 'Cecilia Ortega' ,'','','42 rue du molinel' ,'','59800 Lille' ,'France', '59350');
INSERT INTO public.address (dtype, l1, l2, l3, l4, l5, l6, l7, geographical_location_id) VALUES ('InseeAddress', 'Claude Le Splendid' ,'','','1 Pl. du Mont de Terre' ,'','59800 Lille' ,'France', '59350');
INSERT INTO public.address (dtype, l1, l2, l3, l4, l5, l6, l7, geographical_location_id) VALUES ('InseeAddress', 'Veronica Aeronef' ,'','','168 Av. Willy Brandt Centre Commercial' ,'','59777 Lille' ,'France', '59350');
INSERT INTO public.address (dtype, l1, l2, l3, l4, l5, l6, l7, geographical_location_id) VALUES ('InseeAddress', 'Christine Zenith' ,'','',' 1 Bd des Cités Unies' ,'','59777 Lille' ,'France', '59033');
INSERT INTO public.address (dtype, l1, l2, l3, l4, l5, l6, l7, geographical_location_id) VALUES ('InseeAddress', 'Louise Sébastopol' ,'','','Pl. Sébastopol' ,'','59000 Lille' ,'France', '59033');
INSERT INTO public.address (dtype, l1, l2, l3, l4, l5, l6, l7, geographical_location_id) VALUES ('InseeAddress', 'Anthony Mix' ,'','','7 avenue des tribunes' ,'','59130 Lambersart' ,'France', '59328');
INSERT INTO public.address (dtype, l1, l2, l3, l4, l5, l6, l7, geographical_location_id) VALUES ('InseeAddress', 'Christopher Allende' ,'','','2 Place de l''Europe' ,'','59370 Mons-en-Baroeul' ,'France', '59410');
INSERT INTO public.address (dtype, l1, l2, l3, l4, l5, l6, l7, geographical_location_id) VALUES ('InseeAddress', 'Simon Duval' ,'','','170 boulevard Victor Hugo' ,'','59000 Lille' ,'France', '59350');

INSERT INTO public.organization_unit (id, label, type, organization_unit_parent_id) VALUES ('OU-NATIONAL', 'National organizational unit', 'NATIONAL', null);
INSERT INTO public.organization_unit (id, label, type, organization_unit_parent_id) VALUES ('OU-NORTH', 'North region organizational unit', 'LOCAL', 'OU-NATIONAL');
INSERT INTO public.organization_unit (id, label, type, organization_unit_parent_id) VALUES ('OU-SOUTH', 'South region organizational unit', 'LOCAL', 'OU-NATIONAL');

INSERT INTO public.interviewer (id, email, first_name, last_name, phone_number) VALUES ('INTW1', 'margie.lucas@ou.com', 'Margie', 'Lucas', '+3391231231230');
INSERT INTO public.interviewer (id, email, first_name, last_name, phone_number) VALUES ('INTW2', 'carlton.campbell@ou.com', 'Carlton', 'Campbell', '+3391231231231');
INSERT INTO public.interviewer (id, email, first_name, last_name, phone_number) VALUES ('INTW3', 'gerald.edwards@ou.com', 'Gerald', 'Edwards', '+3391231231231');
INSERT INTO public.interviewer (id, email, first_name, last_name, phone_number) VALUES ('INTW4', 'melody.grant@ou.com', 'Melody', 'Grant', '+3391231231231');

INSERT INTO public.sample_identifier (dtype, autre, bs, ec, le, nograp, noi, nole, nolog, numfa, rges, ssech) VALUES ('InseeSampleIdentifier', '11', 11, '1', 11, '11', 11, 11, 11, 11, 11, 1);
INSERT INTO public.sample_identifier (dtype, autre, bs, ec, le, nograp, noi, nole, nolog, numfa, rges, ssech) VALUES ('InseeSampleIdentifier', '12', 12, '1', 12, '12', 12, 12, 12, 12, 12, 1);
INSERT INTO public.sample_identifier (dtype, autre, bs, ec, le, nograp, noi, nole, nolog, numfa, rges, ssech) VALUES ('InseeSampleIdentifier', '13', 13, '1', 13, '13', 13, 13, 13, 13, 13, 2);
INSERT INTO public.sample_identifier (dtype, autre, bs, ec, le, nograp, noi, nole, nolog, numfa, rges, ssech) VALUES ('InseeSampleIdentifier', '14', 14, '1', 14, '14', 14, 14, 14, 14, 14, 3);
INSERT INTO public.sample_identifier (dtype, autre, bs, ec, le, nograp, noi, nole, nolog, numfa, rges, ssech) VALUES ('InseeSampleIdentifier', '20', 20, '2', 20, '20', 20, 20, 20, 20, 20, 1);
INSERT INTO public.sample_identifier (dtype, autre, bs, ec, le, nograp, noi, nole, nolog, numfa, rges, ssech) VALUES ('InseeSampleIdentifier', '21', 21, '2', 21, '21', 21, 21, 21, 21, 21, 1);
INSERT INTO public.sample_identifier (dtype, autre, bs, ec, le, nograp, noi, nole, nolog, numfa, rges, ssech) VALUES ('InseeSampleIdentifier', '22', 22, '2', 22, '22', 22, 22, 22, 22, 22, 2);
INSERT INTO public.sample_identifier (dtype, autre, bs, ec, le, nograp, noi, nole, nolog, numfa, rges, ssech) VALUES ('InseeSampleIdentifier', '23', 23, '2', 23, '23', 23, 23, 23, 23, 23, 1);
INSERT INTO public.sample_identifier (dtype, autre, bs, ec, le, nograp, noi, nole, nolog, numfa, rges, ssech) VALUES ('InseeSampleIdentifier', '24', 24, '2', 24, '24', 24, 24, 24, 24, 24, 1);

INSERT INTO public."user" (id, first_name, last_name, organization_unit_id) VALUES ('ABC', 'Melinda', 'Webb', 'OU-NORTH');
INSERT INTO public."user" (id, first_name, last_name, organization_unit_id) VALUES ('DEF', 'Everett', 'Juste', 'OU-NORTH');
INSERT INTO public."user" (id, first_name, last_name, organization_unit_id) VALUES ('GHI', 'Elsie', 'Clarke', 'OU-SOUTH');
INSERT INTO public."user" (id, first_name, last_name, organization_unit_id) VALUES ('JKL', 'Julius', 'Howell', 'OU-NATIONAL');

INSERT INTO public.campaign (id, end_date, start_date, label) VALUES ('SIMPSONS2020X00', (SELECT extract(epoch from (LOCALTIMESTAMP + INTERVAL '2 MONTH'))*1000), (SELECT extract(epoch from (LOCALTIMESTAMP - INTERVAL '5 DAY'))*1000), 'Survey on the Simpsons tv show 2020');
INSERT INTO public.campaign (id, end_date, start_date, label) VALUES ('VQS2021X00', (SELECT extract(epoch from (LOCALTIMESTAMP + INTERVAL '2 MONTH'))*1000), (SELECT extract(epoch from (LOCALTIMESTAMP - INTERVAL '5 DAY'))*1000), 'Everyday life and health survey 2021');

-- INSERT INTO public.preference (id_user, id_campaign) VALUES ('ABC', 'SIMPSONS2020X00');
-- INSERT INTO public.preference (id_user, id_campaign) VALUES ('ABC', 'VQS2021X00');
-- INSERT INTO public.preference (id_user, id_campaign) VALUES ('DEF', 'SIMPSONS2020X00');
-- INSERT INTO public.preference (id_user, id_campaign) VALUES ('DEF', 'VQS2021X00');
INSERT INTO public.preference (id_user, id_campaign) VALUES ('GHI', 'SIMPSONS2020X00');
INSERT INTO public.preference (id_user, id_campaign) VALUES ('JKL', 'SIMPSONS2020X00');
INSERT INTO public.preference (id_user, id_campaign) VALUES ('JKL', 'VQS2021X00');


INSERT INTO public.visibility(organization_unit_id, campaign_id, collection_end_date, collection_start_date, end_date, identification_phase_start_date, interviewer_start_date, management_start_date) VALUES ('OU-NORTH', 'SIMPSONS2020X00',  (SELECT extract(epoch from (LOCALTIMESTAMP + INTERVAL '1 MONTH'))*1000), (SELECT extract(epoch from (LOCALTIMESTAMP - INTERVAL '2 DAY'))*1000), (SELECT extract(epoch from (LOCALTIMESTAMP + INTERVAL '2 MONTH'))*1000), (SELECT extract(epoch from (LOCALTIMESTAMP - INTERVAL '2 DAY'))*1000), (SELECT extract(epoch from (LOCALTIMESTAMP - INTERVAL '3 DAY'))*1000), (SELECT extract(epoch from (LOCALTIMESTAMP - INTERVAL '4 DAY'))*1000));
INSERT INTO public.visibility(organization_unit_id, campaign_id, collection_end_date, collection_start_date, end_date, identification_phase_start_date, interviewer_start_date, management_start_date) VALUES ('OU-NORTH', 'VQS2021X00',   (SELECT extract(epoch from (LOCALTIMESTAMP + INTERVAL '1 MONTH'))*1000), (SELECT extract(epoch from (LOCALTIMESTAMP - INTERVAL '2 DAY'))*1000), (SELECT extract(epoch from (LOCALTIMESTAMP + INTERVAL '2 MONTH'))*1000), (SELECT extract(epoch from (LOCALTIMESTAMP - INTERVAL '2 DAY'))*1000), (SELECT extract(epoch from (LOCALTIMESTAMP - INTERVAL '3 DAY'))*1000), (SELECT extract(epoch from (LOCALTIMESTAMP - INTERVAL '4 DAY'))*1000));
INSERT INTO public.visibility(organization_unit_id, campaign_id, collection_end_date, collection_start_date, end_date, identification_phase_start_date, interviewer_start_date, management_start_date) VALUES ('OU-SOUTH', 'VQS2021X00',  (SELECT extract(epoch from (LOCALTIMESTAMP + INTERVAL '1 MONTH'))*1000), (SELECT extract(epoch from (LOCALTIMESTAMP - INTERVAL '2 DAY'))*1000), (SELECT extract(epoch from (LOCALTIMESTAMP + INTERVAL '2 MONTH'))*1000), (SELECT extract(epoch from (LOCALTIMESTAMP - INTERVAL '2 DAY'))*1000), (SELECT extract(epoch from (LOCALTIMESTAMP - INTERVAL '3 DAY'))*1000), (SELECT extract(epoch from (LOCALTIMESTAMP - INTERVAL '4 DAY'))*1000));
INSERT INTO public.visibility(organization_unit_id, campaign_id, collection_end_date, collection_start_date, end_date, identification_phase_start_date, interviewer_start_date, management_start_date) VALUES ('OU-SOUTH', 'SIMPSONS2020X00',  (SELECT extract(epoch from (LOCALTIMESTAMP + INTERVAL '1 MONTH'))*1000), (SELECT extract(epoch from (LOCALTIMESTAMP - INTERVAL '2 DAY'))*1000), (SELECT extract(epoch from (LOCALTIMESTAMP + INTERVAL '2 MONTH'))*1000), (SELECT extract(epoch from (LOCALTIMESTAMP - INTERVAL '2 DAY'))*1000), (SELECT extract(epoch from (LOCALTIMESTAMP - INTERVAL '3 DAY'))*1000), (SELECT extract(epoch from (LOCALTIMESTAMP - INTERVAL '4 DAY'))*1000));

-- INSERT INTO public.visibility(organization_unit_id, campaign_id, collection_end_date, collection_start_date, end_date, identification_phase_start_date, interviewer_start_date, management_start_date) VALUES ('OU-NORTH', 'SIMPSONS2020X00',  (SELECT extract(epoch from (LOCALTIMESTAMP - INTERVAL '1 MONTH'))*1000), (SELECT extract(epoch from (LOCALTIMESTAMP - INTERVAL '2 DAY'))*1000), (SELECT extract(epoch from (LOCALTIMESTAMP + INTERVAL '2 MONTH'))*1000), (SELECT extract(epoch from (LOCALTIMESTAMP - INTERVAL '2 DAY'))*1000), (SELECT extract(epoch from (LOCALTIMESTAMP - INTERVAL '3 DAY'))*1000), (SELECT extract(epoch from (LOCALTIMESTAMP - INTERVAL '4 DAY'))*1000));
-- INSERT INTO public.visibility(organization_unit_id, campaign_id, collection_end_date, collection_start_date, end_date, identification_phase_start_date, interviewer_start_date, management_start_date) VALUES ('OU-NORTH', 'VQS2021X00',   (SELECT extract(epoch from (LOCALTIMESTAMP - INTERVAL '1 MONTH'))*1000), (SELECT extract(epoch from (LOCALTIMESTAMP - INTERVAL '2 DAY'))*1000), (SELECT extract(epoch from (LOCALTIMESTAMP + INTERVAL '2 MONTH'))*1000), (SELECT extract(epoch from (LOCALTIMESTAMP - INTERVAL '2 DAY'))*1000), (SELECT extract(epoch from (LOCALTIMESTAMP - INTERVAL '3 DAY'))*1000), (SELECT extract(epoch from (LOCALTIMESTAMP - INTERVAL '4 DAY'))*1000));
-- INSERT INTO public.visibility(organization_unit_id, campaign_id, collection_end_date, collection_start_date, end_date, identification_phase_start_date, interviewer_start_date, management_start_date) VALUES ('OU-SOUTH', 'VQS2021X00',  (SELECT extract(epoch from (LOCALTIMESTAMP - INTERVAL '1 MONTH'))*1000), (SELECT extract(epoch from (LOCALTIMESTAMP - INTERVAL '2 DAY'))*1000), (SELECT extract(epoch from (LOCALTIMESTAMP + INTERVAL '2 MONTH'))*1000), (SELECT extract(epoch from (LOCALTIMESTAMP - INTERVAL '2 DAY'))*1000), (SELECT extract(epoch from (LOCALTIMESTAMP - INTERVAL '3 DAY'))*1000), (SELECT extract(epoch from (LOCALTIMESTAMP - INTERVAL '4 DAY'))*1000));
-- INSERT INTO public.visibility(organization_unit_id, campaign_id, collection_end_date, collection_start_date, end_date, identification_phase_start_date, interviewer_start_date, management_start_date) VALUES ('OU-SOUTH', 'SIMPSONS2020X00',  (SELECT extract(epoch from (LOCALTIMESTAMP - INTERVAL '1 MONTH'))*1000), (SELECT extract(epoch from (LOCALTIMESTAMP - INTERVAL '2 DAY'))*1000), (SELECT extract(epoch from (LOCALTIMESTAMP + INTERVAL '2 MONTH'))*1000), (SELECT extract(epoch from (LOCALTIMESTAMP - INTERVAL '2 DAY'))*1000), (SELECT extract(epoch from (LOCALTIMESTAMP - INTERVAL '3 DAY'))*1000), (SELECT extract(epoch from (LOCALTIMESTAMP - INTERVAL '4 DAY'))*1000));


INSERT INTO public.survey_unit (id, priority, address_id, campaign_id, interviewer_id, sample_identifier_id, organization_unit_id) SELECT '11', TRUE, a.id, 'SIMPSONS2020X00', 'INTW1', s.id, 'OU-NORTH' FROM address a, sample_identifier s WHERE a.l1='Ted Farmer' AND s.bs='11';
INSERT INTO public.survey_unit (id, priority, address_id, campaign_id, interviewer_id, sample_identifier_id, organization_unit_id) SELECT  '12', TRUE, a.id, 'SIMPSONS2020X00', 'INTW1', s.id, 'OU-NORTH' FROM address a, sample_identifier s WHERE a.l1='Cecilia Ortega' AND s.bs='12';
INSERT INTO public.survey_unit (id, priority, address_id, campaign_id, interviewer_id, sample_identifier_id, organization_unit_id) SELECT  '13', FALSE, a.id, 'SIMPSONS2020X00', 'INTW2', s.id, 'OU-NORTH' FROM address a, sample_identifier s WHERE a.l1='Claude Le Splendid' AND s.bs='13';
INSERT INTO public.survey_unit (id, priority, address_id, campaign_id, interviewer_id, sample_identifier_id, organization_unit_id) SELECT  '14', FALSE, a.id, 'SIMPSONS2020X00', 'INTW3', s.id, 'OU-NORTH' FROM address a, sample_identifier s WHERE a.l1='Veronica Aeronef' AND s.bs='14';
INSERT INTO public.survey_unit (id, priority, address_id, campaign_id, interviewer_id, sample_identifier_id, organization_unit_id) SELECT  '20', FALSE, a.id, 'VQS2021X00', 'INTW1', s.id, 'OU-NORTH' FROM address a, sample_identifier s WHERE a.l1='Christine Zenith' AND s.bs='20';
INSERT INTO public.survey_unit (id, priority, address_id, campaign_id, interviewer_id, sample_identifier_id, organization_unit_id) SELECT  '21', FALSE, a.id, 'VQS2021X00', 'INTW2', s.id, 'OU-NORTH' FROM address a, sample_identifier s WHERE a.l1='Louise Sébastopol' AND s.bs='21';
INSERT INTO public.survey_unit (id, priority, address_id, campaign_id, interviewer_id, sample_identifier_id, organization_unit_id) SELECT  '22', FALSE, a.id, 'VQS2021X00', 'INTW4', s.id, 'OU-NORTH' FROM address a, sample_identifier s WHERE a.l1='Anthony Mix' AND s.bs='22';
INSERT INTO public.survey_unit (id, priority, address_id, campaign_id, interviewer_id, sample_identifier_id, organization_unit_id) SELECT  '23', FALSE, a.id, 'VQS2021X00', 'INTW4', s.id, 'OU-NORTH' FROM address a, sample_identifier s WHERE a.l1='Christopher Allende' AND s.bs='23';
INSERT INTO public.survey_unit (id, priority, address_id, campaign_id, interviewer_id, sample_identifier_id, organization_unit_id) SELECT  '24', TRUE, a.id, 'SIMPSONS2020X00', NULL, s.id, 'OU-NORTH' FROM address a, sample_identifier s WHERE a.l1='Christopher Allende' AND s.bs='24';


INSERT INTO public.person (email, favorite_email, first_name, last_name, birthdate, title, privileged, survey_unit_id) VALUES ('test@test.com',TRUE, 'Ted', 'Farmer', 11111111, 0, TRUE, '11');
INSERT INTO public.person (email, favorite_email, first_name, last_name, birthdate, title, privileged, survey_unit_id) VALUES ('test@test.com', TRUE,'Cecilia', 'Ortega', 11111111, 1, TRUE, '12');
INSERT INTO public.person (email, favorite_email, first_name, last_name, birthdate, title, privileged, survey_unit_id) VALUES ('test@test.com', TRUE,'Claude', 'Le Splendid', 11111111, 0, TRUE, '13');
INSERT INTO public.person (email, favorite_email, first_name, last_name, birthdate, title, privileged, survey_unit_id) VALUES ('test@test.com', TRUE,'Veronica', 'Aeronef', 11111111, 1, TRUE, '14');
INSERT INTO public.person (email, favorite_email, first_name, last_name, birthdate, title, privileged, survey_unit_id) VALUES ('test@test.com', TRUE,'Christine', 'Zenith', 11111111, 1, FALSE, '11');
INSERT INTO public.person (email, favorite_email, first_name, last_name, birthdate, title, privileged, survey_unit_id) VALUES ('test@test.com', TRUE,'Louise', 'Sébastopol', 11111111, 1, FALSE, '11');
INSERT INTO public.person (email, favorite_email, first_name, last_name, birthdate, title, privileged, survey_unit_id) VALUES ('test@test.com', TRUE,'Anthony', 'Mix', 11111111, 0, FALSE, '12');
INSERT INTO public.person (email, favorite_email, first_name, last_name, birthdate, title, privileged, survey_unit_id) VALUES ('test@test.com', TRUE,'Christopher', 'Allende', 11111111, 0, FALSE, '14');
INSERT INTO public.person (email, favorite_email, first_name, last_name, birthdate, title, privileged, survey_unit_id) VALUES ('test@test.com', TRUE,'Harriette', 'Raymond', 11111111, 0, TRUE, '20');
INSERT INTO public.person (email, favorite_email, first_name, last_name, birthdate, title, privileged, survey_unit_id) VALUES ('test@test.com', TRUE,'Aimée', 'Lamothe', 11111111, 0, TRUE, '21');
INSERT INTO public.person (email, favorite_email, first_name, last_name, birthdate, title, privileged, survey_unit_id) VALUES ('test@test.com', TRUE,'Perrin', 'Blanchard', 11111111, 0, TRUE, '22');
INSERT INTO public.person (email, favorite_email, first_name, last_name, birthdate, title, privileged, survey_unit_id) VALUES ('test@test.com', TRUE,'Artus', 'Arnoux', 11111111, 0, TRUE, '23');
INSERT INTO public.person (email, favorite_email, first_name, last_name, birthdate, title, privileged, survey_unit_id) VALUES ('test@test.com', TRUE,'Simon', 'Duval', 11111111, 0, TRUE, '24');



INSERT INTO public.phone_number (favorite, number, source, person_id) SELECT TRUE,'+33677542802', 0,  p.id FROM person p WHERE p.first_name='Ted' and p.last_name='Farmer' and p.survey_unit_id='11';
INSERT INTO public.phone_number (favorite, number, source, person_id) SELECT FALSE,'+33677542802', 0,  p.id FROM person p WHERE p.first_name='Ted' and p.last_name='Farmer' and p.survey_unit_id='11';
INSERT INTO public.phone_number (favorite, number, source, person_id) SELECT TRUE,'+33677542802', 0,  p.id FROM person p WHERE p.first_name='Cecilia' and p.last_name='Ortega' and p.survey_unit_id='12';
INSERT INTO public.phone_number (favorite, number, source, person_id) SELECT TRUE,'+33677542802', 0,  p.id FROM person p WHERE p.first_name='Claude' and p.last_name='Le Splendid' and p.survey_unit_id='13';
INSERT INTO public.phone_number (favorite, number, source, person_id) SELECT TRUE,'+33677542802', 0,  p.id FROM person p WHERE p.first_name='Veronica' and p.last_name='Aeronef' and p.survey_unit_id='14';
INSERT INTO public.phone_number (favorite, number, source, person_id) SELECT TRUE,'+33677542802', 0,  p.id FROM person p WHERE p.first_name='Christine' and p.last_name='Zenith' and p.survey_unit_id='11';
INSERT INTO public.phone_number (favorite, number, source, person_id) SELECT TRUE,'+33677542802', 0,  p.id FROM person p WHERE p.first_name='Louise' and p.last_name='Sébastopol' and p.survey_unit_id='11';
INSERT INTO public.phone_number (favorite, number, source, person_id) SELECT TRUE,'+33677542802', 0,  p.id FROM person p WHERE p.first_name='Anthony' and p.last_name='Mix' and p.survey_unit_id='12';
INSERT INTO public.phone_number (favorite, number, source, person_id) SELECT TRUE,'+33677542802', 0,  p.id FROM person p WHERE p.first_name='Christopher' and p.last_name='Allende' and p.survey_unit_id='14';
INSERT INTO public.phone_number (favorite, number, source, person_id) SELECT TRUE,'+33677542802', 0,  p.id FROM person p WHERE p.first_name='Harriette' and p.last_name='Raymond' and p.survey_unit_id='20';
INSERT INTO public.phone_number (favorite, number, source, person_id) SELECT TRUE,'+33677542802', 0,  p.id FROM person p WHERE p.first_name='Aimée' and p.last_name='Lamothe' and p.survey_unit_id='21';
INSERT INTO public.phone_number (favorite, number, source, person_id) SELECT TRUE,'+33677542802', 0,  p.id FROM person p WHERE p.first_name='Perrin' and p.last_name='Blanchard' and p.survey_unit_id='22';
INSERT INTO public.phone_number (favorite, number, source, person_id) SELECT TRUE,'+33677542802', 0,  p.id FROM person p WHERE p.first_name='Artus' and p.last_name='Arnoux' and p.survey_unit_id='23';
INSERT INTO public.phone_number (favorite, number, source, person_id) SELECT TRUE,'+33677542802', 0,  p.id FROM person p WHERE p.first_name='Simon' and p.last_name='Duval' and p.survey_unit_id='24';



INSERT INTO public.state (date, type, survey_unit_id) VALUES (111112111,'VIN', '11');
INSERT INTO public.state (date, type, survey_unit_id) VALUES (110111111,'NNS', '11');
INSERT INTO public.state (date, type, survey_unit_id) VALUES (111111111,'TBR', '12');
INSERT INTO public.state (date, type, survey_unit_id) VALUES (111111111,'TBR', '13');
INSERT INTO public.state (date, type, survey_unit_id) VALUES (111111111,'TBR', '14');
INSERT INTO public.state (date, type, survey_unit_id) VALUES (101111111,'TBR', '11');
INSERT INTO public.state (date, type, survey_unit_id) VALUES (101111111,'TBR', '24');
INSERT INTO public.state (date, type, survey_unit_id) VALUES (1590504478334, 'VIC', '20');
INSERT INTO public.state (date, type, survey_unit_id) VALUES (1590504478334, 'VIC', '21');
INSERT INTO public.state (date, type, survey_unit_id) VALUES (1590504478334, 'FIN', '22');
INSERT INTO public.state (date, type, survey_unit_id) VALUES (1590504478334, 'VIC', '23');

INSERT INTO public.contact_outcome (date, type, survey_unit_id) VALUES (1590504478334, 'ACP', '24');



INSERT INTO public.comment (type, value, survey_unit_id) VALUES ('INTERVIEWER', 'un commentaire', '13');

INSERT INTO public.closing_cause (date, type, survey_unit_id) VALUES ((SELECT extract(epoch from (LOCALTIMESTAMP - INTERVAL '3 DAYS'))*1000), 'NPI', '11');


