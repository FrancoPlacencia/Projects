CALL usp_get_week_template(10, @template)

-- =============================================================================
-- MIXTO 
CALL usp_get_category_template('MIXTO',@template);

-- =============================================================================
-- VARONIL 
CALL usp_get_category_template('VARONIL',@template);

-- =============================================================================
-- FEMENIL 
CALL usp_get_category_template('FEMENIL',@template);


-- UPDATE LINK
UPDATE teams
SET image = concat('[[Torneo_Otoño_Invierno_2024_',UPPER(SUBSTRING(category,1,1)),LOWER(SUBSTRING(category,2)),'_', name,'|',name,']]') 
WHERE tournament_id = 2
-- =============================================================================

UPDATE games
SET team_1_set_1_pts = 25,team_1_set_2_pts = 25,team_1_set_3_pts = 25,
team_2_set_1_pts = 1,team_2_set_2_pts = 1,team_2_set_3_pts = 1
WHERE stage = 'QUARTER';
UPDATE games
SET team_1_set_1_pts = 25,team_1_set_2_pts = 25,team_1_set_3_pts = 25,team_1_set_4_pts = 25,
team_2_set_1_pts = 1,team_2_set_2_pts = 1,team_2_set_3_pts = 1,team_1_set_4_pts = 25
WHERE stage = 'SEMI';
UPDATE games
SET team_1_set_1_pts = 25,team_1_set_2_pts = 25,team_1_set_3_pts = 25,team_1_set_4_pts = 25,team_1_set_5_pts = 25,
team_2_set_1_pts = 1,team_2_set_2_pts = 1,team_2_set_3_pts = 1,team_1_set_5_pts = 25
WHERE stage = 'FINAL';
UPDATE games
SET team_1_set_1_pts = 25,team_1_set_2_pts = 25,
team_2_set_1_pts = 1,team_2_set_2_pts = 1
WHERE stage = 'THIRD';

SELECT players.* 
FROM teams
INNER JOIN players
ON players.team_id = teams.team_id
WHERE tournament_id = 3 AND category = 'VARONIL'
AND teams.name = 'CUERVOS'

CALL usp_update_team()

SELECT * 
FROM tournaments

SELECT * FROM games

SELECT * 
FROM games
WHERE tournament_id = 2
AND week_number = 18

AND game_date BETWEEN '2025-04-23 00:00:00' AND '2025-04-24 00:00:01'

SELECT *
FROM teams
WHERE tournament_id = 3
AND category = 'MIXTO'
AND stage = 'REGULAR';


SELECT tournament_id
FROM tournaments
WHERE is_active = TRUE


SELECT * FROM users u 