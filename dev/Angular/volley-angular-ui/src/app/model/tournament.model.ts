export interface Tournament {
  tournamentId?: number;
  name: string;
  year: number;
  description: string;
  rounds: number;
  stage: string;
  regularSets: number;
  eliminationSets: number;
  femElimination: number;
  varElimination: number;
  mixElimination: number;
  url: string;
  isActive: boolean;

  weeks: number[];
}
