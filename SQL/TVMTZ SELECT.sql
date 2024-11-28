SELECT 
t1.name AS t1_name,
games.team_1_set_1_pts,
games.team_1_set_2_pts,
games.team_1_set_3_pts,
t2.name AS t2_name,
games.team_2_set_1_pts,
games.team_2_set_2_pts,
games.team_2_set_3_pts,
games.*

FROM games

INNER JOIN teams t1 ON t1.team_id = games.team_1 
INNER JOIN teams t2 ON t2.team_id = games.team_2

WHERE games.tournament_id = 2
AND games.week_number = 11
AND games.game_date LIKE '2024-11-26%'


DELETE FROM games WHERE week_number = 11 AND game_id = 644
29- 59

INSERT INTO games (
	tournament_id,category,week_number,
	game_date,game_place,
	team_1,team_2
)
SELECT 
	2 AS tournament_id,
	'MIXTO' AS category,
	9 AS week_number,
	STR_TO_DATE(CONCAT(TRIM('11/8/2024'),' ',TRIM(REPLACE('6:00 P.M.','.',''))), '%m/%d/%Y %h:%i %p') AS game_date,
	TRIM('ABAJO') AS game_place,
	fn_get_team_id('MIXTO','LOS OLVIDADOS') AS team_1,
	fn_get_team_id('MIXTO','GALACTICOS') AS team_2 
FROM DUAL;


INSERT INTO games (tournament_id,category,week_number,game_date,game_place,team_1,team_2) SELECT 2 AS tournament_id,'MIXTO' AS category,11 AS week_number,STR_TO_DATE(CONCAT(TRIM('11/25/2024'),' ',TRIM(REPLACE('5:30 P.M.','.',''))), '%m/%d/%Y %h:%i %p') AS game_date,TRIM('ARRIBA') AS game_place,fn_get_team_id('MIXTO','VENGADORES') AS team_1,fn_get_team_id('MIXTO','RENCOROSOS') AS team_2 FROM DUAL;
INSERT INTO games (tournament_id,category,week_number,game_date,game_place,team_1,team_2) SELECT 2 AS tournament_id,'MIXTO' AS category,11 AS week_number,STR_TO_DATE(CONCAT(TRIM('11/25/2024'),' ',TRIM(REPLACE('6:30 P.M.','.',''))), '%m/%d/%Y %h:%i %p') AS game_date,TRIM('ARRIBA') AS game_place,fn_get_team_id('MIXTO','RENCOROSOS') AS team_1,fn_get_team_id('MIXTO','MIXTICOS') AS team_2 FROM DUAL;
INSERT INTO games (tournament_id,category,week_number,game_date,game_place,team_1,team_2) SELECT 2 AS tournament_id,'MIXTO' AS category,11 AS week_number,STR_TO_DATE(CONCAT(TRIM('11/25/2024'),' ',TRIM(REPLACE('7:30 P.M.','.',''))), '%m/%d/%Y %h:%i %p') AS game_date,TRIM('ARRIBA') AS game_place,fn_get_team_id('MIXTO','LOS DEL BASQUET') AS team_1,fn_get_team_id('MIXTO','MIXTICOS') AS team_2 FROM DUAL;
INSERT INTO games (tournament_id,category,week_number,game_date,game_place,team_1,team_2) SELECT 2 AS tournament_id,'MIXTO' AS category,11 AS week_number,STR_TO_DATE(CONCAT(TRIM('11/25/2024'),' ',TRIM(REPLACE('8:30 P.M.','.',''))), '%m/%d/%Y %h:%i %p') AS game_date,TRIM('ARRIBA') AS game_place,fn_get_team_id('MIXTO','LOS DEL BASQUET') AS team_1,fn_get_team_id('MIXTO','PECHOCHOS') AS team_2 FROM DUAL;

