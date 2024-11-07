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
AND games.week_number = 9


DELETE FROM games WHERE game_id IN (461,473,484)
29- 59
SELECT * FROM TEAMS WHERE tournament_id = 2 AND category = 'MIXTO'

INSERT INTO games (
	tournament_id, category, week_number, game_date, game_place, 
	team_1, team_1_set_1_pts, team_1_set_2_pts,
	team_2, team_2_set_1_pts, team_2_set_2_pts
)
SELECT 
	2, 'FEMENIL', 5, '2024-10-09 18:00:00.000', 'ARRIBA', 
	32, 0, 0,
	31, 25, 25
FROM DUAL


SELECT 
CONCAT ('<div>[[Torneo_Otoño_Invierno_2024_Jornada ',,'|<span class="button_link game_link">Jornada ',DISTINCT week_number,'</span>]]</div>')
FROM games WHERE tournament_id = 2

se

SELECT 
CONCAT('<div class="buttons_in_line">\n',
GROUP_CONCAT (
	'<div>[[Torneo_Otoño_Invierno_2024_Jornada ',week_number,
	'|<span class="button_link game_link">Jornada ',week_number,
	'</span>]]</div>'
	ORDER BY week_number
	SEPARATOR '\n'
) ,
'\n</div>'
)
FROM (
	SELECT DISTINCT week_number AS week_number
	FROM games
	WHERE tournament_id = 2
) AS weeks

