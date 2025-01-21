CREATE DEFINER=`root`@`localhost` PROCEDURE `tvmtz_dev`.`usp_generate_playoff_teams`(
	IN in_tournament INTEGER,
	IN in_category VARCHAR(10),
	IN in_playoff_type INTEGER 
)
BEGIN	
	DECLARE QUARTER_LOCKED INTEGER DEFAULT 0;
	DECLARE SEMI_LOCKED INTEGER DEFAULT 0;
	DECLARE FINAL_LOCKED INTEGER DEFAULT 0;
	-- ========================================================
	-- QUARTER
	-- ========================================================
	SELECT COUNT(*) INTO QUARTER_LOCKED
	FROM playoff_config
	WHERE tournament_id = in_tournament
	AND category = in_category
	AND stage = 'QUARTER'
	AND is_locked = true;
	
	IF QUARTER_LOCKED = 0 THEN
		-- CLEAR playoff_games
		DELETE FROM playoff_games
		WHERE tournament_id = in_tournament
		AND category = in_category; 
	
		-- CLEAR playoff_teams 
		DELETE FROM playoff_teams
		WHERE tournament_id = in_tournament
		AND category = in_category; 
		
		-- INSERT FROM teams TO playoff_teams
		INSERT INTO playoff_teams (tournament_id, category, name, place, stage)
			SELECT 
				in_tournament,
				in_category,
				TEAM_NAME,
				TEAM_POS,
				'QUARTER'
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
						games_won AS TEAM_JG,
						games_won - games_lost AS TEAM_DJ,
						sets_won AS TEAM_SG,
						sets_won - sets_lost AS TEAM_DS,
						points_won AS TEAM_PG,
						points_won - points_lost AS TEAM_DP,
						is_active AS IS_ACTIVE
					FROM teams
					WHERE tournament_id = in_tournament
					AND category = in_category
				) AS teams
			) AS template
			WHERE template.TEAM_POS <= in_playoff_type;
	
		IF in_playoff_type = 6 THEN 
			INSERT INTO playoff_teams (tournament_id, category, name, place, stage)
			SELECT 
				in_tournament,
				in_category,
				name,
				place,
				'SEMI'
			FROM playoff_teams
			WHERE tournament_id = in_tournament
			AND category = in_category
			AND stage = 'QUARTER'
			AND place IN (1,2);

			DELETE FROM playoff_teams
			WHERE tournament_id = in_tournament
			AND category = in_category
			AND stage = 'QUARTER'
			AND place IN (1,2); 
		END IF;
	END IF;

	-- ========================================================
	-- SEMI
	-- ========================================================	
	SELECT COUNT(*) INTO SEMI_LOCKED
	FROM playoff_config
	WHERE tournament_id = in_tournament
	AND category = in_category
	AND stage = 'SEMI'
	AND is_locked = true;
	
	IF SEMI_LOCKED = 0 THEN
		-- CLEAR playoff_games
		DELETE FROM playoff_games
		WHERE tournament_id = in_tournament
		AND category = in_category
		AND stage = 'SEMI'
		AND in_playoff_type != 6;
	
		-- CLEAR playoff_teams 
		DELETE FROM playoff_teams
		WHERE tournament_id = in_tournament
		AND category = in_category
		AND stage = 'SEMI'
		AND IF(in_playoff_type = 6, place NOT IN (1,2), TRUE);
		
		-- INSERT SEMI
		INSERT INTO playoff_teams (tournament_id, category, name, place, stage)
		SELECT 
			in_tournament,
			in_category,
			IF(t1.sets_won > t2.sets_won, t1.name, t2.name) AS winner,
			playoff_games.place,
			'SEMI'			
		FROM playoff_games
		
		INNER JOIN playoff_teams AS t1
		ON playoff_games.team_1 = t1.playoff_team_id
		AND playoff_games.stage = t1.stage
		AND playoff_games.tournament_id = t1.tournament_id
		AND playoff_games.category = t1.category
		
		INNER JOIN playoff_teams AS t2
		ON playoff_games.team_1 = t2.playoff_team_id
		AND playoff_games.stage = t2.stage
		AND playoff_games.tournament_id = t2.tournament_id
		AND playoff_games.category = t2.category
		
		WHERE playoff_games.tournament_id = in_tournament
		AND playoff_games.category = in_category
		AND playoff_games.stage = 'QUARTER'
		AND (playoff_games.team_1_score != 0 OR playoff_games.team_2_score != 0);

	END IF;
	-- ========================================================
	-- FINAL
	-- ========================================================	
	SELECT COUNT(*) INTO FINAL_LOCKED
	FROM playoff_config
	WHERE tournament_id = in_tournament
	AND category = in_category
	AND stage = 'FINAL'
	AND is_locked = true;
	
	IF FINAL_LOCKED = 0 THEN
		-- CLEAR playoff_games
		DELETE FROM playoff_games
		WHERE tournament_id = in_tournament
		AND category = in_category
		AND stage IN ('FINAL','THIRD');
	
		-- CLEAR playoff_teams 
		DELETE FROM playoff_teams
		WHERE tournament_id = in_tournament
		AND category = in_category
		AND stage IN ('FINAL','THIRD');
		
		-- INSERT FINAL
		INSERT INTO playoff_teams (tournament_id, category, name, place, stage)
		SELECT 
			in_tournament,
			in_category,
			IF(t1.sets_won > t2.sets_won, t1.name, t2.name) AS winner,
			playoff_games.place,
			'FINAL'			
		FROM playoff_games
		
		INNER JOIN playoff_teams AS t1
		ON playoff_games.team_1 = t1.playoff_team_id
		AND playoff_games.stage = t1.stage
		AND playoff_games.tournament_id = t1.tournament_id
		AND playoff_games.category = t1.category
		
		INNER JOIN playoff_teams AS t2
		ON playoff_games.team_2 = t2.playoff_team_id
		AND playoff_games.stage = t2.stage
		AND playoff_games.tournament_id = t2.tournament_id
		AND playoff_games.category = t2.category
		
		WHERE playoff_games.tournament_id = in_tournament
		AND playoff_games.category = in_category
		AND playoff_games.stage = 'SEMI'
		AND (playoff_games.team_1_score != 0 OR playoff_games.team_2_score != 0);
		
		-- INSERT THIRD
		INSERT INTO playoff_teams (tournament_id, category, name, place, stage)
		SELECT 
			in_tournament,
			in_category,
			IF(t1.sets_won < t2.sets_won, t1.name, t2.name) AS losser,
			playoff_games.place,
			'THIRD'			
		FROM playoff_games
		
		INNER JOIN playoff_teams AS t1
		ON playoff_games.team_1 = t1.playoff_team_id
		AND playoff_games.stage = t1.stage
		AND playoff_games.tournament_id = t1.tournament_id
		AND playoff_games.category = t1.category
		
		INNER JOIN playoff_teams AS t2
		ON playoff_games.team_2 = t2.playoff_team_id
		AND playoff_games.stage = t2.stage
		AND playoff_games.tournament_id = t2.tournament_id
		AND playoff_games.category = t2.category
		
		WHERE playoff_games.tournament_id = in_tournament
		AND playoff_games.category = in_category
		AND playoff_games.stage = 'SEMI'
		AND (playoff_games.team_1_score != 0 OR playoff_games.team_2_score != 0);
		
	END IF;
END;