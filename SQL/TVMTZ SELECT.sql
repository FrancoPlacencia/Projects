SELECT 
CONCAT(
	'{{GameDayNew|Day=', game_text, '\n', gameLine, '}}'
)
FROM (
	SELECT 
	GROUP_CONCAT(
		'|GameLine_',seqNum,'=',gameLine
		ORDER BY game_date ASC, game_place DESC
		SEPARATOR '\n'
	) AS gameLine,
	game_text,
	game_date
	FROM (
		SELECT 
		UPPER(DATE_FORMAT(game_date, '%W %d %M')) AS game_text,
		game_date AS game_date,
		game_place AS game_place,
		(
            CASE UPPER(DATE_FORMAT(game_date, '%W %d %M')) 
            WHEN @daynum 
            THEN @curRow := @curRow + 1 
            ELSE @curRow := 1 AND @daynum := UPPER(DATE_FORMAT(game_date, '%W %d %M')) END
		) + 1 AS seqNum,
		CONCAT(
		'{{GameLineNew',
			'|TIME=',DATE_FORMAT(game_date, '%h:%i %p') ,
			'|PLACE=',game_place,
			'|PLACE_ICON=[[Archivo:Arrow_',IF(game_place = 'ARRIBA', 'up','down'),'.svg]]',
			'|CATEGORY=',
			CASE games.category 
			WHEN 'MIXTO' THEN 'MIX'
			WHEN 'VARONIL' THEN 'VAR'
			WHEN 'FEMENIL' THEN 'FEM'
			ELSE 'ERROR' END,
			'|TEAM_1=',team_1.name,
			'|TEAM_1_SETS=',team_1_sets,
			fn_getSetInfo(team_1_set_1_pts,team_2_set_1_pts, 1, 1),
			fn_getSetInfo(team_1_set_2_pts,team_2_set_2_pts, 1, 2),
			fn_getSetInfo(team_1_set_3_pts,team_2_set_3_pts, 1, 3),
			fn_getSetInfo(team_1_set_4_pts,team_2_set_4_pts, 1, 4),
			fn_getSetInfo(team_1_set_5_pts,team_2_set_5_pts, 1, 5),
			'|TEAM_1_COLOR=',fn_isWinner(team_1_sets,team_2_sets),
			'|TEAM_2=',team_2.name,
			'|TEAM_2_SETS=',team_2_sets,
			fn_getSetInfo(team_2_set_1_pts,team_1_set_1_pts, 2, 1),
			fn_getSetInfo(team_2_set_2_pts,team_1_set_2_pts, 2, 2),
			fn_getSetInfo(team_2_set_3_pts,team_1_set_3_pts, 2, 3),
			fn_getSetInfo(team_2_set_4_pts,team_1_set_4_pts, 2, 4),
			fn_getSetInfo(team_2_set_5_pts,team_1_set_5_pts, 2, 5),
			'|TEAM_2_COLOR=',fn_isWinner(team_2_sets,team_1_sets),
		'}}') AS gameLine
		FROM games
		
		INNER JOIN teams team_1
		ON team_1.team_id = games.team_1
		
		INNER JOIN teams team_2
		ON team_2.team_id = games.team_2
		
		INNER JOIN (SELECT @rowInnerNum:=0, @daynum := '') r
		
		WHERE games.tournament_id = 1
		AND week_number = 5
		ORDER BY game_date ASC, game_place DESC
	
	) AS games
	GROUP BY game_text
	ORDER BY game_date ASC, game_place DESC
) AS gameLines
ORDER BY game_date ASC
