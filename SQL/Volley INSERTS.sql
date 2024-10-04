TRUNCATE TABLE play_match
INSERT INTO play_match (week_number, game_number, order_number, play_day, play_time, category, team_1, team_2, tournament_id) SELECT 5 AS week_number,1 AS game_num,1 AS order_num,TRIM(' LUNES 19 DE AGOSTO') AS play_day,TRIM('6:00 P.M.') AS play_time,'FEMENIL' AS category,(SELECT team_id FROM team where name = 'FÉNIX' AND category = 'FEMENIL') AS team_1,(SELECT team_id FROM team where name = 'VAGAS' AND category = 'FEMENIL') AS team_2,1 AS tournament_id FROM DUAL;
INSERT INTO play_match (week_number, game_number, order_number, play_day, play_time, category, team_1, team_2, tournament_id) SELECT 5 AS week_number,2 AS game_num,2 AS order_num,TRIM(' LUNES 19 DE AGOSTO') AS play_day,TRIM('7:00 P.M.') AS play_time,'VARONIL' AS category,(SELECT team_id FROM team where name = 'PILARES' AND category = 'VARONIL') AS team_1,(SELECT team_id FROM team where name = 'ARDILLAS' AND category = 'VARONIL') AS team_2,1 AS tournament_id FROM DUAL;
INSERT INTO play_match (week_number, game_number, order_number, play_day, play_time, category, team_1, team_2, tournament_id) SELECT 5 AS week_number,3 AS game_num,3 AS order_num,TRIM(' LUNES 19 DE AGOSTO') AS play_day,TRIM('8:00 P.M.') AS play_time,'VARONIL' AS category,(SELECT team_id FROM team where name = 'HUISCOLCO' AND category = 'VARONIL') AS team_1,(SELECT team_id FROM team where name = 'NEGOS' AND category = 'VARONIL') AS team_2,1 AS tournament_id FROM DUAL;

INSERT INTO play_match (week_number, game_number, order_number, play_day, play_time, category, team_1, team_2, tournament_id) SELECT 5 AS week_number,4 AS game_num,4 AS order_num,TRIM(' LUNES 19 DE AGOSTO') AS play_day,TRIM('6:00 P.M.') AS play_time,'VARONIL' AS category,(SELECT team_id FROM team where name = 'PILARES' AND category = 'VARONIL') AS team_1,(SELECT team_id FROM team where name = 'NEGOS' AND category = 'VARONIL') AS team_2,1 AS tournament_id FROM DUAL;
INSERT INTO play_match (week_number, game_number, order_number, play_day, play_time, category, team_1, team_2, tournament_id) SELECT 5 AS week_number,5 AS game_num,5 AS order_num,TRIM(' LUNES 19 DE AGOSTO') AS play_day,TRIM('7:00 P.M.') AS play_time,'VARONIL' AS category,(SELECT team_id FROM team where name = 'COSALIMA' AND category = 'VARONIL') AS team_1,(SELECT team_id FROM team where name = 'LA RETA' AND category = 'VARONIL') AS team_2,1 AS tournament_id FROM DUAL;
INSERT INTO play_match (week_number, game_number, order_number, play_day, play_time, category, team_1, team_2, tournament_id) SELECT 5 AS week_number,6 AS game_num,6 AS order_num,TRIM(' LUNES 19 DE AGOSTO') AS play_day,TRIM('8:00 P.M.') AS play_time,'MIXTO' AS category,(SELECT team_id FROM team where name = 'VIKINGOS' AND category = 'MIXTO') AS team_1,(SELECT team_id FROM team where name = 'NOVATOS' AND category = 'MIXTO') AS team_2,1 AS tournament_id FROM DUAL;



