import { TeamStat } from '../model/team-stat.model';
import { Team } from '../model/team.model';
import { Game } from '../model/game.model';
import { SetStat } from '../model/set-stats.model';
import { Tournament } from '../model/tournament.model';
import { Player } from '../model/player.model';
import { TournamentApp } from '../model/tournament-app.model';
import { Standing } from '../model/standing.model';

export function emptyTournament(): Tournament {
  let tournament: Tournament = {
    name: '',
    year: 0,
    description: '',
    rounds: 0,
    url: '',
    isActive: false,
    weeks: [],
  };
  return tournament;
}

export function emptyTournamentApp(): TournamentApp {
  let tournamentApp: TournamentApp = {
    tournament: emptyTournament(),
    standings: new Map<string, Standing[]>(),
    weeks: new Map<number, Map<string, Game[]>>(),
  };
  return tournamentApp;
}

export function emptyTeam(): Team {
  let team: Team = {
    teamNumber: 0,
    name: '',
    initials: '',
    category: '',
    isActive: true,
    gamesWon: 0,
    gamesLost: 0,
    setsWon: 0,
    setsLost: 0,
    pointsWon: 0,
    pointsLost: 0,
    players: [],
  };
  return team;
}

export function emptyTeamStats(): TeamStat {
  let setStats: SetStat[] = [];
  for (let i = 0; i < 5; i++) {
    setStats[i] = emptySetStat(i + 1);
  }
  let teamStat: TeamStat = {
    teamId: 0,
    teamName: '',
    score: 0,
    sets: 0,
    points: 0,
    state: '',
    setStats: setStats,
    players: [],
  };
  return teamStat;
}

export function emptyGame(): Game {
  let game: Game = {
    tournamentId: 0,
    category: '',
    weekNumber: 0,
    gameDate: new Date(),
    gamePlace: '',
    teamStats: [emptyTeamStats(), emptyTeamStats()],
    byDefault: false,
  };
  return game;
}

export function emptySetStat(setNumber: number): SetStat {
  let setStat: SetStat = {
    setNumber: setNumber,
    state: '',
    points: 0,
  };
  return setStat;
}

export function emptyPlayer(): Player {
  let player: Player = {
    teamId: 0,
    name: '',
    lastName: '',
    number: 0,
  };
  return player;
}
