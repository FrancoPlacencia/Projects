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

SELECT * FROM teams WHERE tournament_id = 2 AND category ='MIXTO' ORDER BY name ASC;



SELECT *
FROM players p
WHERE player_id = 24


UPDATE players
SET games_played = 11
WHERE player_id = 24

UPDATE players,(
	SELECT sum(total_games) AS total_games, team_id AS team_id
	FROM (
		SELECT count(*) AS total_games, team_1 AS team_id
		FROM games
		INNER JOIN teams t1 ON t1.team_id = games.team_1
		WHERE games.tournament_id = 2
		GROUP BY games.team_1
		UNION ALL
		SELECT count(*) AS total_games, team_2 AS team
		FROM games
		INNER JOIN teams t2 ON t2.team_id = games.team_2
		WHERE games.tournament_id = 2
		GROUP BY games.team_2
	) AS games_grouped
	GROUP BY team_id
) AS games

SET games_total = games.total_games
WHERE players.team_id  = games.team_id 


UPDATE players,(
	SELECT count(*) AS played, players.player_id  AS player_id
	FROM players
	INNER JOIN games_played 
	ON players.player_id = games_played.player_id
	GROUP BY players.player_id
) AS games
SET games_played = games.played
WHERE games.player_id = players.player_id 

