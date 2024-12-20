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

import {
  MAT_MOMENT_DATE_ADAPTER_OPTIONS,
  MomentDateAdapter,
  provideMomentDateAdapter,
} from '@angular/material-moment-adapter';
import * as _moment from 'moment';
import { default as _rollupMoment } from 'moment';
import {
  DateAdapter,
  MAT_DATE_FORMATS,
  MAT_DATE_LOCALE,
} from '@angular/material/core';
import { WeekComponent } from '../week/week.component';

const moment = _rollupMoment || _moment;
export const MY_FORMATS = {
  parse: {
    dateInput: 'LL',
    timeInput: 'LL',
  },
  display: {
    dateInput: 'DD MMM YYYY',
    monthYearLabel: 'MMM YYYY',

    dateA11yLabel: 'LL',
    monthYearA11yLabel: 'MMM YYYY',

    timeInput: 'hh:mm A',
    timeOptionLabel: 'hh:mm A',
  },
};

const daysOfWeek: string[] = [
  'DOMINGO',
  'LUNES',
  'MARTES',
  'MIERCOLES',
  'JUEVES',
  'VIERNES',
  'SABADO',
];

@Component({
  selector: 'app-landing',
  providers: [
    {
      provide: DateAdapter,
      useClass: MomentDateAdapter,
      deps: [MAT_DATE_LOCALE, MAT_MOMENT_DATE_ADAPTER_OPTIONS],
    },
    { provide: MAT_DATE_FORMATS, useValue: MY_FORMATS },
  ],
  imports: [
    CommonModule,
    MatTabsModule,
    MatCardModule,
    MatTableModule,
    MatIconModule,
    StandingComponent,
    WeekComponent,
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
        console.log('tournament ', tournament);
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
            this.tournamentApp.weeks = this.generateGameWeeks(games);
            this.weeksTab!.selectedIndex =
              this.tournamentApp.tournament.weeks.length - 1;
            console.log(this.tournamentApp);
          },
          error: (e: any) => {},
        });
    }
  }

  private generateGameWeeks(games: Game[]): Map<number, Map<string, Game[]>> {
    // Add all games in a map with the week as key
    let weeksMap: Map<number, Game[]> = new Map<number, Game[]>();
    games.forEach((game: Game) => {
      if (weeksMap.has(game.weekNumber)) {
        weeksMap.get(game.weekNumber)?.push(game);
      } else {
        weeksMap.set(game.weekNumber, [game]);
      }
    });

    // Iterates the map to generate a new map inside
    let weeksDayMap: Map<number, Map<string, Game[]>> = new Map<
      number,
      Map<string, Game[]>
    >();
    for (let [key, value] of weeksMap) {
      weeksDayMap.set(key, this.generateGameWeekDay(value));
    }
    return weeksDayMap;
  }

  private generateGameWeekDay(games: Game[]): Map<string, Game[]> {
    let weekDayMap: Map<string, Game[]> = new Map<string, Game[]>();
    games.forEach((game: Game) => {
      let day = daysOfWeek[moment(game.gameDate).day()];
      if (weekDayMap.has(day)) {
        weekDayMap.get(day)?.push(game);
      } else {
        weekDayMap.set(day, [game]);
      }
    });
    return weekDayMap;
  }
}
