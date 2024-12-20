import { Player } from './player.model';

export interface Team {
  teamId?: number;
  tournamentId?: number;
  teamNumber: number;
  name: string;
  initials: string;
  category: string;
  isActive: boolean;

  gamesWon: number;
  gamesLost: number;

  setsWon: number;
  setsLost: number;

  pointsWon: number;
  pointsLost: number;

  players: Player[];
}
