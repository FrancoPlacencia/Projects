import { Component, OnInit, signal, ViewChild } from '@angular/core';
import { TeamService } from '../../services/team.service';
import { TournamentService } from '../../services/tournament.service';
import {
  FormArray,
  FormBuilder,
  FormGroup,
  FormsModule,
  ReactiveFormsModule,
  Validators,
} from '@angular/forms';
import { MatDialog } from '@angular/material/dialog';
import { ActivatedRoute } from '@angular/router';
import {
  endProcessing,
  resetFormGroup,
  startProcessing,
} from '../../util/form-util';
import { CommonModule, DatePipe } from '@angular/common';
import { MatButtonModule } from '@angular/material/button';
import { MatCardModule } from '@angular/material/card';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatIconModule } from '@angular/material/icon';
import { MatInputModule } from '@angular/material/input';
import { MatSlideToggleModule } from '@angular/material/slide-toggle';
import { MatListModule } from '@angular/material/list';
import { MatSelectModule } from '@angular/material/select';
import { MatDatepickerModule } from '@angular/material/datepicker';
import {
  MatNativeDateModule,
  provideNativeDateAdapter,
} from '@angular/material/core';
import { MatTimepickerModule } from '@angular/material/timepicker';
import { GameService } from '../../services/game.service';
import { Game } from '../../model/game.model';

import { Team } from '../../model/team.model';
import { TeamOption } from '../../model/team-option.model';
import { TeamStat } from '../../model/team-stat.model';
import { SetStat } from '../../model/set-stats.model';
import { Player } from '../../model/player.model';
import { emptyGame, emptyTournament } from '../../util/empty-model-util';
import {
  openConfirmDialog,
  openDialog,
  openErrorDialog,
} from '../../util/message-util';
import { DialogMessageTypes } from '../../common/model/dialog-message-types';
import { PlayerOption } from '../../model/player-option.model';
import { CommonResponse } from '../../common/model/common-response.dto';
import { MatExpansionModule } from '@angular/material/expansion';
import { WeekComponent } from '../../components/week/week.component';
import { generateGameWeekDay, generateGameWeeks } from '../../util/game-util';

@Component({
  selector: 'app-admin-game',
  providers: [provideNativeDateAdapter()],
  imports: [
    CommonModule,
    FormsModule,
    ReactiveFormsModule,
    MatButtonModule,
    MatCardModule,
    MatFormFieldModule,
    MatIconModule,
    MatInputModule,
    MatListModule,
    MatSlideToggleModule,
    MatSelectModule,
    MatDatepickerModule,
    MatSelectModule,
    MatNativeDateModule,
    MatTimepickerModule,
    MatExpansionModule,
    WeekComponent,
  ],
  templateUrl: './admin-game.component.html',
  styleUrl: './admin-game.component.scss',
})
export class AdminGameComponent {
  public tournamentId: number = 0;
  public weekNumber: number = 0;
  public tournamentName!: string;

  // Flags
  public tableLoaded: boolean = false;
  public isProcessing: boolean = false;
  public isNew: boolean = true;

  // Table Data
  public errorMessage: string = '';

  // Form Data
  public formGroup: FormGroup;
  public setsNumber = 5;

  public teams: number[] = [1, 2];
  public sets: number[] = [1, 2, 3, 4, 5];
  public players: number[] = [
    1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20,
  ];

  public daysOfWeek: string[] = [
    'DOMINGO',
    'LUNES',
    'MARTES',
    'MIERCOLES',
    'JUEVES',
    'VIERNES',
    'SABADO',
  ];

  public daysOfGames: string[] = [
    'LUNES',
    'MARTES',
    'MIERCOLES',
    'JUEVES',
    'VIERNES',
  ];

  public categoryRequired: boolean = true;

  // public games: Game[] = [];

  public gamesMatrix: Game[][] = [[]];

  public teamOptions: TeamOption[] = [];

  public gameId: number | undefined;

  public game: Game = emptyGame();
  /*
  public dateStart: dayjs.Dayjs = dayjs()
    .set('hour', 17)
    .set('minute', 0)
    .set('second', 0);
*/
  private femTeamsOptions: TeamOption[] = [];
  private femTeams: Team[] = [];

  private varTeamsOptions: TeamOption[] = [];
  private varTeams: Team[] = [];

  private mixTeamsOptions: TeamOption[] = [];
  private mixTeams: Team[] = [];

  @ViewChild('inputForm') inputForm: any;

