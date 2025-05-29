CALL usp_get_week_template(11, @template)

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
WHERE tournament_id = 3
AND week_number = 11

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

SELECT 
	GROUP_CONCAT('"',vs_team,'"') AS vs_team,
	GROUP_CONCAT(set_1) AS set_1,
	sum(set_1)/ count(*) AS set_1_percentage,
	GROUP_CONCAT(vs_set_1) AS vs_set_1,
	GROUP_CONCAT(set_2) AS set_2,
	sum(set_2)/ count(*) AS set_2_percentage,
	GROUP_CONCAT(vs_set_2) AS vs_set_2,
	GROUP_CONCAT(set_3) AS set_3,
	GROUP_CONCAT(vs_set_3) AS vs_set_3,
	sum(set_3)/ count(*) AS set_3_percentage
FROM (
	SELECT 
		CONCAT(games.week_number, ' - ',
			fn_get_team_name(
				teams.category,
				IF(games.team_1 != teams.team_id,
					team_1,
					team_2
				)
			)
		) AS vs_team,
		IF(games.team_1 = teams.team_id,
			team_1_set_1_pts,
			team_2_set_1_pts
		) AS set_1,
		IF(games.team_1 != teams.team_id,
			team_1_set_1_pts,
			team_2_set_1_pts
		) AS vs_set_1,
		IF(games.team_1 = teams.team_id,
			team_1_set_2_pts,
			team_2_set_2_pts
		) AS set_2,
		IF(games.team_1 != teams.team_id,
			team_1_set_2_pts,
			team_2_set_2_pts
		) AS vs_set_2,
		IF(games.team_1 = teams.team_id,
			team_1_set_3_pts,
			team_2_set_3_pts
		) AS set_3,
		IF(games.team_1 != teams.team_id,
			team_1_set_3_pts,
			team_2_set_3_pts
		) AS vs_set_3,
		IF(team_1_set_3_pts = 0 AND team_2_set_3_pts = 0, 0, 1) AS set3_played
	FROM teams  
	INNER JOIN games
	ON games.tournament_id = teams.tournament_id
	AND (
	games.team_1 = teams.team_id OR 
	games.team_2 = teams.team_id
	)
	WHERE teams.tournament_id = 3
	AND teams.category = 'MIXTO'
	AND teams.stage = 'REGULAR'
	AND teams.name = 'MIXTICOS'
	ORDER BY games.game_date ASC
) AS graph