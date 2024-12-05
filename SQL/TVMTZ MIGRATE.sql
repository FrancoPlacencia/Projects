SELECT * FROM tvmtz_stg.tournaments

-- TOURNAMENTS
INSERT INTO tvmtz_dev.tournaments (
	tournament_id, name, year, 
	description, url, is_active
)
SELECT 
	tournament_id, name, t_year, 
	description,  url, is_active
FROM tvmtz_stg.tournaments;

-- TEAMS
INSERT INTO tvmtz_dev.teams ( 
	team_id, tournament_id, 
	name, initials, category, is_active,
	games_won, games_lost,
	sets_won, sets_lost,
	points_won, points_lost
)
SELECT 
	team_id, tournament_id, 
	name, initials, category, is_active,
	games_won, games_lost,
	sets_won, sets_lost,
	points_won, points_lost
FROM tvmtz_stg.teams;

-- PLAYERS
INSERT INTO tvmtz_dev.players (
	player_id, team_id, 
	name, last_name, number
)
SELECT 
	player_id, team_id, 
	name, last_name, number
FROM tvmtz_stg.players;

-- GAMES
INSERT INTO tvmtz_dev.games (
	game_id, tournament_id, category, week_number, game_date, game_place, 
	team_1, team_1_score, team_1_points, team_1_set_1_pts, team_1_set_2_pts, team_1_set_3_pts, team_1_set_4_pts, team_1_set_5_pts,
	team_2, team_2_score, team_2_points, team_2_set_1_pts, team_2_set_2_pts, team_2_set_3_pts, team_2_set_4_pts, team_2_set_5_pts
)
SELECT 
	game_id, tournament_id, category, week_number, game_date, game_place, 
	team_1, team_1_score, team_1_points, team_1_set_1_pts, team_1_set_2_pts, team_1_set_3_pts, team_1_set_4_pts, team_1_set_5_pts,
	team_2, team_2_score, team_2_points, team_2_set_1_pts, team_2_set_2_pts, team_2_set_3_pts, team_2_set_4_pts, team_2_set_5_pts
FROM tvmtz_stg.games;

-- GAMES PLAYED
INSERT INTO tvmtz_dev.games_played (
	games_played_id, player_id, game_id
)
SELECT games_played_id, player_id, game_id 
FROM tvmtz_stg.games_played;

