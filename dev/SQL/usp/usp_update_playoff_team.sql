CREATE DEFINER=`root`@`localhost` PROCEDURE `tvmtz_dev`.`usp_update_playoff_team`(
	IN in_tournament 	INTEGER,
	IN in_category 		VARCHAR(10)
)
BEGIN
	UPDATE playoff_games SET
	team_1_points = (
		team_1_set_1_pts +
		team_1_set_2_pts +
		team_1_set_3_pts +
		team_1_set_4_pts +
		team_1_set_5_pts
	),
	team_2_points = (
		team_2_set_1_pts +
		team_2_set_2_pts +
		team_2_set_3_pts +
		team_2_set_4_pts +
		team_2_set_5_pts
	),
	team_1_sets = (
		IF(team_1_set_1_pts > team_2_set_1_pts, 1, 0) +
		IF(team_1_set_2_pts > team_2_set_2_pts, 1, 0) +
		IF(team_1_set_3_pts > team_2_set_3_pts, 1, 0) +
		IF(team_1_set_4_pts > team_2_set_4_pts, 1, 0) +
		IF(team_1_set_5_pts > team_2_set_5_pts, 1, 0)
	),
	team_2_sets = (
		IF(team_2_set_1_pts > team_1_set_1_pts , 1, 0) +
		IF(team_2_set_2_pts > team_1_set_2_pts, 1, 0) +
		IF(team_2_set_3_pts > team_1_set_3_pts, 1, 0) +
		IF(team_2_set_4_pts > team_1_set_4_pts, 1, 0) +
		IF(team_2_set_5_pts > team_1_set_5_pts, 1, 0)
	)
	WHERE tournament_id = in_tournament
	AND category = in_category;
	
	UPDATE playoff_games SET
	team_1_score = (
		IF(team_1_sets > team_2_sets, 1, 0)
	),
	team_2_score = (
		IF(team_2_sets > team_1_sets, 1, 0)
	)
	WHERE tournament_id = in_tournament
	AND category = in_category;
	
	UPDATE playoff_teams,(
		SELECT
			games.team_id,
			SUM(games.sets_won) AS sets_won,
			SUM(games.sets_lost) AS sets_lost,
			SUM(games.points_won) AS points_won,
			SUM(games.points_lost) AS points_lost
		FROM (
			SELECT
				playoff_teams.playoff_team_id AS team_id,
				playoff_games.team_1_sets AS sets_won,
				playoff_games.team_2_sets AS sets_lost,
				playoff_games.team_1_points AS points_won,
				playoff_games.team_2_points AS points_lost
			FROM playoff_teams
			INNER JOIN playoff_games
			ON playoff_games.team_1 = playoff_teams.playoff_team_id
			AND playoff_games.tournament_id = playoff_teams.tournament_id
			WHERE playoff_teams.tournament_id = in_tournament
			
			UNION ALL
			
			SELECT
				playoff_teams.playoff_team_id AS team_id,
				playoff_games.team_2_sets AS sets_won,
				playoff_games.team_1_sets AS sets_lost,
				playoff_games.team_2_points AS points_won,
				playoff_games.team_1_points AS points_lost
			FROM playoff_teams
			INNER JOIN playoff_games
			ON playoff_games.team_2 = playoff_teams.playoff_team_id
			AND playoff_games.tournament_id = playoff_teams.tournament_id
			WHERE playoff_teams.tournament_id = in_tournament
		) AS games
		GROUP BY team_id
	) AS games_grouped
	SET
	playoff_teams.sets_won = games_grouped.sets_won,
	playoff_teams.sets_lost = games_grouped.sets_lost,
	
	playoff_teams.points_won = games_grouped.points_won,
	playoff_teams.points_lost = games_grouped.points_lost
	
	WHERE playoff_teams.playoff_team_id = games_grouped.team_id
	AND playoff_teams.tournament_id = in_tournament
	AND category = in_category;
	
	-- UPDATE WINNER OF QUARTER
	UPDATE playoff_teams
	SET is_winner = true
	WHERE playoff_teams.tournament_id = in_tournament
	AND playoff_teams.category = in_category
	AND playoff_teams.stage = 'QUARTER'
	AND playoff_teams.playoff_team_id IN (
		SELECT 
			IF(t1.sets_won > t2.sets_won, t1.playoff_team_id, t2.playoff_team_id) AS winner		
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
		AND playoff_games.stage = 'QUARTER'
		AND (playoff_games.team_1_score != 0 OR playoff_games.team_2_score != 0)
	);
	
	-- UPDATE WINNER OF SEMI
	UPDATE playoff_teams
	SET is_winner = true
	WHERE playoff_teams.tournament_id = in_tournament
	AND playoff_teams.category = in_category
	AND playoff_teams.stage = 'SEMI'
	AND playoff_teams.playoff_team_id IN (
		SELECT 
			IF(t1.sets_won > t2.sets_won, t1.playoff_team_id, t2.playoff_team_id) AS winner		
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
		AND (playoff_games.team_1_score != 0 OR playoff_games.team_2_score != 0)
	);
		
	-- UPDATE WINNER OF FINAL
	UPDATE playoff_teams
	SET is_winner = true, place = 1
	WHERE playoff_teams.tournament_id = in_tournament
	AND playoff_teams.category = in_category
	AND playoff_teams.stage = 'FINAL'
	AND playoff_teams.playoff_team_id IN (
		SELECT 
			IF(t1.sets_won > t2.sets_won, t1.playoff_team_id, t2.playoff_team_id) AS winner		
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
		AND playoff_games.stage = 'FINAL'
		AND (playoff_games.team_1_score != 0 OR playoff_games.team_2_score != 0)
	);
		
	-- UPDATE WINNER OF FINAL
	UPDATE playoff_teams
	SET is_winner = false, place = 2
	WHERE playoff_teams.tournament_id = in_tournament
	AND playoff_teams.category = in_category
	AND playoff_teams.stage = 'FINAL'
	AND playoff_teams.playoff_team_id IN (
		SELECT 
			IF(t1.sets_won < t2.sets_won, t1.playoff_team_id, t2.playoff_team_id) AS winner		
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
		AND playoff_games.stage = 'FINAL'
		AND (playoff_games.team_1_score != 0 OR playoff_games.team_2_score != 0)
	);
		
	-- UPDATE WINNER OF THIRD
	UPDATE playoff_teams
	SET is_winner = true, place = 1
	WHERE playoff_teams.tournament_id = in_tournament
	AND playoff_teams.category = in_category
	AND playoff_teams.stage = 'THIRD'
	AND playoff_teams.playoff_team_id IN (
		SELECT 
			IF(t1.sets_won > t2.sets_won, t1.playoff_team_id, t2.playoff_team_id) AS winner		
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
		AND playoff_games.stage = 'THIRD'
		AND (playoff_games.team_1_score != 0 OR playoff_games.team_2_score != 0)
	);
		
	-- UPDATE LOSSER OF THIRD
	UPDATE playoff_teams
	SET is_winner = false, place = 2
	WHERE playoff_teams.tournament_id = in_tournament
	AND playoff_teams.category = in_category
	AND playoff_teams.stage = 'THIRD'
	AND playoff_teams.playoff_team_id IN (
		SELECT 
			IF(t1.sets_won < t2.sets_won, t1.playoff_team_id, t2.playoff_team_id) AS winner		
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
		AND playoff_games.stage = 'THIRD'
		AND (playoff_games.team_1_score != 0 OR playoff_games.team_2_score != 0)
	);
END;