CALL usp_get_week_template(14, @template) 

CALL usp_get_category_template('FEMENIL',@template);
CALL usp_get_category_template('VARONIL',@template);
CALL usp_get_category_template('MIXTO',@template);

CALL usp_get_games_template('MIXTO', @template);

CALL usp_update_players();

CALL usp_update_team();

SELECT * FROM teams t WHERE tournament_id = 2 AND category = 'VARONIL'

SELECT * 
FROM tournaments
WHERE tournament_id = 2 
AND category = 'VARONIL'

SELECT * 
FROM players
INNER JOIN teams
ON teams.team_id = players.team_id 
WHERE players.name LIKE '%FELIPE%'

ALTER USER 'root'@'localhost' IDENTIFIED BY 'M4r1@Db_R0ot_P4$sw0rd';