INSERT INTO games (tournament_id,category,week_number,game_date,game_place,team_1,team_2) SELECT 2 AS tournament_id,'MIXTO' AS category,11 AS week_number,STR_TO_DATE(CONCAT(TRIM('11/25/2024'),' ',TRIM(REPLACE('5:30 P.M.','.',''))), '%m/%d/%Y %h:%i %p') AS game_date,TRIM('ABAJO') AS game_place,fn_get_team_id('MIXTO','LOS OLVIDADOS') AS team_1,fn_get_team_id('MIXTO','MIXTICOS') AS team_2 FROM DUAL;
INSERT INTO games (tournament_id,category,week_number,game_date,game_place,team_1,team_2) SELECT 2 AS tournament_id,'MIXTO' AS category,11 AS week_number,STR_TO_DATE(CONCAT(TRIM('11/25/2024'),' ',TRIM(REPLACE('6:30 P.M.','.',''))), '%m/%d/%Y %h:%i %p') AS game_date,TRIM('ABAJO') AS game_place,fn_get_team_id('MIXTO','VENGADORES') AS team_1,fn_get_team_id('MIXTO','LOS DEL BASQUET') AS team_2 FROM DUAL;
INSERT INTO games (tournament_id,category,week_number,game_date,game_place,team_1,team_2) SELECT 2 AS tournament_id,'VARONIL' AS category,11 AS week_number,STR_TO_DATE(CONCAT(TRIM('11/25/2024'),' ',TRIM(REPLACE('7:30 P.M.','.',''))), '%m/%d/%Y %h:%i %p') AS game_date,TRIM('ABAJO') AS game_place,fn_get_team_id('VARONIL','CHIQUE') AS team_1,fn_get_team_id('VARONIL','CUERVOS') AS team_2 FROM DUAL;



INSERT INTO games (tournament_id,category,week_number,game_date,game_place,team_1,team_2) SELECT 2 AS tournament_id,'FEMENIL' AS category,11 AS week_number,STR_TO_DATE(CONCAT(TRIM('11/26/2024'),' ',TRIM(REPLACE('5:30 P.M.','.',''))), '%m/%d/%Y %h:%i %p') AS game_date,TRIM('ARRIBA') AS game_place,fn_get_team_id('FEMENIL','LAS PEQUES') AS team_1,fn_get_team_id('FEMENIL','VENUS') AS team_2 FROM DUAL;
INSERT INTO games (tournament_id,category,week_number,game_date,game_place,team_1,team_2) SELECT 2 AS tournament_id,'FEMENIL' AS category,11 AS week_number,STR_TO_DATE(CONCAT(TRIM('11/26/2024'),' ',TRIM(REPLACE('6:30 P.M.','.',''))), '%m/%d/%Y %h:%i %p') AS game_date,TRIM('ARRIBA') AS game_place,fn_get_team_id('FEMENIL','LAS PEQUES') AS team_1,fn_get_team_id('FEMENIL','PANTERAS') AS team_2 FROM DUAL;
INSERT INTO games (tournament_id,category,week_number,game_date,game_place,team_1,team_2) SELECT 2 AS tournament_id,'VARONIL' AS category,11 AS week_number,STR_TO_DATE(CONCAT(TRIM('11/26/2024'),' ',TRIM(REPLACE('7:30 P.M.','.',''))), '%m/%d/%Y %h:%i %p') AS game_date,TRIM('ARRIBA') AS game_place,fn_get_team_id('VARONIL','CIERVOS') AS team_1,fn_get_team_id('VARONIL','TOROS') AS team_2 FROM DUAL;
INSERT INTO games (tournament_id,category,week_number,game_date,game_place,team_1,team_2) SELECT 2 AS tournament_id,'MIXTO' AS category,11 AS week_number,STR_TO_DATE(CONCAT(TRIM('11/26/2024'),' ',TRIM(REPLACE('8:30 P.M.','.',''))), '%m/%d/%Y %h:%i %p') AS game_date,TRIM('ARRIBA') AS game_place,fn_get_team_id('MIXTO','L@S PEQUES') AS team_1,fn_get_team_id('MIXTO','FENIX') AS team_2 FROM DUAL;

