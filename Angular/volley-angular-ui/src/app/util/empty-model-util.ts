import { TeamStat } from '../admin/model/team-stat.model';
import { Team } from '../admin/model/team.model';
import { Game } from '../admin/model/game.model';
import { SetStat } from '../admin/model/set-stats.model';
import { Tournament } from '../admin/model/tournament.model';
import { Player } from '../admin/model/player.model';

export function emptyTournament(): Tournament {
  let tournament: Tournament = {
    name: '',
    year: 0,
    description: '',
    rounds: 0,
    url: '',
  };
  return tournament;
}

export function emptyTeam(): Team {
  let team: Team = {
    name: '',
    initials: '',
    category: '',
    isActive: true,
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
    isWinner: false,
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
    gameDate: '',
    gamePlace: '',
    teamStats: [emptyTeamStats(), emptyTeamStats()],
    byDefault: false,
  };
  return game;
}

export function emptySetStat(setNumber: number): SetStat {
  let setStat: SetStat = {
    setNumber: setNumber,
    isWinner: false,
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
