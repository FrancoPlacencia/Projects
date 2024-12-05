import { SetStat } from './set-stats.model';
import { PlayerOption } from './player-option.model';

export interface TeamStat {
  teamId: number;
  teamName: string;
  score: number;
  sets: number;
  points: number;
  isWinner: boolean;
  setStats: SetStat[];
  players: PlayerOption[];
}
