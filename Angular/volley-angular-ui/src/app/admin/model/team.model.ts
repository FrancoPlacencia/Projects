import { Player } from './player.model';

export interface Team {
  teamId?: number;
  tournamentId?: number;
  name: string;
  initials: string;
  category: string;
  isActive: boolean;

  players: Player[];
}
