CREATE DEFINER=`root`@`localhost` PROCEDURE `tvmtz_dev`.`usp_update_team`()
BEGIN
	DECLARE activeTournament INTEGER DEFAULT 0;

	SET activeTournament := (
		SELECT tournament_id
		FROM tournaments
		WHERE is_active = true
	);

	UPDATE games SET
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
	WHERE tournament_id = activeTournament;
	
	UPDATE games SET
	team_1_score = (
		IF(team_1_sets > team_2_sets, 1, 0)
	),
	team_2_score = (
		IF(team_2_sets > team_1_sets, 1, 0)
	)
	WHERE tournament_id = activeTournament;
	
	UPDATE teams,(
		SELECT
			games.team_id,
			SUM(games.scores_won) AS games_won,
			sum(games.scores_lost) AS games_lost,
			SUM(games.sets_won) AS sets_won,
			SUM(games.sets_lost) AS sets_lost,
			SUM(games.points_won) AS points_won,
			SUM(games.points_lost) AS points_lost
		FROM (
			SELECT
				teams.team_id AS team_id,
				games.team_1_score AS scores_won,
				games.team_2_score AS scores_lost,	
				games.team_1_sets AS sets_won,
				games.team_2_sets AS sets_lost,
				games.team_1_points AS points_won,
				games.team_2_points AS points_lost
			FROM teams
			INNER JOIN games
			ON games.team_1 = teams.team_id
			AND games.tournament_id = teams.tournament_id
			WHERE teams.tournament_id = activeTournament
			
			UNION ALL
			
			SELECT
				teams.team_id AS team_id,
				games.team_2_score AS scores_won,
				games.team_1_score AS scores_lost,
				games.team_2_sets AS sets_won,
				games.team_1_sets AS sets_lost,
				games.team_2_points AS points_won,
				games.team_1_points AS points_lost
			FROM teams
			INNER JOIN games
			ON games.team_2 = teams.team_id
			AND games.tournament_id = teams.tournament_id
			WHERE teams.tournament_id = activeTournament
		) AS games
		GROUP BY team_id
	) AS games_grouped
	SET
	teams.games_won = games_grouped.games_won,
	teams.games_lost = games_grouped.games_lost,
		
	teams.sets_won = games_grouped.sets_won,
	teams.sets_lost = games_grouped.sets_lost,
	
	teams.points_won = games_grouped.points_won,
	teams.points_lost = games_grouped.points_lost
	
	WHERE teams.team_id = games_grouped.team_id
	AND teams.tournament_id = activeTournament;
END;