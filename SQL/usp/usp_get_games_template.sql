CREATE DEFINER=`root`@`localhost` PROCEDURE `tvmtz_dev`.`usp_get_games_template`(
	IN in_category VARCHAR(10),
	OUT out_template TEXT
)
BEGIN
	DECLARE activeTournament INTEGER DEFAULT 0;
	DECLARE teamsSize INTEGER DEFAULT 0;
	DECLARE teamIndex INTEGER DEFAULT 1;
	DECLARE vsTeamIndex INTEGER DEFAULT 1;

	DECLARE TEXT_OUTPUT TEXT DEFAULT '';
	DECLARE TEAM_OUTPUT TEXT DEFAULT '';
	DECLARE HEADER_OUTPUT TEXT DEFAULT '';

	SET activeTournament := (
		SELECT tournament_id
		FROM tournaments
		WHERE is_active = true
	);

	SELECT COUNT(*) INTO teamsSize
	FROM teams
	WHERE tournament_id = activeTournament
	AND category = in_category;

	SET HEADER_OUTPUT := CONCAT('{{GameTableLine|TEAMS_SIZE=',teamsSize);
	
	WHILE teamIndex <= teamsSize DO		
		SELECT 
			CONCAT(TEXT_OUTPUT,'{{GameTableLine|TEAMS_SIZE=',teamsSize,'|TEAM_NAME=',name ,'|TEAM_COLOR=',fn_get_category_class(in_category),'-color team-',fn_get_category_class(in_category),'-',teamIndex),
			CONCAT(HEADER_OUTPUT, '|VS_TEAM_',teamIndex,'=',initials,'|VS_TEAM_', teamIndex, '_COLOR=grid_table-vertical-header ',fn_get_category_class(in_category),'-color') 
			INTO TEXT_OUTPUT, HEADER_OUTPUT
		FROM teams
		WHERE tournament_id = activeTournament
		AND category = in_category
		AND team_number = teamIndex;
	
		WHILE vsTeamIndex <= teamsSize DO
			IF teamIndex = vsTeamIndex THEN
				SELECT CONCAT('|VS_TEAM_', teamIndex, '=-|VS_TEAM_', vsTeamIndex, '_COLOR=team-',fn_get_category_class(in_category),'-',teamIndex) INTO TEAM_OUTPUT;
			ELSE 
				SELECT CONCAT('|VS_TEAM_', vs_number, '=', t_score,'-', vs_score, '|VS_TEAM_', vs_number, '_COLOR=', fn_is_winner_result(t_score,vs_score), ' team-',fn_get_category_class(in_category),'-',teamIndex) INTO TEAM_OUTPUT 
				FROM (
					SELECT 
						t1.team_number AS t_number,
						t1.name AS t_name,
						games.team_1_score AS t_score,
						t2.team_number AS vs_number,
						t2.name AS vs_name,
						games.team_2_score AS vs_score
					FROM games
					
					INNER JOIN teams t1 ON t1.team_id = games.team_1 
					INNER JOIN teams t2 ON t2.team_id = games.team_2
					
					WHERE games.tournament_id = activeTournament
					AND games.category = in_category
					AND t1.team_number = teamIndex
					AND t2.team_number = vsTeamIndex
					
					UNION ALL 
					SELECT 
						t2.team_number AS t_number,
						t2.name AS t_name,
						games.team_2_score AS t_score,
						t1.team_number AS vs_number,
						t1.name AS vs_name,
						games.team_1_score AS vs_score
					FROM games
					
					INNER JOIN teams t1 ON t1.team_id = games.team_1 
					INNER JOIN teams t2 ON t2.team_id = games.team_2
					
					WHERE games.tournament_id = activeTournament
					AND games.category = in_category
					AND t2.team_number = teamIndex
					AND t1.team_number = vsTeamIndex
				) AS team_games;
			END IF;
	
			SET TEAM_OUTPUT := IF(
				TEAM_OUTPUT = '',
				CONCAT('|VS_TEAM_', vsTeamIndex, '=0-0|VS_TEAM_', vsTeamIndex, '_COLOR=draw-result team-',fn_get_category_class(in_category),'-',teamIndex),
				TEAM_OUTPUT
			);

			SELECT CONCAT(TEXT_OUTPUT, TEAM_OUTPUT) INTO TEXT_OUTPUT;
			-- SELECT TEAM_OUTPUT;
			SET TEAM_OUTPUT := '';
			SET vsTeamIndex := vsTeamIndex + 1;
		END WHILE;
	
		SELECT CONCAT(TEXT_OUTPUT, '}}\n') INTO TEXT_OUTPUT;
		SET teamIndex := teamIndex + 1;
		SET vsTeamIndex := 1;
	END WHILE;

	SELECT CONCAT(HEADER_OUTPUT,'}}',TEXT_OUTPUT) INTO TEXT_OUTPUT;

	SET out_template := TEXT_OUTPUT;
END;