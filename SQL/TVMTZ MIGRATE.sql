INSERT INTO tvmtz_stg.tournaments (tournament_id, name, t_year, description, url, is_active)
SELECT tournament_id, name, t_year, description, url, is_active
FROM tvmtz_dev.tournaments;

INSERT INTO tvmtz_stg.teams (team_id, tournament_id, team_number, name, initials, category, image, is_active, games_won, games_lost, sets_won, sets_lost, points_won, points_lost)
SELECT team_id, tournament_id, team_number, name, initials, category, image, is_active, games_won, games_lost, sets_won, sets_lost, points_won, points_lost
FROM tvmtz_dev.teams;

INSERT INTO tvmtz_stg.games (
	game_id, tournament_id, category, week_number, game_date, game_place, 
	team_1, team_1_score, team_1_points, team_1_set_1_pts, team_1_set_2_pts, team_1_set_3_pts, team_1_set_4_pts, team_1_set_5_pts,
	team_2, team_2_score, team_2_points, team_2_set_1_pts, team_2_set_2_pts, team_2_set_3_pts, team_2_set_4_pts, team_2_set_5_pts
)
SELECT 
	game_id, tournament_id, category, week_number, game_date, game_place, 
	team_1, team_1_score, team_1_points, team_1_set_1_pts, team_1_set_2_pts, team_1_set_3_pts, team_1_set_4_pts, team_1_set_5_pts,
	team_2, team_2_score, team_2_points, team_2_set_1_pts, team_2_set_2_pts, team_2_set_3_pts, team_2_set_4_pts, team_2_set_5_pts
FROM tvmtz_dev.games;
