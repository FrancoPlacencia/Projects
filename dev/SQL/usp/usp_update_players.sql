CREATE DEFINER=`root`@`localhost` PROCEDURE `tvmtz_dev`.`usp_update_players`()
BEGIN
	DECLARE activeTournament INTEGER DEFAULT 0;

	SET activeTournament := (
		SELECT tournament_id
		FROM tournaments
		WHERE is_active = true
	);


	UPDATE players,(
		SELECT sum(total_games) AS total_games, team_id AS team_id
		FROM (
			SELECT count(*) AS total_games, team_1 AS team_id
			FROM games
			INNER JOIN teams t1 ON t1.team_id = games.team_1
			WHERE games.tournament_id = activeTournament
			GROUP BY games.team_1
			UNION ALL
			SELECT count(*) AS total_games, team_2 AS team
			FROM games
			INNER JOIN teams t2 ON t2.team_id = games.team_2
			WHERE games.tournament_id = activeTournament
			GROUP BY games.team_2
		) AS games_grouped
		GROUP BY team_id
	) AS games	
	SET games_total = games.total_games
	WHERE players.team_id  = games.team_id;



	UPDATE players,(
		SELECT count(*) AS played, players.player_id  AS player_id
		FROM players
		INNER JOIN games_played 
		ON players.player_id = games_played.player_id
		GROUP BY players.player_id
	) AS games
	SET games_played = games.played
	WHERE games.player_id = players.player_id;

	UPDATE players
	SET games_percentage = games_played / games_total * 100
	WHERE 1 = 1;
END;