INSERT INTO games (tournament_id,category,week_number,game_date,game_place,team_1,team_2) SELECT 2 AS tournament_id,'VARONIL' AS category,11 AS week_number,STR_TO_DATE(CONCAT(TRIM('11/26/2024'),' ',TRIM(REPLACE('5:30 P.M.','.',''))), '%m/%d/%Y %h:%i %p') AS game_date,TRIM('ABAJO') AS game_place,fn_get_team_id('VARONIL','REENCUENTRO') AS team_1,fn_get_team_id('VARONIL','ARDILLAS') AS team_2 FROM DUAL;
INSERT INTO games (tournament_id,category,week_number,game_date,game_place,team_1,team_2) SELECT 2 AS tournament_id,'VARONIL' AS category,11 AS week_number,STR_TO_DATE(CONCAT(TRIM('11/26/2024'),' ',TRIM(REPLACE('6:30 P.M.','.',''))), '%m/%d/%Y %h:%i %p') AS game_date,TRIM('ABAJO') AS game_place,fn_get_team_id('VARONIL','CIERVOS') AS team_1,fn_get_team_id('VARONIL','REENCUENTRO') AS team_2 FROM DUAL;
INSERT INTO games (tournament_id,category,week_number,game_date,game_place,team_1,team_2) SELECT 2 AS tournament_id,'MIXTO' AS category,11 AS week_number,STR_TO_DATE(CONCAT(TRIM('11/26/2024'),' ',TRIM(REPLACE('7:30 P.M.','.',''))), '%m/%d/%Y %h:%i %p') AS game_date,TRIM('ABAJO') AS game_place,fn_get_team_id('MIXTO','L@S PEQUES') AS team_1,fn_get_team_id('MIXTO','GALACTICOS') AS team_2 FROM DUAL;



INSERT INTO games (tournament_id,category,week_number,game_date,game_place,team_1,team_2) SELECT 2 AS tournament_id,'FEMENIL' AS category,11 AS week_number,STR_TO_DATE(CONCAT(TRIM('11/27/2024'),' ',TRIM(REPLACE('5:30 P.M.','.',''))), '%m/%d/%Y %h:%i %p') AS game_date,TRIM('ARRIBA') AS game_place,fn_get_team_id('FEMENIL','MONARCAS') AS team_1,fn_get_team_id('FEMENIL','TIX') AS team_2 FROM DUAL;
INSERT INTO games (tournament_id,category,week_number,game_date,game_place,team_1,team_2) SELECT 2 AS tournament_id,'FEMENIL' AS category,11 AS week_number,STR_TO_DATE(CONCAT(TRIM('11/27/2024'),' ',TRIM(REPLACE('6:30 P.M.','.',''))), '%m/%d/%Y %h:%i %p') AS game_date,TRIM('ARRIBA') AS game_place,fn_get_team_id('FEMENIL','GALACTICAS') AS team_1,fn_get_team_id('FEMENIL','NOVAS') AS team_2 FROM DUAL;
INSERT INTO games (tournament_id,category,week_number,game_date,game_place,team_1,team_2) SELECT 2 AS tournament_id,'FEMENIL' AS category,11 AS week_number,STR_TO_DATE(CONCAT(TRIM('11/27/2024'),' ',TRIM(REPLACE('7:30 P.M.','.',''))), '%m/%d/%Y %h:%i %p') AS game_date,TRIM('ARRIBA') AS game_place,fn_get_team_id('FEMENIL','PANTERAS') AS team_1,fn_get_team_id('FEMENIL','PREPA') AS team_2 FROM DUAL;
INSERT INTO games (tournament_id,category,week_number,game_date,game_place,team_1,team_2) SELECT 2 AS tournament_id,'FEMENIL' AS category,11 AS week_number,STR_TO_DATE(CONCAT(TRIM('11/27/2024'),' ',TRIM(REPLACE('8:30 P.M.','.',''))), '%m/%d/%Y %h:%i %p') AS game_date,TRIM('ARRIBA') AS game_place,fn_get_team_id('MIXTO','ROJAS MIX') AS team_1,fn_get_team_id('MIXTO','MIXED SQUIRRELS') AS team_2 FROM DUAL;

