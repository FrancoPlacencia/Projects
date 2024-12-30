import { Game } from './game.model';
import { Standing } from './standing.model';
import { TeamOption } from './team-option.model';
import { Team } from './team.model';
import { Tournament } from './tournament.model';

export interface TournamentApp {
  tournament: Tournament;
  standings: Map<string, Standing[]>;
  weeks: Map<number, Map<string, Game[]>>;
  teams: Map<string, Team[]>;
  teamOptions: Map<string, TeamOption[]>;
}
