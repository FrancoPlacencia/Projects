export interface Tournament {
  tournamentId?: number;
  name: string;
  year: number;
  description: string;
  rounds: number;
  url: string;
  isActive: boolean;

  weeks: number[];
}