  public weeks: Map<string, Game[]> = new Map<string, Game[]>();

  constructor(
    private teamService: TeamService,
    private gamesService: GameService,
    private formBuilder: FormBuilder,
    private dialog: MatDialog,

    //private router: Router,
    private route: ActivatedRoute,
  ) {
    let time = new Date();
    time.setHours(17, 30, 0);
    // Get data from URL
    this.route.queryParamMap.subscribe((params) => {
      this.tournamentId = Number(params.get('id')!);
      this.weekNumber = Number(params.get('weekNumber')!);

      this.getTeams();
    });
    // Create the form group from DTO
    this.formGroup = this.formBuilder.group({
      category: [this.game.category, Validators.required],
      gameDate: [time, Validators.required],
      gameTime: [time, Validators.required],
      gamePlace: [this.game.gamePlace, Validators.required],
      byDefault: [this.game.byDefault, Validators.required],

      team1: [{ value: '', disabled: true }, Validators.required],
      team1Set1: [{ value: 0, disabled: true }, Validators.required],
      team1Set2: [{ value: 0, disabled: true }, Validators.required],
      team1Set3: [{ value: 0, disabled: true }, Validators.required],
      team1Set4: [{ value: 0, disabled: true }, Validators.required],
      team1Set5: [{ value: 0, disabled: true }, Validators.required],

      team1Player1: [{ value: false, disabled: true }],
      team1Player2: [{ value: false, disabled: true }],
      team1Player3: [{ value: false, disabled: true }],
      team1Player4: [{ value: false, disabled: true }],
      team1Player5: [{ value: false, disabled: true }],
      team1Player6: [{ value: false, disabled: true }],
      team1Player7: [{ value: false, disabled: true }],
      team1Player8: [{ value: false, disabled: true }],
      team1Player9: [{ value: false, disabled: true }],
      team1Player10: [{ value: false, disabled: true }],
      team1Player11: [{ value: false, disabled: true }],
      team1Player12: [{ value: false, disabled: true }],
      team1Player13: [{ value: false, disabled: true }],
      team1Player14: [{ value: false, disabled: true }],
      team1Player15: [{ value: false, disabled: true }],
      team1Player16: [{ value: false, disabled: true }],
      team1Player17: [{ value: false, disabled: true }],
      team1Player18: [{ value: false, disabled: true }],
      team1Player19: [{ value: false, disabled: true }],
      team1Player20: [{ value: false, disabled: true }],

      team2: [{ value: '', disabled: true }, Validators.required],
      team2Set1: [{ value: 0, disabled: true }, Validators.required],
      team2Set2: [{ value: 0, disabled: true }, Validators.required],
      team2Set3: [{ value: 0, disabled: true }, Validators.required],
      team2Set4: [{ value: 0, disabled: true }, Validators.required],
      team2Set5: [{ value: 0, disabled: true }, Validators.required],
      team2Player1: [{ value: false, disabled: true }],
      team2Player2: [{ value: false, disabled: true }],
      team2Player3: [{ value: false, disabled: true }],
      team2Player4: [{ value: false, disabled: true }],
      team2Player5: [{ value: false, disabled: true }],
      team2Player6: [{ value: false, disabled: true }],
      team2Player7: [{ value: false, disabled: true }],
      team2Player8: [{ value: false, disabled: true }],
      team2Player9: [{ value: false, disabled: true }],
      team2Player10: [{ value: false, disabled: true }],
      team2Player11: [{ value: false, disabled: true }],
      team2Player12: [{ value: false, disabled: true }],
      team2Player13: [{ value: false, disabled: true }],
      team2Player14: [{ value: false, disabled: true }],
      team2Player15: [{ value: false, disabled: true }],
      team2Player16: [{ value: false, disabled: true }],
      team2Player17: [{ value: false, disabled: true }],
      team2Player18: [{ value: false, disabled: true }],
      team2Player19: [{ value: false, disabled: true }],
      team2Player20: [{ value: false, disabled: true }],
    });
    // Subscribe changes of Form Group to the DTO
    this.formGroup.get('category')!.valueChanges.subscribe((selectedValue) => {
      this.game.category = selectedValue;
      this.updateCategoryOption();
      this.enableFields();
    });

    this.formGroup
      .get('gameDate')!
      .valueChanges.subscribe((selectedValue: any) => {
        /*
        this.dateStart.set('year', selectedValue.get('year'));
        this.dateStart.set('month', selectedValue.get('month'));
        this.dateStart.set('date', selectedValue.get('date'));
        
        this.dateStart = dayjs(selectedValue);
        */
        this.game.gameDate = selectedValue;
        console.log('gameDate ', typeof selectedValue, this.game.gameDate);
      });
    this.formGroup
      .get('gameTime')!
      .valueChanges.subscribe((selectedValue: Date) => {
        this.game.gameDate = selectedValue;
        //this.dateStart.set('hour', selectedValue.getHours());
        console.log('valueChange hour', selectedValue.getHours());
        //this.dateStart.set('minute', dayjs(selectedValue).get('minute'));
      });
    this.formGroup.get('gamePlace')!.valueChanges.subscribe((selectedValue) => {
      this.game.gamePlace = selectedValue;
    });

    this.formGroup.get('byDefault')!.valueChanges.subscribe((selectedValue) => {
      this.game.byDefault = selectedValue;
    });

    for (let i = 0; i < this.game.teamStats.length; i++) {
      // TEAMS
      this.formGroup
        .get('team' + (i + 1))!
        .valueChanges.subscribe((selectedValue) => {
          this.game.teamStats[i].players =
            this.setPlayersByCategory(selectedValue);
          this.game.teamStats[i].teamId = selectedValue;
          this.enablePlayers(this.game.teamStats[i], i);
        });
      // SETS
      for (let j = 0; j < this.game.teamStats[i].setStats.length; j++) {
        this.formGroup
          .get('team' + (i + 1) + 'Set' + (j + 1))!
          .valueChanges.subscribe((selectedValue) => {
            this.game.teamStats[i].setStats[j].points = selectedValue;
          });
      }
      // PLAYERS
      for (let p = 0; p < 20; p++) {
        this.formGroup
          .get('team' + (i + 1) + 'Player' + (p + 1))!
          .valueChanges.subscribe((selectedValue) => {
            if (p < this.game.teamStats[i].players.length) {
              this.game.teamStats[i].players[p].gamePlayed = selectedValue;
            }
          });
      }
    }

    /*
ITS NOT ASSIGNING THE VALUE
    this.game.teamStats.forEach((teamStats, i) => {
      // TEAM AND PLAYERS
      this.formGroup
        .get('team' + (i + 1))!
        .valueChanges.subscribe((selectedValue) => {
          teamStats.players = this.setPlayersByCategory(selectedValue);
          teamStats.teamId = selectedValue;
          this.enablePlayers(teamStats, i);
        });
      // SETS
      teamStats.setStats.forEach((setStat, j) => {
        this.formGroup
          .get('team' + (i + 1) + 'Set' + (j + 1))!
          .valueChanges.subscribe((selectedValue) => {
            setStat.points = selectedValue;
          });
      });
      // PLAYERS
      for (let p = 0; p < 20; p++) {
        this.formGroup
          .get('team' + (i + 1) + 'Player' + (p + 1))!
          .valueChanges.subscribe((selectedValue) => {
            if (p < teamStats.players.length) {
              teamStats.players[p].gamePlayed = selectedValue;
            }
          });
      }
    });
*/
  }

