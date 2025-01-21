CREATE DEFINER=`root`@`localhost` PROCEDURE `tvmtz_dev`.`usp_generate_playoff_games`(
	IN in_tournament INTEGER,
	IN in_category VARCHAR(10),
	IN in_playoff_type INTEGER
)
BEGIN
	DECLARE QUARTER_LOCKED INTEGER DEFAULT 0;
	DECLARE q_team_1 INTEGER DEFAULT 0;
	DECLARE q_team_2 INTEGER DEFAULT 0;
	DECLARE q_team_3 INTEGER DEFAULT 0;
	DECLARE q_team_4 INTEGER DEFAULT 0;
	DECLARE q_team_5 INTEGER DEFAULT 0;
	DECLARE q_team_6 INTEGER DEFAULT 0;
	DECLARE q_team_7 INTEGER DEFAULT 0;
	DECLARE q_team_8 INTEGER DEFAULT 0;

	DECLARE SEMI_LOCKED INTEGER DEFAULT 0;
	DECLARE s_team_1 INTEGER DEFAULT 0;
	DECLARE s_team_2 INTEGER DEFAULT 0;
	DECLARE s_team_3 INTEGER DEFAULT 0;
	DECLARE s_team_4 INTEGER DEFAULT 0;
	
	DECLARE FINAL_LOCKED INTEGER DEFAULT 0;
	DECLARE f_team_1 INTEGER DEFAULT 0;
	DECLARE f_team_2 INTEGER DEFAULT 0;
	DECLARE t_team_1 INTEGER DEFAULT 0;
	DECLARE t_team_2 INTEGER DEFAULT 0;

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
		DELETE FROM playoff_games
		WHERE tournament_id = in_tournament
		AND category = in_category
		AND stage = 'QUARTER';
	
		SELECT playoff_team_id INTO q_team_1
		FROM playoff_teams 
		WHERE tournament_id = in_tournament
		AND category = in_category
		AND place = 1
		AND stage = 'QUARTER';
		
		SELECT playoff_team_id INTO q_team_2
		FROM playoff_teams 
		WHERE tournament_id = in_tournament
		AND category = in_category
		AND place = 2
		AND stage = 'QUARTER';
		
		SELECT playoff_team_id INTO q_team_3
		FROM playoff_teams 
		WHERE tournament_id = in_tournament
		AND category = in_category
		AND place = 3
		AND stage = 'QUARTER';
		
		SELECT playoff_team_id INTO q_team_4
		FROM playoff_teams 
		WHERE tournament_id = in_tournament
		AND category = in_category
		AND place = 4
		AND stage = 'QUARTER';
		
		SELECT playoff_team_id INTO q_team_5
		FROM playoff_teams 
		WHERE tournament_id = in_tournament
		AND category = in_category
		AND place = 5
		AND stage = 'QUARTER';
		
		SELECT playoff_team_id INTO q_team_6
		FROM playoff_teams 
		WHERE tournament_id = in_tournament
		AND category = in_category
		AND place = 6
		AND stage = 'QUARTER';
		
		SELECT playoff_team_id INTO q_team_7
		FROM playoff_teams 
		WHERE tournament_id = in_tournament
		AND category = in_category
		AND place = 7
		AND stage = 'QUARTER';
		
		SELECT playoff_team_id INTO q_team_8
		FROM playoff_teams 
		WHERE tournament_id = in_tournament
		AND category = in_category
		AND place = 8
		AND stage = 'QUARTER';
		
		INSERT INTO playoff_games (tournament_id, category, stage, place ,team_1, team_2)
		SELECT in_tournament, in_category, 'QUARTER', 1, q_team_1, q_team_8 FROM DUAL WHERE q_team_1 != 0 AND q_team_8 != 0
		UNION ALL 
		SELECT in_tournament, in_category, 'QUARTER', 2, q_team_2, q_team_7 FROM DUAL WHERE q_team_2 != 0 AND q_team_7 != 0
		UNION ALL
		SELECT in_tournament, in_category, 'QUARTER', 4, q_team_3, q_team_6 FROM DUAL WHERE q_team_3 != 0 AND q_team_6 != 0
		UNION ALL
		SELECT in_tournament, in_category, 'QUARTER', 3, q_team_4, q_team_5 FROM DUAL WHERE q_team_4 != 0 AND q_team_5 != 0;
	END IF;

		
	-- ========================================================
	-- SEMI
	-- ========================================================
	SELECT COUNT(*) INTO QUARTER_LOCKED
	FROM playoff_config
	WHERE tournament_id = in_tournament
	AND category = in_category
	AND stage = 'SEMI'
	AND is_locked = true;
	
	IF QUARTER_LOCKED = 0 THEN
		DELETE FROM playoff_games
		WHERE tournament_id = in_tournament
		AND category = in_category
		AND stage = 'SEMI'
		AND IF(in_playoff_type = 6, place NOT IN (1,2), TRUE);
	
		SELECT playoff_team_id INTO s_team_1
		FROM playoff_teams 
		WHERE tournament_id = in_tournament
		AND category = in_category
		AND place = 1
		AND stage = 'SEMI';
		
		SELECT playoff_team_id INTO s_team_2
		FROM playoff_teams 
		WHERE tournament_id = in_tournament
		AND category = in_category
		AND place = 2
		AND stage = 'SEMI';
		
		SELECT playoff_team_id INTO s_team_3
		FROM playoff_teams 
		WHERE tournament_id = in_tournament
		AND category = in_category
		AND place = 3
		AND stage = 'SEMI';
		
		SELECT playoff_team_id INTO s_team_4
		FROM playoff_teams 
		WHERE tournament_id = in_tournament
		AND category = in_category
		AND place = 4
		AND stage = 'SEMI';
		
		INSERT INTO playoff_games (tournament_id, category, stage, place ,team_1, team_2)
		SELECT in_tournament, in_category, 'SEMI', 1, s_team_1, s_team_3 FROM DUAL WHERE s_team_1 != 0 AND s_team_3 != 0
		UNION ALL 
		SELECT in_tournament, in_category, 'SEMI', 2, s_team_2, s_team_4 FROM DUAL WHERE s_team_2 != 0 AND s_team_4 != 0;
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
		DELETE FROM playoff_games
		WHERE tournament_id = in_tournament
		AND category = in_category
		AND stage IN ('FINAL','THIRD');
	
		SELECT playoff_team_id INTO f_team_1
		FROM playoff_teams 
		WHERE tournament_id = in_tournament
		AND category = in_category
		AND place = 1
		AND stage = 'FINAL';
		
		SELECT playoff_team_id INTO f_team_2
		FROM playoff_teams 
		WHERE tournament_id = in_tournament
		AND category = in_category
		AND place = 2
		AND stage = 'FINAL';
		
		SELECT playoff_team_id INTO t_team_1
		FROM playoff_teams 
		WHERE tournament_id = in_tournament
		AND category = in_category
		AND place = 1
		AND stage = 'THIRD';
		
		SELECT playoff_team_id INTO t_team_2
		FROM playoff_teams 
		WHERE tournament_id = in_tournament
		AND category = in_category
		AND place = 2
		AND stage = 'THIRD';
		
		INSERT INTO playoff_games (tournament_id, category, stage, place ,team_1, team_2)
		SELECT in_tournament, in_category, 'FINAL', 1, f_team_1, f_team_2 FROM DUAL WHERE f_team_1 != 0 AND f_team_2 != 0
		UNION ALL 
		SELECT in_tournament, in_category, 'THIRD', 1, t_team_1, t_team_2 FROM DUAL WHERE t_team_1 != 0 AND t_team_2 != 0;
	END IF;
END;