INSERT INTO play_match (week_number, game_number, order_number, play_day, play_time, category, team_1, team_2, tournament_id) SELECT 5 AS week_number,1 AS game_num,7 AS order_num,TRIM(' MARTES 20 DE AGOSTO') AS play_day,TRIM('6:00 P.M.') AS play_time,'MIXTO' AS category,(SELECT team_id FROM team where name = 'LOS RENCOROSOS' AND category = 'MIXTO') AS team_1,(SELECT team_id FROM team where name = 'SIN NOMBRE' AND category = 'MIXTO') AS team_2,1 AS tournament_id FROM DUAL;
INSERT INTO play_match (week_number, game_number, order_number, play_day, play_time, category, team_1, team_2, tournament_id) SELECT 5 AS week_number,2 AS game_num,8 AS order_num,TRIM(' MARTES 20 DE AGOSTO') AS play_day,TRIM('7:00 P.M.') AS play_time,'VARONIL' AS category,(SELECT team_id FROM team where name = 'HUISCOLCO' AND category = 'VARONIL') AS team_1,(SELECT team_id FROM team where name = 'AGUA BLANCA' AND category = 'VARONIL') AS team_2,1 AS tournament_id FROM DUAL;
INSERT INTO play_match (week_number, game_number, order_number, play_day, play_time, category, team_1, team_2, tournament_id) SELECT 5 AS week_number,3 AS game_num,9 AS order_num,TRIM(' MARTES 20 DE AGOSTO') AS play_day,TRIM('8:00 P.M.') AS play_time,'VARONIL' AS category,(SELECT team_id FROM team where name = 'LOS UNICOS' AND category = 'VARONIL') AS team_1,(SELECT team_id FROM team where name = 'AGUA BLANCA' AND category = 'VARONIL') AS team_2,1 AS tournament_id FROM DUAL;

INSERT INTO play_match (week_number, game_number, order_number, play_day, play_time, category, team_1, team_2, tournament_id) SELECT 5 AS week_number,4 AS game_num,10 AS order_num,TRIM(' MARTES 20 DE AGOSTO') AS play_day,TRIM('6:00 P.M.') AS play_time,'MIXTO' AS category,(SELECT team_id FROM team where name = 'VENGADORES' AND category = 'MIXTO') AS team_1,(SELECT team_id FROM team where name = 'THE DREAM TEAM' AND category = 'MIXTO') AS team_2,1 AS tournament_id FROM DUAL;
INSERT INTO play_match (week_number, game_number, order_number, play_day, play_time, category, team_1, team_2, tournament_id) SELECT 5 AS week_number,5 AS game_num,11 AS order_num,TRIM(' MARTES 20 DE AGOSTO') AS play_day,TRIM('7:00 P.M.') AS play_time,'MIXTO' AS category,(SELECT team_id FROM team where name = 'LOS RENCOROSOS' AND category = 'MIXTO') AS team_1,(SELECT team_id FROM team where name = 'NOVATOS' AND category = 'MIXTO') AS team_2,1 AS tournament_id FROM DUAL;
INSERT INTO play_match (week_number, game_number, order_number, play_day, play_time, category, team_1, team_2, tournament_id) SELECT 5 AS week_number,6 AS game_num,12 AS order_num,TRIM(' MARTES 20 DE AGOSTO') AS play_day,TRIM('8:00 P.M.') AS play_time,'MIXTO' AS category,(SELECT team_id FROM team where name = 'LOS RENCOROSOS' AND category = 'MIXTO') AS team_1,(SELECT team_id FROM team where name = 'THE DREAM TEAM' AND category = 'MIXTO') AS team_2,1 AS tournament_id FROM DUAL;



INSERT INTO play_match (week_number, game_number, order_number, play_day, play_time, category, team_1, team_2, tournament_id) SELECT 5 AS week_number,1 AS game_num,13 AS order_num,TRIM('MIERCOLES 21 DE AGOSTO') AS play_day,TRIM('5:30 P.M.') AS play_time,'MIXTO' AS category,(SELECT team_id FROM team where name = 'TERRENEITOR' AND category = 'MIXTO') AS team_1,(SELECT team_id FROM team where name = 'PECHOCHOS' AND category = 'MIXTO') AS team_2,1 AS tournament_id FROM DUAL;
INSERT INTO play_match (week_number, game_number, order_number, play_day, play_time, category, team_1, team_2, tournament_id) SELECT 5 AS week_number,2 AS game_num,14 AS order_num,TRIM('MIERCOLES 21 DE AGOSTO') AS play_day,TRIM('6:30 P.M.') AS play_time,'MIXTO' AS category,(SELECT team_id FROM team where name = 'LA SELECCIÓN' AND category = 'MIXTO') AS team_1,(SELECT team_id FROM team where name = 'TERRENEITOR' AND category = 'MIXTO') AS team_2,1 AS tournament_id FROM DUAL;
INSERT INTO play_match (week_number, game_number, order_number, play_day, play_time, category, team_1, team_2, tournament_id) SELECT 5 AS week_number,3 AS game_num,15 AS order_num,TRIM('MIERCOLES 21 DE AGOSTO') AS play_day,TRIM('7:30 P.M.') AS play_time,'MIXTO' AS category,(SELECT team_id FROM team where name = 'FÉNIX' AND category = 'MIXTO') AS team_1,(SELECT team_id FROM team where name = 'VIKINGOS' AND category = 'MIXTO') AS team_2,1 AS tournament_id FROM DUAL;