INSERT INTO games (tournament_id,category,week_number,game_date,game_place,team_1,team_2) SELECT 2 AS tournament_id,'MIXTO' AS category,11 AS week_number,STR_TO_DATE(CONCAT(TRIM('11/27/2024'),' ',TRIM(REPLACE('5:30 P.M.','.',''))), '%m/%d/%Y %h:%i %p') AS game_date,TRIM('ABAJO') AS game_place,fn_get_team_id('MIXTO','LA SELECCIÓN') AS team_1,fn_get_team_id('MIXTO','GALACTICOS') AS team_2 FROM DUAL;
INSERT INTO games (tournament_id,category,week_number,game_date,game_place,team_1,team_2) SELECT 2 AS tournament_id,'MIXTO' AS category,11 AS week_number,STR_TO_DATE(CONCAT(TRIM('11/27/2024'),' ',TRIM(REPLACE('6:30 P.M.','.',''))), '%m/%d/%Y %h:%i %p') AS game_date,TRIM('ABAJO') AS game_place,fn_get_team_id('MIXTO','ROJAS MIX') AS team_1,fn_get_team_id('MIXTO','LOS OLVIDADOS') AS team_2 FROM DUAL;
INSERT INTO games (tournament_id,category,week_number,game_date,game_place,team_1,team_2) SELECT 2 AS tournament_id,'MIXTO' AS category,11 AS week_number,STR_TO_DATE(CONCAT(TRIM('11/27/2024'),' ',TRIM(REPLACE('7:30 P.M.','.',''))), '%m/%d/%Y %h:%i %p') AS game_date,TRIM('ABAJO') AS game_place,fn_get_team_id('MIXTO','MIXED SQUIRRELS') AS team_1,fn_get_team_id('MIXTO','PECHOCHOS') AS team_2 FROM DUAL;



INSERT INTO games (tournament_id,category,week_number,game_date,game_place,team_1,team_2) SELECT 2 AS tournament_id,'MIXTO' AS category,11 AS week_number,STR_TO_DATE(CONCAT(TRIM('11/28/2024'),' ',TRIM(REPLACE('5:30 P.M.','.',''))), '%m/%d/%Y %h:%i %p') AS game_date,TRIM('ABAJO') AS game_place,fn_get_team_id('MIXTO','RENCOROSOS') AS team_1,fn_get_team_id('MIXTO','WINNERS') AS team_2 FROM DUAL;
INSERT INTO games (tournament_id,category,week_number,game_date,game_place,team_1,team_2) SELECT 2 AS tournament_id,'MIXTO' AS category,11 AS week_number,STR_TO_DATE(CONCAT(TRIM('11/28/2024'),' ',TRIM(REPLACE('6:30 P.M.','.',''))), '%m/%d/%Y %h:%i %p') AS game_date,TRIM('ABAJO') AS game_place,fn_get_team_id('MIXTO','WINNERS') AS team_1,fn_get_team_id('MIXTO','FENIX') AS team_2 FROM DUAL;
INSERT INTO games (tournament_id,category,week_number,game_date,game_place,team_1,team_2) SELECT 2 AS tournament_id,'MIXTO' AS category,11 AS week_number,STR_TO_DATE(CONCAT(TRIM('11/28/2024'),' ',TRIM(REPLACE('7:30 P.M.','.',''))), '%m/%d/%Y %h:%i %p') AS game_date,TRIM('ABAJO') AS game_place,fn_get_team_id('MIXTO','FENIX') AS team_1,fn_get_team_id('MIXTO','LOS OLVIDADOS') AS team_2 FROM DUAL;




INSERT INTO games (tournament_id,category,week_number,game_date,game_place,team_1,team_2) SELECT 2 AS tournament_id,'MIXTO' AS category,11 AS week_number,STR_TO_DATE(CONCAT(TRIM('11/29/2024'),' ',TRIM(REPLACE('6:30 P.M.','.',''))), '%m/%d/%Y %h:%i %p') AS game_date,TRIM('ABAJO') AS game_place,fn_get_team_id('MIXTO','LOS OLVIDADOS') AS team_1,fn_get_team_id('MIXTO','VIKINGOS') AS team_2 FROM DUAL;
INSERT INTO games (tournament_id,category,week_number,game_date,game_place,team_1,team_2) SELECT 2 AS tournament_id,'MIXTO' AS category,11 AS week_number,STR_TO_DATE(CONCAT(TRIM('11/29/2024'),' ',TRIM(REPLACE('7:30 P.M.','.',''))), '%m/%d/%Y %h:%i %p') AS game_date,TRIM('ABAJO') AS game_place,fn_get_team_id('MIXTO','VIKINGOS') AS team_1,fn_get_team_id('MIXTO','PECHOCHOS') AS team_2 FROM DUAL;
