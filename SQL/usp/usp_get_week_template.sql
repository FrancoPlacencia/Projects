CREATE DEFINER=`root`@`localhost` PROCEDURE `tvmtz_dev`.`usp_get_week_template`(
	IN in_week_number INTEGER,
	OUT out_template TEXT
)
BEGIN
	DECLARE activeTournament INTEGER DEFAULT 0;

	SET lc_time_names = 'es_ES';

	SET activeTournament := (
		SELECT tournament_id
		FROM tournaments
		WHERE is_active = true
	);

	CALL usp_update_team();

	SELECT GROUP_CONCAT(
		GameDayNew
		ORDER BY dayWeek ASC 
		SEPARATOR '\n'
	) INTO out_template
	FROM (
		SELECT 
		CONCAT(
			'{{GameDayNew|Day=', game_text, '\n', gameLine, '}}'
		) AS GameDayNew,
		dayWeek
		FROM (	
			SELECT 
			GROUP_CONCAT(
				'|GameLine_',seqNum,'=',gameLine
				SEPARATOR '\n'
			) AS gameLine,
			game_text,
			dayWeek
			FROM (
				SELECT 
				(
			        CASE dayWeek
			        WHEN @dateChanged
			        THEN @seqNum := @seqNum + 1 
			        ELSE @seqNum := 1 AND @dateChanged := dayWeek END
				)  AS seqNum,
				UPPER(DATE_FORMAT(game_date, '%W %d %M')) AS game_text,
				gameLine,
				dayWeek
				FROM (
					SELECT 
					CONCAT(
					'{{GameLineNew',
						'|TIME=',DATE_FORMAT(game_date, '%h:%i %p'),
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
						fn_get_set_info(team_1_set_1_pts,team_2_set_1_pts, 1, 1, by_default),
						fn_get_set_info(team_1_set_2_pts,team_2_set_2_pts, 1, 2, by_default),
						fn_get_set_info(team_1_set_3_pts,team_2_set_3_pts, 1, 3, by_default),
						fn_get_set_info(team_1_set_4_pts,team_2_set_4_pts, 1, 4, by_default),
						fn_get_set_info(team_1_set_5_pts,team_2_set_5_pts, 1, 5, by_default),
						'|TEAM_1_COLOR=',fn_is_winner(team_1_sets, team_2_sets, by_default),
						'|TEAM_2=',team_2.name,
						'|TEAM_2_SETS=',team_2_sets,
						fn_get_set_info(team_2_set_1_pts,team_1_set_1_pts, 2, 1, by_default),
						fn_get_set_info(team_2_set_2_pts,team_1_set_2_pts, 2, 2, by_default),
						fn_get_set_info(team_2_set_3_pts,team_1_set_3_pts, 2, 3, by_default),
						fn_get_set_info(team_2_set_4_pts,team_1_set_4_pts, 2, 4, by_default),
						fn_get_set_info(team_2_set_5_pts,team_1_set_5_pts, 2, 5, by_default),
						'|TEAM_2_COLOR=',fn_is_winner(team_2_sets, team_1_sets, by_default),
					'}}') AS gameLine,
					game_date, 
					game_place,
					IF(game_place = 'ARRIBA', 0, 1) AS game_place_order,
					UPPER(DATE_FORMAT(game_date, '%W %d %M')) AS game_date_str,
					dayofweek(game_date) AS dayWeek,
					row_number() over (order by game_date, IF(game_place = 'ARRIBA', 0, 1) ASC)
					
					FROM games
					
					INNER JOIN teams team_1
					ON team_1.team_id = games.team_1
					
					INNER JOIN teams team_2
					ON team_2.team_id = games.team_2
					
					WHERE games.tournament_id = activeTournament
					AND week_number = in_week_number
			
				) AS gameLines
				INNER JOIN (SELECT @seqNum := 0, @dateChanged := 0) AS s
			) AS games
			GROUP BY game_text
		) AS game_week
	) AS game_template;

	SELECT CONCAT(
		'==Jornada ',in_week_number,'==\n', 
		fn_get_links(''), '\n', 
		out_template
	); 
END;