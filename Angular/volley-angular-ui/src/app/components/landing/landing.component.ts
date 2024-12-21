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
import { generateGameWeeks } from '../../util/game-util';
import { GamesComponent } from '../games/games.component';

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

  public submit(tournament: Tournament): void {
    this.router.navigate(['../tournament'], {
      relativeTo: this.route,
      queryParams: {
        id: tournament.tournamentId,
      },
    });
  }

  private getActiveTournament(): void {
    this.tournamentService.getTournament().subscribe({
      next: (tournament: Tournament) => {
        this.tournamentApp.tournament = tournament;
        this.getStandings();
        this.getWeeks();
      },
      error: (e: any) => {
        this.errorMessage = 'Unable to load the data!';
      },
    });
  }

  private getStandings(): void {
    if (
      this.tournamentApp &&
      this.tournamentApp.tournament &&
      this.tournamentApp.tournament.tournamentId
    ) {
      this.teamService
        .getStandings(this.tournamentApp.tournament.tournamentId)
        .subscribe({
          next: (standings: Map<string, Standing[]>) => {
            this.tournamentApp.standings = new Map(Object.entries(standings));
            this.tournamentApp.standings.forEach((value, key) => {
              this.mapDataSource.set(key, new MatTableDataSource(value));
            });
          },
          error: (e: any) => {},
        });
    }
  }

  private getWeeks() {
    if (
      this.tournamentApp &&
      this.tournamentApp.tournament &&
      this.tournamentApp.tournament.tournamentId
    ) {
      this.gameService
        .getGames(this.tournamentApp.tournament.tournamentId)
        .subscribe({
          next: (games: Game[]) => {
            this.games = games;
            this.tournamentApp.weeks = generateGameWeeks(games);
            this.weeksTab!.selectedIndex =
              this.tournamentApp.tournament.weeks.length - 1;
          },
          error: (e: any) => {},
        });
    }
  }
}