  ngOnInit(): void {
    this.getGames();
  }

  public reset(): void {
    this.game = emptyGame();
    this.game.tournamentId = this.tournamentId;

    this.gameId = this.game.gameId;
    this.isNew = true;

    resetFormGroup(this.formGroup);
    this.getGames();

    this.formGroup.get('gameTime')?.setValue('');
    this.formGroup.get('gameDate')?.setValue('');
  }

  public submit(): void {
    this.formGroup.markAllAsTouched();
    if (this.formGroup.status === 'VALID') {
      //this.dateStart.utcOffset();
      // this.game.gameDate = this.dateStart.toDate();
      //.utc().utcOffset('-06:00').format('YYYY-MM-DD HH:mm:ss');
      console.log(this.game.gameDate);
      this.isProcessing = startProcessing(this.formGroup, this.dialog);
      this.isNew ? this.createGame() : this.updateGame();
    }
  }

  public edit(game: Game): void {
    this.inputForm.nativeElement.focus();
    this.isNew = false;

    let dateT = new Date(game.gameDate);
    this.formGroup.get('category')?.setValue(game.category);
    this.formGroup.get('gameTime')?.setValue(dateT);
    this.formGroup.get('gameDate')?.setValue(dateT);
    this.formGroup.get('gamePlace')?.setValue(game.gamePlace);
    console.log(game.byDefault);
    this.formGroup.get('byDefault')?.setValue(game.byDefault);

    this.gameId = game.gameId;
    this.game.gameId = game.gameId;
    this.game.tournamentId = this.tournamentId;
    this.game.weekNumber = this.weekNumber;

    for (let i = 0; i < game.teamStats.length; i++) {
      let teamStat: TeamStat = game.teamStats[i];
      this.formGroup.get('team' + (i + 1))?.setValue(teamStat.teamId);

      for (let j = 0; j < this.sets.length; j++) {
        if (j >= teamStat.setStats.length) {
          this.formGroup.get('team' + (i + 1) + 'Set' + (j + 1))?.setValue(0);
        } else {
          let setStat: SetStat = teamStat.setStats[j];
          this.formGroup
            .get('team' + (i + 1) + 'Set' + (j + 1))
            ?.setValue(setStat.points);
        }
      }

      for (let p = 0; p < teamStat.players.length; p++) {
        this.formGroup
          .get('team' + (i + 1) + 'Player' + (p + 1))
          ?.setValue(teamStat.players[p].gamePlayed);
      }
    }
  }

