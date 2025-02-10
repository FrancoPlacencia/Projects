import { TeamOption } from './../../model/team-option.model';
import { TournamentApp } from './../../model/tournament-app.model';
// @angular
import { Component, ViewChild } from '@angular/core';

import { ActivatedRoute, Router } from '@angular/router';
import { CommonModule } from '@angular/common';

// Models
import { Tournament } from '../../model/tournament.model';

// Services
import { TournamentService } from '../../services/tournament.service';
import {
  emptyTournament,
  emptyTournamentApp,
} from '../../util/empty-model-util';
import { MatTabGroup, MatTabsModule } from '@angular/material/tabs';
import { MatCardModule } from '@angular/material/card';
import { MatTableDataSource, MatTableModule } from '@angular/material/table';
import { TeamService } from '../../services/team.service';
import { Team } from '../../model/team.model';
import { Standing } from '../../model/standing.model';
import { StandingComponent } from '../standing/standing.component';
import { MatIconModule } from '@angular/material/icon';
import { GameComponent } from '../game/game.component';
import { Game } from '../../model/game.model';
import { GameService } from '../../services/game.service';
import { TournamentComponent } from '../tournament/tournament.component';
import { WeekComponent } from '../week/week.component';
import { generateGameWeeks, generateTeamMap } from '../../util/game-util';
import { GamesComponent } from '../games/games.component';
import { TeamComponent } from '../team/team.component';
import { TeamsComponent } from '../teams/teams.component';

const daysOfWeek: string[] = [
  'DOMINGO',
  'LUNES',
  'MARTES',
  'MIERCOLES',
  'JUEVES',
  'VIERNES',
  'SABADO',
];

const months: string[] = [
  'ENERO',
  'FEBRERO',
  'MARZO',
  'ABRIL',
  'MAYO',
  'JUNIO',
  'JULIO',
  'AGOSTO',
  'SEPTIEMBRE',
  'OCTUBRE',
  'NOVIEMBRE',
  'DICIEMBRE',
];

@Component({
  selector: 'app-landing',
  imports: [
    CommonModule,
    MatTabsModule,
    MatCardModule,
    MatTableModule,
    MatIconModule,
    StandingComponent,
    WeekComponent,
    GamesComponent,
    TeamsComponent,
  ],
  templateUrl: './landing.component.html',
  styleUrl: './landing.component.scss',
})
export class LandingComponent {
  public errorMessage: string = '';
  public loading: boolean = true;

  // Table Data
  public columnsHeader: string[] = [
    'position',
    'name',
    'games',
    'sets',
    'points',
  ];
  public femDataSource: MatTableDataSource<any> | undefined;
  public varDataSource: MatTableDataSource<any> | undefined;
  public mixDataSource: MatTableDataSource<any> | undefined;

  public mapDataSource: Map<string, MatTableDataSource<any> | undefined> =
    new Map<string, MatTableDataSource<any> | undefined>();

  public tournamentApp: TournamentApp = emptyTournamentApp();

  public games: Game[] = [];

  @ViewChild('weeksTab', { static: false }) weeksTab?: MatTabGroup;

  constructor(
    private tournamentService: TournamentService,
    private teamService: TeamService,
    private gameService: GameService,
    private router: Router,
    private route: ActivatedRoute,
  ) {
    this.getActiveTournament();
  }

  private getActiveTournament(): void {
    this.tournamentService.getTournament().subscribe({
      next: (tournament: Tournament) => {
        if (tournament && tournament.tournamentId) {
          this.tournamentApp.tournament = tournament;
          this.getTeamOptions(tournament.tournamentId);
          this.getWeeks(tournament.tournamentId);
          this.getStandings(tournament.tournamentId);
          this.getTeams(tournament.tournamentId);
        } else {
          this.errorMessage = 'Unable to load the data!';
        }
      },
      error: (e: any) => {
        this.errorMessage = 'Unable to load the data!';
      },
    });
  }

  private getStandings(tournamentId: number): void {
    this.teamService.getStandings(tournamentId).subscribe({
      next: (standings: Map<string, Standing[]>) => {
        this.tournamentApp.standings = new Map(Object.entries(standings));
        this.tournamentApp.standings.forEach((value, key) => {
          this.mapDataSource.set(key, new MatTableDataSource(value));
        });
      },
      error: (e: any) => {},
    });
  }

  private getWeeks(tournamentId: number) {
    this.gameService.getGames(tournamentId).subscribe({
      next: (games: Game[]) => {
        this.games = games;
        this.tournamentApp.weeks = generateGameWeeks(games);
        this.weeksTab!.selectedIndex =
          this.tournamentApp.tournament.weeks.length - 1;
      },
      error: (e: any) => {},
    });
  }

  private getTeamOptions(tournamentId: number) {
    this.teamService.getTeamOptions(tournamentId, 'REGULAR').subscribe({
      next: (teamOptions: Map<string, TeamOption[]>) => {
        this.tournamentApp.teamOptions = new Map(Object.entries(teamOptions));
      },
      error: (e: any) => {},
    });
  }

  private getTeams(tournamentId: number) {
    this.teamService.getTeams(tournamentId, '', 'REGULAR').subscribe({
      next: (teams: Team[]) => {
        this.tournamentApp.teams = generateTeamMap(teams);
      },
      error: (e: any) => {},
    });
  }
}
