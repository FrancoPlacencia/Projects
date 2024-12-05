import { TeamStat } from './team-stat.model';

export interface Game {
  gameId?: number;
  tournamentId: number;
  weekNumber: number;
  category: string;

  gameDate: string;
  gamePlace: string;

  byDefault: boolean;

  teamStats: TeamStat[];
}