  public delete(game: Game): void {
    if (game) {
      const dialogRef = openConfirmDialog(this.dialog, 'Borrar', 'Jugador');
      dialogRef.afterClosed().subscribe((result) => {
        if (result) {
          this.isProcessing = startProcessing(this.formGroup, this.dialog);
          this.deleteGame(game);
        }
      });
    }
  }

  // ======================================================
  // PRIVATE FUNCTIONS
  // ======================================================
  private createGame(): void {
    this.game.tournamentId = this.tournamentId;
    this.game.weekNumber = this.weekNumber;
    this.gamesService.postGame(this.game).subscribe({
      next: (result: CommonResponse) => {
        this.isProcessing = endProcessing(this.formGroup, this.dialog);
        openDialog(this.dialog, DialogMessageTypes.SUCCESS, result.response);
        this.reset();
      },
      error: (e: any) => {
        this.isProcessing = endProcessing(this.formGroup, this.dialog);
        openErrorDialog(this.dialog, e.status, e.error);
      },
    });
  }

  private getGames(): void {
    this.gamesMatrix = [];
    this.gamesService
      .getGamesWeek(this.tournamentId, Number(this.weekNumber))
      .subscribe({
        next: (games: Game[]) => {
          console.log(games);
          this.weeks = generateGameWeekDay(games);
          /*
          if (games && games.length > 0) {
            let mondayGames: Game[] = [];
            let tuesdayGames: Game[] = [];
            let wednesdayGames: Game[] = [];
            let thursdayGames: Game[] = [];
            let fridayGames: Game[] = [];
            games.forEach((game: Game) => {
              console.log(this.daysOfWeek[moment(game.gameDate).day()]);
              switch (this.daysOfWeek[moment(game.gameDate).day()]) {
                case 'LUNES':
                  mondayGames.push(game);
                  break;
                case 'MARTES':
                  tuesdayGames.push(game);
                  break;
                case 'MIERCOLES':
                  wednesdayGames.push(game);
                  break;
                case 'JUEVES':
                  thursdayGames.push(game);
                  break;
                case 'VIERNES':
                  fridayGames.push(game);
                  break;
                default:
                  break;
              }
            });
            this.gamesMatrix.push(mondayGames);
            this.gamesMatrix.push(tuesdayGames);
            this.gamesMatrix.push(wednesdayGames);
            this.gamesMatrix.push(thursdayGames);
            this.gamesMatrix.push(fridayGames);
            console.log(this.gamesMatrix);
            // this.games = games;
            
          } else {
            this.errorMessage = 'Nothing to display';
          }*/
        },
        error: (e: any) => {
          this.errorMessage = 'Unable to load the Data!';
        },
      });
    this.tableLoaded = true;
  }

