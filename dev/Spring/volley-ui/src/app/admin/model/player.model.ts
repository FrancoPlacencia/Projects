import { StringMappingType } from 'typescript';

export interface Player {
  playerUuid?: string;
  teamUuid: string;
  name: string;
  lastName?: string;
  number: number;
}
