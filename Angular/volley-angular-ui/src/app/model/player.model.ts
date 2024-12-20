import { StringMappingType } from 'typescript';

export interface Player {
  playerId?: number;
  teamId: number;
  name: string;
  lastName?: string;
  number: number;

  gamePlayed?: boolean;
}