  private getTeams(): void {
    this.teamService.getTeamOptions(this.tournamentId).subscribe({
      next: (teamOptions: TeamOption[]) => {
        teamOptions.forEach((element: TeamOption) => {
          switch (element.category) {
            case 'FEMENIL':
              this.femTeamsOptions.push(element);
              break;
            case 'VARONIL':
              this.varTeamsOptions.push(element);
              break;
            case 'MIXTO':
              this.mixTeamsOptions.push(element);
              break;
            default:
              break;
          }
        });
      },
      error: (e: any) => {
        this.femTeamsOptions = [];
        this.varTeamsOptions = [];
        this.mixTeamsOptions = [];
      },
    });

    this.teamService.getTeams(this.tournamentId, '').subscribe({
      next: (teams: Team[]) => {
        teams.forEach((element: Team) => {
          switch (element.category) {
            case 'FEMENIL':
              this.femTeams.push(element);
              break;
            case 'VARONIL':
              this.varTeams.push(element);
              break;
            case 'MIXTO':
              this.mixTeams.push(element);
              break;
            default:
              break;
          }
        });
      },
      error: (e: any) => {
        this.femTeams = [];
        this.varTeams = [];
        this.mixTeams = [];
      },
    });
  }

  private updateGame(): void {
    console.log('updateGame', this.game);
    this.gamesService.putGame(this.game).subscribe({
      next: (result: CommonResponse) => {
        console.log(result);
        this.isProcessing = endProcessing(this.formGroup, this.dialog);
        openDialog(this.dialog, DialogMessageTypes.SUCCESS, result.response);
        this.reset();
      },
      error: (e: any) => {
        console.log(e.error);
        this.isProcessing = endProcessing(this.formGroup, this.dialog);
        openErrorDialog(this.dialog, e.status, e.error.response);
      },
    });
  }

  private deleteGame(game: Game): void {
    this.gamesService.deleteGame(game.gameId!).subscribe({
      next: (result: CommonResponse) => {
        this.isProcessing = endProcessing(this.formGroup, this.dialog);
        openDialog(this.dialog, DialogMessageTypes.SUCCESS, result.response);
        this.reset();
      },
      error: (e: any) => {
        this.isProcessing = endProcessing(this.formGroup, this.dialog);
        openErrorDialog(this.dialog, e.status, e.error.response);
      },
    });
  }

  private convertToPlayerOptions(player: Player): PlayerOption {
    let playerOption: PlayerOption = {
      playerId: player.playerId,
      name: player.name,
      number: player.number,
      gamePlayed: player.gamePlayed,
    };
    return playerOption;
  }

  private setPlayersByCategory(teamId: number): PlayerOption[] {
    let _playerOptions: PlayerOption[] = [];
    let _players: Player[];
    switch (this.game.category) {
      case 'FEMENIL':
        _players =
          this.femTeams.find((team) => team.teamId === teamId)?.players ?? [];
        break;
      case 'VARONIL':
        _players =
          this.varTeams.find((team) => team.teamId === teamId)?.players ?? [];
        break;
      case 'MIXTO':
        _players =
          this.mixTeams.find((team) => team.teamId === teamId)?.players ?? [];
        break;
      default:
        _players = [];
        break;
    }
    _players.forEach((p) => {
      _playerOptions.push(this.convertToPlayerOptions(p));
    });
    _playerOptions.sort((a, b) => a.number - b.number);
    return _playerOptions;
  }

  private updateCategoryOption(): void {
    switch (this.game.category) {
      case 'FEMENIL':
        this.teamOptions = this.femTeamsOptions;
        break;
      case 'VARONIL':
        this.teamOptions = this.varTeamsOptions;
        break;
      case 'MIXTO':
        this.teamOptions = this.mixTeamsOptions;
        break;
      default:
        this.teamOptions = [];
        break;
    }
  }

  private disableFields(): void {
    this.teams.forEach((team: number) => {
      this.formGroup.get('team' + team)!.disable();

      this.sets.forEach((set: number) => {
        this.formGroup.get('team' + team + 'Set' + set)?.disable();
      });

      this.players.forEach((player: number) => {
        this.formGroup.get('team' + team + 'Player' + player)?.disable();
      });
    });
  }

  private enableFields(): void {
    this.game.teamStats.forEach((teamStats, i) => {
      // TEAM
      this.formGroup.get('team' + (i + 1))!.enable();
      // SETS
      teamStats.setStats.forEach((setStat, j) => {
        this.formGroup.get('team' + (i + 1) + 'Set' + (j + 1))!.enable();
      });
    });
  }

  private enablePlayers(teamStat: TeamStat, i: number): void {
    teamStat.players.forEach((player, p) => {
      this.formGroup.get('team' + (i + 1) + 'Player' + (p + 1))!.enable();
    });
  }

  step = signal(0);

  setStep(index: number) {
    this.step.set(index);
  }

  nextStep() {
    this.step.update((i) => i + 1);
  }

  prevStep() {
    this.step.update((i) => i - 1);
  }
}
