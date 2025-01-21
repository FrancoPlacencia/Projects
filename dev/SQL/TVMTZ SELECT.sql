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
AND games.week_number = 14
AND games.game_id = 754
AND games.game_date LIKE '2024-11-26%'


(754,2,'MIXTO',14,'2024-12-17 19:30:00','ABAJO',53,1,2,61,21,25,15,0,0,49,0,1,46,25,12,9,0,0,0),
SELECT *
		FROM tournaments
		WHERE is_active = true

SELECT *
FROM teams
WHERE tournament_id = 2 
AND category ='FEMENIL'


SELECT *
FROM teams
WHERE tournament_id = 2 

[[Torneo_Otoño_Invierno_2024_Femenil_NOVAS|NOVAS]]


SELECT * FROM TEAMS;



SELECT players.*, games.*
FROM games_played

INNER JOIN players
ON players.player_id = games_played.player_id 

INNER JOIN teams
ON teams.team_id = players.team_id

INNER JOIN games
ON games.game_id = games_played.game_id
WHERE games.tournament_id = 2
AND games.week_number = 7
AND games.category = 'VARONIL'

AND teams.name = 'CUERVOS'

AND players.number IN (4,904)



SELECT 
	GROUP_CONCAT(
		'{{Standings_Line',
		'|TEAM_POS=',TEAM_POS,
		'|TEAM_NAME=',TEAM_NAME,
		
		'}}'
		ORDER BY TEAM_POS ASC
		SEPARATOR '\n'
	) 
	FROM (
		SELECT 
		ROW_NUMBER() OVER (
		ORDER BY 
			IS_ACTIVE DESC,
			TEAM_JG DESC,
			TEAM_DJ DESC,
			TEAM_SG DESC,
			TEAM_DS DESC,
			TEAM_PG DESC,
			TEAM_DP DESC
		) AS TEAM_POS,
		teams.*
		FROM (
			SELECT 
				name AS TEAM_NAME, 
				image AS TEAM_URL,
				games_won + games_lost AS TEAM_JJ,
				games_won AS TEAM_JG,
				games_lost AS TEAM_JP,
				games_won - games_lost AS TEAM_DJ,
				sets_won AS TEAM_SG,
				sets_lost AS TEAM_SP,
				sets_won - sets_lost AS TEAM_DS,
				points_won AS TEAM_PG,
				points_lost AS TEAM_PP,
				points_won - points_lost AS TEAM_DP,
				CONCAT('team-',fn_get_category_class(in_category),'-',team_number, IF(is_active, '',' withdraw')) AS TEAM_STYLE,
				is_active AS IS_ACTIVE
			FROM teams
			WHERE tournament_id = 2
			AND category = 'FEMENIL'
		) AS teams
	) AS template;






