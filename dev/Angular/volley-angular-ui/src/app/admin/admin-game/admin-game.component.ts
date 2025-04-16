/* eslint-disable @typescript-eslint/no-explicit-any */
import { Component, inject, OnInit, signal, ViewChild } from '@angular/core';
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
import { ActivatedRoute, Router } from '@angular/router';
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
import {
  generateGameWeekDay,
  generateGameWeeks,
  generateTeamMap,
} from '../../util/game-util';
import { navigateToTournament } from '../../util/navigate-util';

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
export class AdminGameComponent implements OnInit {
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

  public setsNumber = 5;

  public teamsArray: number[] = [1, 2];
  public setsArray: number[] = [1, 2, 3];
  public players: number[] = [
    1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20,
  ];

  public categoryRequired = true;

  public gamesMatrix: Game[][] = [[]];

  public teamOptions: TeamOption[] = [];
  public teamOptionsMap: Map<string, TeamOption[]> = new Map<
    string,
    TeamOption[]
  >();

  public gameId: number | undefined;

  public game: Game = emptyGame();

  @ViewChild('inputForm') inputForm: any;

  public weeks: Map<string, Game[]> = new Map<string, Game[]>();

  private teamsMap: Map<string, Team[]> = new Map<string, Team[]>();

  private stageSets = 0;

  public stage = '';
  public playoff = false;
  public stageText = '';

  private formBuilder: FormBuilder = inject(FormBuilder);

  public gameForm: FormGroup = this.formBuilder.group({
    category: [this.game.category, Validators.required],
    gameDate: [this.game.gameDate, Validators.required],
    gameTime: [this.game.gameDate, Validators.required],
    gamePlace: [this.game.gamePlace, Validators.required],
    byDefault: [this.game.byDefault, Validators.required],

    teams: this.formBuilder.array([this.newTeam(), this.newTeam()]),
  });

  constructor(
    private teamService: TeamService,
    private gamesService: GameService,
    private dialog: MatDialog,

    private router: Router,
    private route: ActivatedRoute,
  ) {
    // Create the form group from DTO

    const time = new Date();
    time.setHours(17, 30, 0);
    this.game.gameDate = time;
    // Get data from URL
    this.route.queryParamMap.subscribe((params) => {
      this.tournamentId = Number(params.get('id')!);
      this.weekNumber = Number(params.get('weekNumber')!);
      this.stage = params.get('stage') ?? '';

      this.playoff = this.weekNumber === 0 && this.stage != '';
      switch (this.stage) {
        case 'QUARTER':
          this.stageText = 'Cuartos de Final';
          break;
        case 'SEMI':
          this.stageText = 'Semi-Finales';
          break;
        case 'FINAL':
          this.stageText = 'Finales';
          break;
        default:
          this.stageText = '';
          break;
      }
      this.stageSets = this.stageText === '' ? 3 : 5;

      for (let i = 0; i < this.teams.controls.length; i++) {
        for (let j = 0; j < this.stageSets; j++) {
          this.addSet(i);
        }
      }
      this.getGames();
      this.getTeams();

      this.formSubscribe();
    });

    /*
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
      */
  }

  public get teams() {
    return this.gameForm.controls['teams'] as FormArray;
  }

  public newTeam() {
    const tmpTeam: FormGroup = this.formBuilder.group({
      name: [{ value: '', disblae: true }, Validators.required],
      sets: this.formBuilder.array([]),
      players: this.formBuilder.array([]),
    });
    return tmpTeam;
  }

  public addTeam() {
    this.teams.push(this.newTeam());
    this.subscribeTeams();
  }

  public removeTeam(teamIndex: number) {
    this.teams.removeAt(teamIndex);
  }

  public teamSets(teamIndex: number): FormArray {
    return this.teams.at(teamIndex).get('sets') as FormArray;
  }

  public sets(teamIndex: number) {
    return this.teams.at(teamIndex).get('sets') as FormArray;
  }

  public newSets() {
    const tmpSet: FormGroup = this.formBuilder.group({
      set: [{ value: 0 }, Validators.required],
    });
    return tmpSet;
  }

  public addSet(teamIndex: number) {
    this.teamSets(teamIndex).push(this.newSets());
  }

  public removeSets(teamIndex: number, setIndex: number) {
    this.teamSets(teamIndex).removeAt(setIndex);
  }

  ngOnInit(): void {
    console.log('initiated');
  }

  public reset(): void {
    this.game = emptyGame();
    this.game.tournamentId = this.tournamentId;

    this.gameId = this.game.gameId;
    this.isNew = true;

    resetFormGroup(this.gameForm);
    this.getGames();

    //this.formGroup.get('gameTime')?.setValue('');
    //this.formGroup.get('gameDate')?.setValue('');
  }

