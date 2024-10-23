INSERT INTO tournaments (name,t_year, description, url) VALUES (
	'Torneo Otoño Invierno 2024',
	2024,
	'Torneo de Voleibol, Tabasco, Zac. Liga Municipal',
	'Torneo_Otoño_Invierno_2024'
);
-- DELETE FROM TEAMS WHERE 1 = 1
-- TEAMS 
INSERT INTO teams (tournament_id,team_number, name, category) VALUES (1,1,'GALACTICAS','FEMENIL');
INSERT INTO teams (tournament_id,team_number, name, category) VALUES (1,2,'LAS PEQUES','FEMENIL');
INSERT INTO teams (tournament_id,team_number, name, category) VALUES (1,3,'MINERAS','FEMENIL');
INSERT INTO teams (tournament_id,team_number, name, category) VALUES (1,4,'MONARCAS','FEMENIL');
INSERT INTO teams (tournament_id,team_number, name, category) VALUES (1,5,'NOVAS','FEMENIL');
INSERT INTO teams (tournament_id,team_number, name, category) VALUES (1,6,'PANTERAS','FEMENIL');
INSERT INTO teams (tournament_id,team_number, name, category) VALUES (1,7,'PREPA','FEMENIL');
INSERT INTO teams (tournament_id,team_number, name, category) VALUES (1,8,'TERRENEITOR','FEMENIL');
INSERT INTO teams (tournament_id,team_number, name, category) VALUES (1,9,'TIX','FEMENIL');
INSERT INTO teams (tournament_id,team_number, name, category) VALUES (1,10,'VENUS','FEMENIL');
INSERT INTO teams (tournament_id,team_number, name, category) VALUES (1,1,'ARDILLAS','VARONIL');
INSERT INTO teams (tournament_id,team_number, name, category) VALUES (1,2,'CHIQUE','VARONIL');
INSERT INTO teams (tournament_id,team_number, name, category) VALUES (1,3,'CIERVOS','VARONIL');
INSERT INTO teams (tournament_id,team_number, name, category) VALUES (1,4,'CUERVOS','VARONIL');
INSERT INTO teams (tournament_id,team_number, name, category) VALUES (1,5,'DESPEINADOS','VARONIL');
INSERT INTO teams (tournament_id,team_number, name, category) VALUES (1,6,'LOS UNICOS','VARONIL');
INSERT INTO teams (tournament_id,team_number, name, category) VALUES (1,7,'NEGOS','VARONIL');
INSERT INTO teams (tournament_id,team_number, name, category) VALUES (1,8,'REENCUENTRO','VARONIL');
INSERT INTO teams (tournament_id,team_number, name, category) VALUES (1,9,'TENANGUILLO','VARONIL');
INSERT INTO teams (tournament_id,team_number, name, category) VALUES (1,10,'TOROS','VARONIL');
INSERT INTO teams (tournament_id,team_number, name, category) VALUES (1,1,'FENIX','MIXTO');
INSERT INTO teams (tournament_id,team_number, name, category) VALUES (1,2,'GALACTICOS','MIXTO');
INSERT INTO teams (tournament_id,team_number, name, category) VALUES (1,3,'L@S PEQUES','MIXTO');
INSERT INTO teams (tournament_id,team_number, name, category) VALUES (1,4,'LA SELECCIÓN','MIXTO');
INSERT INTO teams (tournament_id,team_number, name, category) VALUES (1,5,'LOS DEL BASQUET','MIXTO');
INSERT INTO teams (tournament_id,team_number, name, category) VALUES (1,6,'LOS OLVIDADOS','MIXTO');
INSERT INTO teams (tournament_id,team_number, name, category) VALUES (1,7,'MIXED SQUIRRELS','MIXTO');
INSERT INTO teams (tournament_id,team_number, name, category) VALUES (1,8,'MIXTICOS','MIXTO');
INSERT INTO teams (tournament_id,team_number, name, category) VALUES (1,9,'PECHOCHOS','MIXTO');
INSERT INTO teams (tournament_id,team_number, name, category) VALUES (1,10,'RENCOROSOS','MIXTO');
INSERT INTO teams (tournament_id,team_number, name, category) VALUES (1,11,'ROJAS MIX','MIXTO');
INSERT INTO teams (tournament_id,team_number, name, category) VALUES (1,12,'VENGADORES','MIXTO');
INSERT INTO teams (tournament_id,team_number, name, category) VALUES (1,13,'VIKINGOS','MIXTO');
INSERT INTO teams (tournament_id,team_number, name, category) VALUES (1,14,'WINNERS','MIXTO');