INSERT INTO play_match (week_number, game_number, order_number, play_day, play_time, category, team_1, team_2, tournament_id) SELECT 5 AS week_number,4 AS game_num,16 AS order_num,TRIM('MIERCOLES 21 DE AGOSTO') AS play_day,TRIM('6:00 P.M.') AS play_time,'FEMENIL' AS category,(SELECT team_id FROM team where name = 'PINK PANTHERS' AND category = 'FEMENIL') AS team_1,(SELECT team_id FROM team where name = 'COMETAS' AND category = 'FEMENIL') AS team_2,1 AS tournament_id FROM DUAL;
INSERT INTO play_match (week_number, game_number, order_number, play_day, play_time, category, team_1, team_2, tournament_id) SELECT 5 AS week_number,5 AS game_num,17 AS order_num,TRIM('MIERCOLES 21 DE AGOSTO') AS play_day,TRIM('7:00 P.M.') AS play_time,'MIXTO' AS category,(SELECT team_id FROM team where name = 'PECHOCHOS' AND category = 'MIXTO') AS team_1,(SELECT team_id FROM team where name = 'NOVATOS' AND category = 'MIXTO') AS team_2,1 AS tournament_id FROM DUAL;
INSERT INTO play_match (week_number, game_number, order_number, play_day, play_time, category, team_1, team_2, tournament_id) SELECT 5 AS week_number,6 AS game_num,18 AS order_num,TRIM('MIERCOLES 21 DE AGOSTO') AS play_day,TRIM('8:00 P.M.') AS play_time,'VARONIL' AS category,(SELECT team_id FROM team where name = 'TOROS' AND category = 'VARONIL') AS team_1,(SELECT team_id FROM team where name = 'LA RETA' AND category = 'VARONIL') AS team_2,1 AS tournament_id FROM DUAL;



INSERT INTO play_match (week_number, game_number, order_number, play_day, play_time, category, team_1, team_2, tournament_id) SELECT 5 AS week_number,1 AS game_num,19 AS order_num,TRIM('JUEVES 22 DE AGOSTO') AS play_day,TRIM('6:00 P.M.') AS play_time,'MIXTO' AS category,(SELECT team_id FROM team where name = 'VENGADORES' AND category = 'MIXTO') AS team_1,(SELECT team_id FROM team where name = 'PECHOCHOS' AND category = 'MIXTO') AS team_2,1 AS tournament_id FROM DUAL;
INSERT INTO play_match (week_number, game_number, order_number, play_day, play_time, category, team_1, team_2, tournament_id) SELECT 5 AS week_number,2 AS game_num,20 AS order_num,TRIM('JUEVES 22 DE AGOSTO') AS play_day,TRIM('7:00 P.M.') AS play_time,'MIXTO' AS category,(SELECT team_id FROM team where name = 'PECHOCHOS' AND category = 'MIXTO') AS team_1,(SELECT team_id FROM team where name = 'SIN NOMBRE' AND category = 'MIXTO') AS team_2,1 AS tournament_id FROM DUAL;
INSERT INTO play_match (week_number, game_number, order_number, play_day, play_time, category, team_1, team_2, tournament_id) SELECT 5 AS week_number,3 AS game_num,21 AS order_num,TRIM('JUEVES 22 DE AGOSTO') AS play_day,TRIM('8:00 P.M.') AS play_time,'MIXTO' AS category,(SELECT team_id FROM team where name = 'VENGADORES' AND category = 'MIXTO') AS team_1,(SELECT team_id FROM team where name = 'LA SELECCIÓN' AND category = 'MIXTO') AS team_2,1 AS tournament_id FROM DUAL;



INSERT INTO play_match (week_number, game_number, order_number, play_day, play_time, category, team_1, team_2, tournament_id) SELECT 5 AS week_number,1 AS game_num,22 AS order_num,TRIM('VIERNES 23 DE AGOSTO') AS play_day,TRIM('6:00 P.M.') AS play_time,'MIXTO' AS category,(SELECT team_id FROM team where name = 'LA SELECCIÓN' AND category = 'MIXTO') AS team_1,(SELECT team_id FROM team where name = 'FÉNIX' AND category = 'MIXTO') AS team_2,1 AS tournament_id FROM DUAL;