  public submit(): void {
    this.gameForm.markAllAsTouched();
    if (this.gameForm.status === 'VALID') {
      this.isProcessing = startProcessing(this.gameForm, this.dialog);
      this.isNew ? this.createGame() : this.updateGame();
    }
  }

  public edit(game: Game): void {
    this.inputForm.nativeElement.focus();
    this.isNew = false;

    this.gameId = game.gameId;
    this.game.gameId = game.gameId;
    this.game.category = game.category;
    this.game.stage = game.stage;
    this.game.tournamentId = this.tournamentId;
    if (this.playoff) {
      this.game.weekNumber = game.weekNumber;
    } else {
      this.game.weekNumber = this.weekNumber;
    }

    // let dateT = new Date(game.gameDate);
    this.game.gameDate = new Date(game.gameDate);
    this.gameForm.get('category')?.setValue(game.category);
    this.gameForm.get('gameTime')?.setValue(this.game.gameDate);
    this.gameForm.get('gameDate')?.setValue(this.game.gameDate);
    this.gameForm.get('gamePlace')?.setValue(game.gamePlace);
    this.gameForm.get('byDefault')?.setValue(game.byDefault);

    for (let i = 0; i < game.teamStats.length; i++) {
      let teamStat: TeamStat = game.teamStats[i];
      this.gameForm.get('team' + (i + 1))?.setValue(teamStat.teamId);

      for (let j = 0; j < this.setsArray.length; j++) {
        if (j >= teamStat.setStats.length) {
          this.gameForm.get('team' + (i + 1) + 'Set' + (j + 1))?.setValue(0);
        } else {
          let setStat: SetStat = teamStat.setStats[j];
          this.gameForm
            .get('team' + (i + 1) + 'Set' + (j + 1))
            ?.setValue(setStat.points);
        }
      }

      for (let p = 0; p < teamStat.players.length; p++) {
        this.gameForm
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
          this.isProcessing = startProcessing(this.gameForm, this.dialog);
          this.deleteGame(game);
        }
      });
    }
  }

  public tournament(): void {
    navigateToTournament(this.router, this.route);
  }

  // ======================================================
  // PRIVATE FUNCTIONS
  // ======================================================
  private createGame(): void {
    console.log(this.game);
    this.game.tournamentId = this.tournamentId;
    this.game.weekNumber = this.weekNumber;
    if (!this.playoff) {
      this.gamesService.postGame(this.game).subscribe({
        next: (result: CommonResponse) => {
          this.isProcessing = endProcessing(this.gameForm, this.dialog);
          openDialog(this.dialog, DialogMessageTypes.SUCCESS, result.response);
          this.reset();
        },
        error: (e: any) => {
          this.isProcessing = endProcessing(this.gameForm, this.dialog);
          openErrorDialog(this.dialog, e.status, e.error);
        },
      });
    }
  }

  private getGames(): void {
    this.gamesMatrix = [];
    if (this.playoff) {
      this.gamesService
        .getGamesPlayoff(this.tournamentId, this.stage)
        .subscribe({
          next: (games: Game[]) => {
            this.weeks = generateGameWeekDay(games);
          },
          error: (e: any) => {
            this.errorMessage = 'Unable to load the Data!';
          },
        });
    } else {
      this.gamesService
        .getGamesWeek(this.tournamentId, Number(this.weekNumber))
        .subscribe({
          next: (games: Game[]) => {
            this.weeks = generateGameWeekDay(games);
          },
          error: (e: any) => {
            console.log(e);
            this.errorMessage = 'Unable to load the Data!';
          },
        });
    }
    this.tableLoaded = true;
  }

  private getTeams(): void {
    this.teamService
      .getTeamOptions(this.tournamentId, this.playoff ? this.stage : 'REGULAR')
      .subscribe({
        next: (teamOptions: Map<string, TeamOption[]>) => {
          this.teamOptionsMap = new Map(Object.entries(teamOptions));
        },
        error: (e: any) => {},
      });

    this.teamService
      .getTeams(this.tournamentId, '', this.playoff ? this.stage : 'REGULAR')
      .subscribe({
        next: (teams: Team[]) => {
          this.teamsMap = generateTeamMap(teams);
        },
        error: (e: any) => {},
      });
  }

  private updateGame(): void {
    this.gamesService.putGame(this.game).subscribe({
      next: (result: CommonResponse) => {
        this.isProcessing = endProcessing(this.gameForm, this.dialog);
        openDialog(this.dialog, DialogMessageTypes.SUCCESS, result.response);
        this.reset();
      },
      error: (e: any) => {
        this.isProcessing = endProcessing(this.gameForm, this.dialog);
        openErrorDialog(this.dialog, e.status, e.error.response);
      },
    });
  }

  private deleteGame(game: Game): void {
    this.gamesService.deleteGame(game.gameId!).subscribe({
      next: (result: CommonResponse) => {
        this.isProcessing = endProcessing(this.gameForm, this.dialog);
        openDialog(this.dialog, DialogMessageTypes.SUCCESS, result.response);
        this.reset();
      },
      error: (e: any) => {
        this.isProcessing = endProcessing(this.gameForm, this.dialog);
        openErrorDialog(this.dialog, e.status, e.error.response);
      },
    });
  }

  private convertToPlayerOptions(player: Player): PlayerOption {
    let playerOption: PlayerOption = {
      playerId: player.playerId,
      name: player.name + ' ' + player.lastName,
      number: player.number,
      gamePlayed: player.gamePlayed,
    };
    return playerOption;
  }

  private setPlayersByCategory(teamId: number): PlayerOption[] {
    let _playerOptions: PlayerOption[] = [];
    if (this.teamsMap.size === 0) {
      return _playerOptions;
    }
    let _players: Player[];
    _players =
      this.teamsMap
        .get(this.game.category)!
        .find((team) => team.teamId === teamId)?.players ?? [];
    _players.forEach((p) => {
      _playerOptions.push(this.convertToPlayerOptions(p));
    });
    _playerOptions.sort((a, b) => a.number - b.number);
    return _playerOptions;
  }

  private updateCategoryOption(): void {
    this.teamOptions = this.teamOptionsMap.get(this.game.category)! ?? [];
  }

  private disableFields(): void {
    this.teamsArray.forEach((team: number) => {
      this.gameForm.get('team' + team)!.disable();

      this.setsArray.forEach((set: number) => {
        this.gameForm.get('team' + team + 'Set' + set)?.disable();
      });

      this.players.forEach((player: number) => {
        this.gameForm.get('team' + team + 'Player' + player)?.disable();
      });
    });
  }

  private enableFields(): void {
    this.game.teamStats.forEach((teamStats, i) => {
      // TEAM
      this.gameForm.get('team' + (i + 1))!.enable();
      // SETS
      teamStats.setStats.forEach((setStat, j) => {
        this.gameForm.get('team' + (i + 1) + 'Set' + (j + 1))!.enable();
      });
    });
  }

  private enablePlayers(teamStat: TeamStat, i: number): void {
    teamStat.players.forEach((player, p) => {
      this.gameForm.get('team' + (i + 1) + 'Player' + (p + 1))!.enable();
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

  private formSubscribe() {
    // Subscribe changes of Form Group to the DTO
    this.gameForm.get('category')!.valueChanges.subscribe((selectedValue) => {
      this.game.category = selectedValue;
      this.updateCategoryOption();
      //this.enableFields();
    });
    this.gameForm
      .get('gameDate')!
      .valueChanges.subscribe((selectedValue: any) => {
        this.game.gameDate = selectedValue;
      });
    this.gameForm
      .get('gameTime')!
      .valueChanges.subscribe((selectedValue: Date) => {
        this.game.gameDate.setHours(selectedValue.getHours());
        this.game.gameDate.setMinutes(selectedValue.getMinutes());
        //this.dateStart.set('hour', selectedValue.getHours());
        //this.dateStart.set('minute', dayjs(selectedValue).get('minute'));
      });
    this.gameForm.get('gamePlace')!.valueChanges.subscribe((selectedValue) => {
      this.game.gamePlace = selectedValue;
    });

    this.gameForm.get('byDefault')!.valueChanges.subscribe((selectedValue) => {
      this.game.byDefault = selectedValue;
    });

    this.teams.controls.forEach((formControl, i) => {
      console.log('foreach ', i);
      formControl.valueChanges.subscribe((formValue) => {
        console.log('SUBSCRIBE TEAMS ', formValue);
        this.game.teamStats[i].players = this.setPlayersByCategory(
          formValue.name,
        );
        this.game.teamStats[i].teamId = formValue.name;
        this.sets(i).controls.forEach((formControlSets, j) => {
          formControlSets.valueChanges.subscribe((setValue) => {
            this.game.teamStats[i].setStats[j] = setValue;
          });
        });

        //this.enablePlayers(this.game.teamStats[i], i);
      });
    });
  }

  private subscribeTeams() {
    console.log('i');
  }
}
