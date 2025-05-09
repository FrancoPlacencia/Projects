import { TeamStat } from '../model/team-stat.model';
import { Team } from '../model/team.model';
import { Game } from '../model/game.model';
import { SetStat } from '../model/set-stats.model';
import { Tournament } from '../model/tournament.model';
import { Player } from '../model/player.model';
import { TournamentApp } from '../model/tournament-app.model';
import { Standing } from '../model/standing.model';
import { TeamOption } from '../model/team-option.model';

export function emptyTournament(): Tournament {
  const tournament: Tournament = {
    name: '',
    year: 0,
    description: '',
    rounds: 0,
    stage: '',
    regularSets: 0,
    eliminationSets: 0,
    femElimination: 0,
    varElimination: 0,
    mixElimination: 0,
    url: '',
    isActive: false,
    weeks: [],
  };
  return tournament;
}

export function emptyTournamentApp(): TournamentApp {
  const tournamentApp: TournamentApp = {
    tournament: emptyTournament(),
    standings: new Map<string, Standing[]>(),
    weeks: new Map<number, Map<string, Game[]>>(),
    teams: new Map<string, Team[]>(),
    teamOptions: new Map<string, TeamOption[]>(),
  };
  return tournamentApp;
}

export function emptyTeam(): Team {
  const team: Team = {
    teamNumber: 0,
    name: '',
    initials: '',
    category: '',
    stage: '',
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
  const teamStat: TeamStat = {
    teamId: 0,
    teamName: '',
    score: 0,
    sets: 0,
    points: 0,
    state: '',
    setStats: [],
    players: [],
  };
  return teamStat;
}

export function emptyGame(): Game {
  const game: Game = {
    tournamentId: 0,
    category: '',
    stage: 'REGULAR',
    weekNumber: 0,
    gameDate: new Date(),
    gamePlace: '',
    teamStats: [emptyTeamStats(), emptyTeamStats()],
    byDefault: false,
  };
  return game;
}

export function emptySetStat(setNumber: number): SetStat {
  const setStat: SetStat = {
    setNumber: setNumber,
    state: '',
    points: 0,
  };
  return setStat;
}

export function emptyPlayer(): Player {
  const player: Player = {
    teamId: 0,
    name: '',
    lastName: '',
    number: 0,
    gamesPlayed: 0,
    gamesTotal: 0,
    gamesPercentage: 0,
    isActive: false,
  };
  return player;
}