-- GAMES
INSERT INTO games (tournament_id,category,week_number,game_date,game_place,team_1,team_2) SELECT 1 AS tournament_id,'MIXTO' AS category,5 AS week_number,STR_TO_DATE(CONCAT(TRIM('10/7/2024'),' ',TRIM(REPLACE('6:00 P.M.','.',''))), '%m/%d/%Y %h:%i %p') AS game_date,TRIM('ARRIBA') AS game_place,fn_getTeamId(1,'MIXTO','RENCOROSOS') AS team_1,fn_getTeamId(1,'MIXTO','MIXTICOS') AS team_2 FROM DUAL;
INSERT INTO games (tournament_id,category,week_number,game_date,game_place,team_1,team_2) SELECT 1 AS tournament_id,'MIXTO' AS category,5 AS week_number,STR_TO_DATE(CONCAT(TRIM('10/7/2024'),' ',TRIM(REPLACE('7:00 P.M.','.',''))), '%m/%d/%Y %h:%i %p') AS game_date,TRIM('ARRIBA') AS game_place,fn_getTeamId(1,'MIXTO','LOS DEL BASQUET') AS team_1,fn_getTeamId(1,'MIXTO','MIXTICOS') AS team_2 FROM DUAL;
INSERT INTO games (tournament_id,category,week_number,game_date,game_place,team_1,team_2) SELECT 1 AS tournament_id,'MIXTO' AS category,5 AS week_number,STR_TO_DATE(CONCAT(TRIM('10/7/2024'),' ',TRIM(REPLACE('8:00 P.M.','.',''))), '%m/%d/%Y %h:%i %p') AS game_date,TRIM('ARRIBA') AS game_place,fn_getTeamId(1,'MIXTO','LOS OLVIDADOS') AS team_1,fn_getTeamId(1,'MIXTO','FENIX') AS team_2 FROM DUAL;
INSERT INTO games (tournament_id,category,week_number,game_date,game_place,team_1,team_2) SELECT 1 AS tournament_id,'MIXTO' AS category,5 AS week_number,STR_TO_DATE(CONCAT(TRIM('10/7/2024'),' ',TRIM(REPLACE('9:00 P.M.','.',''))), '%m/%d/%Y %h:%i %p') AS game_date,TRIM('ARRIBA') AS game_place,fn_getTeamId(1,'MIXTO','PECHOCHOS') AS team_1,fn_getTeamId(1,'MIXTO','FENIX') AS team_2 FROM DUAL;
INSERT INTO games (tournament_id,category,week_number,game_date,game_place,team_1,team_2) SELECT 1 AS tournament_id,'MIXTO' AS category,5 AS week_number,STR_TO_DATE(CONCAT(TRIM('10/7/2024'),' ',TRIM(REPLACE('6:00 P.M.','.',''))), '%m/%d/%Y %h:%i %p') AS game_date,TRIM('ABAJO') AS game_place,fn_getTeamId(1,'MIXTO','WINNERS') AS team_1,fn_getTeamId(1,'MIXTO','LOS DEL BASQUET') AS team_2 FROM DUAL;
INSERT INTO games (tournament_id,category,week_number,game_date,game_place,team_1,team_2) SELECT 1 AS tournament_id,'VARONIL' AS category,5 AS week_number,STR_TO_DATE(CONCAT(TRIM('10/7/2024'),' ',TRIM(REPLACE('7:00 P.M.','.',''))), '%m/%d/%Y %h:%i %p') AS game_date,TRIM('ABAJO') AS game_place,fn_getTeamId(1,'VARONIL','LOS UNICOS') AS team_1,fn_getTeamId(1,'VARONIL','CUERVOS') AS team_2 FROM DUAL;
INSERT INTO games (tournament_id,category,week_number,game_date,game_place,team_1,team_2) SELECT 1 AS tournament_id,'MIXTO' AS category,5 AS week_number,STR_TO_DATE(CONCAT(TRIM('10/7/2024'),' ',TRIM(REPLACE('8:00 P.M.','.',''))), '%m/%d/%Y %h:%i %p') AS game_date,TRIM('ABAJO') AS game_place,fn_getTeamId(1,'MIXTO','PECHOCHOS') AS team_1,fn_getTeamId(1,'MIXTO','LA SELECCIÓN') AS team_2 FROM DUAL;
INSERT INTO games (tournament_id,category,week_number,game_date,game_place,team_1,team_2) SELECT 1 AS tournament_id,'FEMENIL' AS category,5 AS week_number,STR_TO_DATE(CONCAT(TRIM('10/8/2024'),' ',TRIM(REPLACE('6:00 P.M.','.',''))), '%m/%d/%Y %h:%i %p') AS game_date,TRIM('ARRIBA') AS game_place,fn_getTeamId(1,'FEMENIL','GALACTICAS') AS team_1,fn_getTeamId(1,'FEMENIL','LAS PEQUES') AS team_2 FROM DUAL;
INSERT INTO games (tournament_id,category,week_number,game_date,game_place,team_1,team_2) SELECT 1 AS tournament_id,'MIXTO' AS category,5 AS week_number,STR_TO_DATE(CONCAT(TRIM('10/8/2024'),' ',TRIM(REPLACE('7:00 P.M.','.',''))), '%m/%d/%Y %h:%i %p') AS game_date,TRIM('ARRIBA') AS game_place,fn_getTeamId(1,'MIXTO','VENGADORES') AS team_1,fn_getTeamId(1,'MIXTO','L@S PEQUES') AS team_2 FROM DUAL;
INSERT INTO games (tournament_id,category,week_number,game_date,game_place,team_1,team_2) SELECT 1 AS tournament_id,'MIXTO' AS category,5 AS week_number,STR_TO_DATE(CONCAT(TRIM('10/8/2024'),' ',TRIM(REPLACE('8:00 P.M.','.',''))), '%m/%d/%Y %h:%i %p') AS game_date,TRIM('ARRIBA') AS game_place,fn_getTeamId(1,'MIXTO','L@S PEQUES') AS team_1,fn_getTeamId(1,'MIXTO','RENCOROSOS') AS team_2 FROM DUAL;
INSERT INTO games (tournament_id,category,week_number,game_date,game_place,team_1,team_2) SELECT 1 AS tournament_id,'VARONIL' AS category,5 AS week_number,STR_TO_DATE(CONCAT(TRIM('10/8/2024'),' ',TRIM(REPLACE('9:00 P.M.','.',''))), '%m/%d/%Y %h:%i %p') AS game_date,TRIM('ARRIBA') AS game_place,fn_getTeamId(1,'VARONIL','CHIQUE') AS team_1,fn_getTeamId(1,'VARONIL','DESPEINADOS') AS team_2 FROM DUAL;
INSERT INTO games (tournament_id,category,week_number,game_date,game_place,team_1,team_2) SELECT 1 AS tournament_id,'MIXTO' AS category,5 AS week_number,STR_TO_DATE(CONCAT(TRIM('10/8/2024'),' ',TRIM(REPLACE('6:00 P.M.','.',''))), '%m/%d/%Y %h:%i %p') AS game_date,TRIM('ABAJO') AS game_place,fn_getTeamId(1,'MIXTO','MIXED SQUIRRELS') AS team_1,fn_getTeamId(1,'MIXTO','GALACTICOS') AS team_2 FROM DUAL;
INSERT INTO games (tournament_id,category,week_number,game_date,game_place,team_1,team_2) SELECT 1 AS tournament_id,'VARONIL' AS category,5 AS week_number,STR_TO_DATE(CONCAT(TRIM('10/9/2024'),' ',TRIM(REPLACE('6:00 P.M.','.',''))), '%m/%d/%Y %h:%i %p') AS game_date,TRIM('ARRIBA') AS game_place,fn_getTeamId(1,'VARONIL','NEGOS') AS team_1,fn_getTeamId(1,'VARONIL','TOROS') AS team_2 FROM DUAL;
INSERT INTO games (tournament_id,category,week_number,game_date,game_place,team_1,team_2) SELECT 1 AS tournament_id,'MIXTO' AS category,5 AS week_number,STR_TO_DATE(CONCAT(TRIM('10/9/2024'),' ',TRIM(REPLACE('7:00 P.M.','.',''))), '%m/%d/%Y %h:%i %p') AS game_date,TRIM('ARRIBA') AS game_place,fn_getTeamId(1,'MIXTO','VIKINGOS') AS team_1,fn_getTeamId(1,'MIXTO','ROJAS MIX') AS team_2 FROM DUAL;
INSERT INTO games (tournament_id,category,week_number,game_date,game_place,team_1,team_2) SELECT 1 AS tournament_id,'FEMENIL' AS category,5 AS week_number,STR_TO_DATE(CONCAT(TRIM('10/9/2024'),' ',TRIM(REPLACE('8:00 P.M.','.',''))), '%m/%d/%Y %h:%i %p') AS game_date,TRIM('ARRIBA') AS game_place,fn_getTeamId(1,'FEMENIL','TIX') AS team_1,fn_getTeamId(1,'FEMENIL','VENUS') AS team_2 FROM DUAL;
INSERT INTO games (tournament_id,category,week_number,game_date,game_place,team_1,team_2) SELECT 1 AS tournament_id,'FEMENIL' AS category,5 AS week_number,STR_TO_DATE(CONCAT(TRIM('10/9/2024'),' ',TRIM(REPLACE('6:00 P.M.','.',''))), '%m/%d/%Y %h:%i %p') AS game_date,TRIM('ABAJO') AS game_place,fn_getTeamId(1,'FEMENIL','PANTERAS') AS team_1,fn_getTeamId(1,'FEMENIL','MONARCAS') AS team_2 FROM DUAL;
INSERT INTO games (tournament_id,category,week_number,game_date,game_place,team_1,team_2) SELECT 1 AS tournament_id,'FEMENIL' AS category,5 AS week_number,STR_TO_DATE(CONCAT(TRIM('10/9/2024'),' ',TRIM(REPLACE('7:00 P.M.','.',''))), '%m/%d/%Y %h:%i %p') AS game_date,TRIM('ABAJO') AS game_place,fn_getTeamId(1,'FEMENIL','NOVAS') AS team_1,fn_getTeamId(1,'FEMENIL','PREPA') AS team_2 FROM DUAL;
INSERT INTO games (tournament_id,category,week_number,game_date,game_place,team_1,team_2) SELECT 1 AS tournament_id,'MIXTO' AS category,5 AS week_number,STR_TO_DATE(CONCAT(TRIM('10/10/2024'),' ',TRIM(REPLACE('6:00 P.M.','.',''))), '%m/%d/%Y %h:%i %p') AS game_date,TRIM('ABAJO') AS game_place,fn_getTeamId(1,'MIXTO','LOS OLVIDADOS') AS team_1,fn_getTeamId(1,'MIXTO','LA SELECCIÓN') AS team_2 FROM DUAL;
INSERT INTO games (tournament_id,category,week_number,game_date,game_place,team_1,team_2) SELECT 1 AS tournament_id,'MIXTO' AS category,5 AS week_number,STR_TO_DATE(CONCAT(TRIM('10/10/2024'),' ',TRIM(REPLACE('7:00 P.M.','.',''))), '%m/%d/%Y %h:%i %p') AS game_date,TRIM('ABAJO') AS game_place,fn_getTeamId(1,'MIXTO','VENGADORES') AS team_1,fn_getTeamId(1,'MIXTO','GALACTICOS') AS team_2 FROM DUAL;
