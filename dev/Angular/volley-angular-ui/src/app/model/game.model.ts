import { TeamStat } from './team-stat.model';

export interface Game {
  gameId?: number;
  tournamentId: number;
  weekNumber: number;
  category: string;

  gameDate: Date;
  gamePlace: string;

  byDefault: boolean;

  teamStats: TeamStat[];
}
