SET FOREIGN_KEY_CHECKS=0;

DROP TABLE IF EXISTS tvmtz_dev.games;
DROP TABLE IF EXISTS tvmtz_dev.games_played;
DROP TABLE IF EXISTS tvmtz_dev.players;
DROP TABLE IF EXISTS tvmtz_dev.teams;
DROP TABLE IF EXISTS tvmtz_dev.tournaments;

DELETE FROM tvmtz_dev.teams WHERE 1=1;
DELETE FROM tvmtz_dev.tournaments WHERE 1=1;

CREATE TABLE tvmtz_dev.tournaments (
	tournament_uuid UUID NOT NULL DEFAULT UUID(),
	name VARCHAR(50) NOT NULL,
	year INTEGER NOT NULL,
	description VARCHAR(255) NOT NULL,
	rounds INTEGER NOT NULL,
	url VARCHAR(255) NOT NULL,
	CONSTRAINT PK_tournaments PRIMARY KEY (tournament_uuid),
	CONSTRAINT UC_tournaments UNIQUE(name, year)
);
	
CREATE TABLE teams (
	team_uuid UUID NOT NULL DEFAULT UUID(),
	tournament_uuid UUID NOT NULL,
	name VARCHAR(20) NOT NULL,
	initials VARCHAR(8) NOT NULL DEFAULT '',
	category ENUM('MIXTO','FEMENIL','VARONIL') NOT NULL,
	image VARCHAR(255),
	is_active BOOLEAN NOT NULL DEFAULT TRUE,
	
	games_won INTEGER NOT NULL DEFAULT 0,
	games_lost INTEGER NOT NULL DEFAULT 0,
		
	sets_won INTEGER NOT NULL DEFAULT 0,
	sets_lost INTEGER NOT NULL DEFAULT 0,
	
	points_won INTEGER NOT NULL DEFAULT 0,
	points_lost INTEGER NOT NULL DEFAULT 0,
	
	CONSTRAINT PK_teams PRIMARY KEY (team_uuid),
	CONSTRAINT FK_teams_tournament FOREIGN KEY (tournament_uuid) REFERENCES tournaments (tournament_uuid),
	CONSTRAINT UC_teams_name_tournament UNIQUE (name, category, tournament_uuid)
);

CREATE TABLE players (
	player_uuid UUID NOT NULL DEFAULT UUID(),
	team_uuid	UUID NOT NULL,
	name 		varchar(100) NOT NULL,
	last_name	varchar(100) DEFAULT '',
	number		INTEGER NOT NULL,
	
	CONSTRAINT PK_players PRIMARY KEY (player_uuid),
	CONSTRAINT FK_player_team FOREIGN KEY (team_uuid) REFERENCES teams(team_uuid)
);

CREATE TABLE games (
	game_uuid UUID NOT NULL DEFAULT UUID(),
	tournament_uuid UUID NOT NULL,
	category ENUM('MIXTO','FEMENIL','VARONIL') NOT NULL,
	week_number INTEGER NOT NULL,

	game_date  DATETIME NOT NULL,
	game_place VARCHAR(10) NOT NULL,
	
	
	team_1 UUID NOT NULL,
	team_1_score INTEGER DEFAULT 0,
	team_1_sets INTEGER DEFAULT 0,
	team_1_points INTEGER DEFAULT 0,
	
	team_1_set_1_pts INTEGER DEFAULT 0,
	team_1_set_2_pts INTEGER DEFAULT 0,
	team_1_set_3_pts INTEGER DEFAULT 0,
	team_1_set_4_pts INTEGER DEFAULT 0,
	team_1_set_5_pts INTEGER DEFAULT 0,

	
	team_2 UUID NOT NULL,
	team_2_score INTEGER DEFAULT 0,	
	team_2_sets INTEGER DEFAULT 0,
	team_2_points INTEGER DEFAULT 0,
	
	team_2_set_1_pts INTEGER DEFAULT 0,
	team_2_set_2_pts INTEGER DEFAULT 0,
	team_2_set_3_pts INTEGER DEFAULT 0,
	team_2_set_4_pts INTEGER DEFAULT 0,
	team_2_set_5_pts INTEGER DEFAULT 0,
	
	by_default BOOLEAN DEFAULT FALSE, 
	CONSTRAINT PK_games PRIMARY KEY (game_uuid),
	
	CONSTRAINT FK_games_tournament FOREIGN KEY (tournament_uuid) REFERENCES tournaments (tournament_uuid),
	CONSTRAINT FK_games_team_1 FOREIGN KEY (team_1) REFERENCES teams(team_uuid),
	CONSTRAINT FK_games_team_2 FOREIGN KEY (team_2) REFERENCES teams(team_uuid),
	CONSTRAINT UC_games_match UNIQUE (tournament_uuid,category,week_number,game_date,team_1,team_2)
);


CREATE TABLE games_played (
	player_uuid UUID NOT NULL,
	game_uuid	UUID NOT NULL,
	CONSTRAINT PK_games_played PRIMARY KEY (player_uuid, game_uuid),
	CONSTRAINT FK_games_played_player FOREIGN KEY (player_uuid) REFERENCES players(player_uuid),
	CONSTRAINT FK_games_played_game FOREIGN KEY (game_uuid) REFERENCES games(game_uuid)
);