/* eslint-disable @typescript-eslint/no-explicit-any */
import { Component, inject, OnInit, signal, ViewChild } from '@angular/core';
import { TeamService } from '../../services/team.service';
import { TournamentService } from '../../services/tournament.service';
import {
  AbstractControl,
  FormArray,
  FormBuilder,
  FormGroup,
  FormGroupDirective,
  FormsModule,
  ReactiveFormsModule,
  ValidationErrors,
  ValidatorFn,
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

import { MatCheckboxModule } from '@angular/material/checkbox';
import { MatTimepickerModule } from '@angular/material/timepicker';
import { GameService } from '../../services/game.service';
import { Game } from '../../model/game.model';

import { Team } from '../../model/team.model';
import { TeamOption } from '../../model/team-option.model';
import { TeamStat } from '../../model/team-stat.model';
import { SetStat } from '../../model/set-stats.model';
import { Player } from '../../model/player.model';
import {
  emptyGame,
  emptyPlayer,
  emptySetStat,
  emptyTournament,
} from '../../util/empty-model-util';
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
    MatCheckboxModule,
    WeekComponent,
  ],
  templateUrl: './admin-game.component.html',
  styleUrl: './admin-game.component.scss',
})
export class AdminGameComponent {
  // INJECTIONS
  private formBuilder: FormBuilder = inject(FormBuilder);
  private teamService: TeamService = inject(TeamService);
  private gamesService: GameService = inject(GameService);
  private dialog: MatDialog = inject(MatDialog);
  private router: Router = inject(Router);
  private route: ActivatedRoute = inject(ActivatedRoute);

  public tournamentId: number = 0;
  public weekNumber: number = 0;
  public tournamentName!: string;

  // Flags
  public tableLoaded: boolean = false;
  public isProcessing: boolean = false;
  public isNew: boolean = true;

  private defaultDate = new Date(new Date().setHours(17, 30, 0));

  // Table Data
  public errorMessage: string = '';

  // Form Data
  public setsNumber = 5;

  private lastTeamUpdated: number[] = [0, 0];
  private shouldClearPlayer = true;

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

  public gameForm: FormGroup = this.formBuilder.group({
    category: [undefined, Validators.required],
    gameDate: [undefined, Validators.required],
    gameTime: [undefined, Validators.required],
    gamePlace: [undefined, Validators.required],
    byDefault: [undefined, Validators.required],
    teams: this.formBuilder.array([]),
  });

  constructor() {
    this.addTeam();
    this.addTeam();
    this.route.queryParamMap.subscribe((params) => {
      this.tournamentId = Number(params.get('id') ?? 0);
      this.weekNumber = Number(params.get('weekNumber') ?? 0);
      this.stage = params.get('stage') ?? 'REGULAR';
      this.setStage();
      this.formSubscribe();

      this.reset();
      this.getTeams();
      this.getGames();
    });
  }

  public get teams() {
    return this.gameForm.controls['teams'] as FormArray;
  }
  public sets(teamIndex: number) {
    return this.teams.at(teamIndex).get('sets') as FormArray;
  }
  public players(teamIndex: number): FormArray {
    return this.teams.at(teamIndex).get('players') as FormArray;
  }

  public addTeam() {
    this.teams.push(
      this.formBuilder.group({
        name: [
          { value: undefined, disabled: true },
          [Validators.required, this.teamsValidator()],
        ],
        sets: this.formBuilder.array([]),
        players: this.formBuilder.array([]),
      }),
    );
  }
  public addSet(teamIndex: number) {
    this.sets(teamIndex).push(
      this.formBuilder.group({
        set: [{ value: 0, disabled: true }, Validators.required],
      }),
      { emitEvent: false },
    );
  }
  public addPlayer(teamIndex: number) {
    this.players(teamIndex).push(
      this.formBuilder.group({
        player: [{ value: false }],
      }),
      {
        emitEvent: false,
      },
    );
  }

  public removeTeam(teamIndex: number) {
    this.teams.removeAt(teamIndex);
  }
  public clearPlayers(teamIndex: number) {
    while (this.players(teamIndex).length !== 0) {
      this.players(teamIndex).removeAt(0, { emitEvent: false });
    }
    // console.log('clearPlayers', this.players(0), this.players(1));
  }

  public selectedPlayers(game: Game, clearPlayers: boolean) {
    this.teams.controls.forEach((formControl, i) => {
      const teamStat: TeamStat = game.teamStats[i];

      this.players(i).controls.forEach((formControlPlayers, j) => {
        let playerOption: PlayerOption = teamStat.players[j];
        if (!playerOption || clearPlayers) {
          playerOption = this.convertToPlayerOptions(emptyPlayer());
        }
        formControlPlayers
          .get('player')
          ?.setValue(playerOption.gamePlayed, { emitEvent: false });
      });
      console.log('after ', i, teamStat.players);
    });
  }

  public reset(): void {
    resetFormGroup(this.gameForm);
    this.disableFields();

    // Reset the variables
    this.game = emptyGame();
    this.buildTeamStats(false);

    this.game.tournamentId = this.tournamentId;

    this.gameId = this.game.gameId;
    this.isNew = true;

    this.teams.controls.forEach((teamFormControl, i) => {
      this.sets(i).controls.forEach((setFormControl) => {
        setFormControl.get('set')?.setValue(0, { emitEvent: false });
      });
      this.clearPlayers(i);
    });
    this.gameForm.get('gameTime')!.setValue(this.defaultDate);
    this.gameForm.get('gameDate')!.setValue(this.defaultDate);
    this.gameForm.get('byDefault')!.setValue(false);
  }

  public submit(): void {
    this.gameForm.markAllAsTouched();
    if (this.gameForm.status === 'VALID') {
      this.isProcessing = startProcessing(this.gameForm, this.dialog);
      if (this.isNew) {
        this.createGame();
      } else {
        this.updateGame();
      }
      // this.isNew ? this.createGame() : this.updateGame();
    }
  }

  public edit(game: Game): void {
    console.log('Edit ', game);
    this.inputForm.nativeElement.focus();
    this.isNew = false;

    this.gameId = game.gameId;
    this.game.gameId = game.gameId;
    this.game.tournamentId = this.tournamentId;
    if (this.playoff) {
      this.game.weekNumber = game.weekNumber;
    } else {
      this.game.weekNumber = this.weekNumber;
    }
    this.gameForm.get('category')?.setValue(game.category);
    this.game.stage = game.stage;
    const tmpDate = new Date(game.gameDate);
    this.gameForm.get('gameTime')?.setValue(tmpDate);
    this.gameForm.get('gameDate')?.setValue(tmpDate);
    this.gameForm.get('gamePlace')?.setValue(game.gamePlace);
    this.gameForm.get('byDefault')?.setValue(game.byDefault);

    // CLEAR Sets and Players
    game.teamStats.forEach((teamStat: TeamStat, i) => {
      this.game.teamStats[i].setStats = [];
      this.game.teamStats[i].players = [];
      teamStat.setStats.forEach((set: SetStat) => {
        this.game.teamStats[i].setStats.push({
          setNumber: set.setNumber,
          state: set.state,
          points: set.points,
        });
      });
      teamStat.players.forEach((player: PlayerOption) => {
        this.game.teamStats[i].players.push({
          playerId: player.playerId,
          number: player.number,
          name: player.name,
          gamePlayed: player.gamePlayed,
        });
      });
    });

    this.teams.controls.forEach((formControl, i) => {
      const teamStat: TeamStat = game.teamStats[i];

      /*
      teamStat.setStats.forEach((setStats: SetStat, j) => {
        this.game.teamStats[i].setStats[j] = setStats;
      });
      teamStat.players.forEach((player: PlayerOption, j) => {
        this.game.teamStats[i].players[j] = player;
      });
      */

      this.shouldClearPlayer = false;

      formControl.get('name')?.setValue(teamStat.teamId);

      /*
      this.sets(i).controls.forEach((formControlSets, j) => {
        let setStat: SetStat = teamStat.setStats[j];
        if (!setStat) {
          setStat = emptySetStat(j + 1);
        }
        formControlSets
          .get('set')
          ?.setValue(setStat.points, { emitEvent: false });
      });

      this.selectedPlayers(game, false);
      */
    });
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
  /**
   * Determine the stage and set the variables related to it.
   */
  private setStage() {
    this.playoff = this.stage !== 'REGULAR';
    this.stageSets = this.playoff ? 5 : 3;

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
        this.stageText = 'Regular';
        break;
    }
    this.buildTeamStats(true);
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
    this.teamService.getTeamOptions(this.tournamentId, this.stage).subscribe({
      next: (teamOptions: Map<string, TeamOption[]>) => {
        this.teamOptionsMap = new Map(Object.entries(teamOptions));
      },
      error: (e: any) => {},
    });

    this.teamService.getTeams(this.tournamentId, '', this.stage).subscribe({
      next: (teams: Team[]) => {
        this.teamsMap = generateTeamMap(teams);
      },
      error: (e: any) => {},
    });
  }

  private createGame(): void {
    console.log('createGame', this.game);
    this.game.tournamentId = this.tournamentId;
    this.game.weekNumber = this.weekNumber;
    if (!this.playoff) {
      this.gamesService.postGame(this.game).subscribe({
        next: (result: CommonResponse) => {
          this.isProcessing = endProcessing(this.gameForm, this.dialog);
          openDialog(this.dialog, DialogMessageTypes.SUCCESS, result.response);
          this.reset();
          this.getGames();
        },
        error: (e: any) => {
          this.isProcessing = endProcessing(this.gameForm, this.dialog);
          openErrorDialog(this.dialog, e.status, e.error);
        },
      });
    }
  }

  private updateGame(): void {
    console.log('updateGame ', this.game);
    this.gamesService.putGame(this.game).subscribe({
      next: (result: CommonResponse) => {
        this.isProcessing = endProcessing(this.gameForm, this.dialog);
        openDialog(this.dialog, DialogMessageTypes.SUCCESS, result.response);
        this.reset();
        this.getGames();
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
      gamePlayed: player.gamePlayed ?? false,
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

  private enableFields(): void {
    this.teams.controls.forEach((formControl) => {
      formControl.enable({ emitEvent: false });
    });
  }

  private disableFields(): void {
    this.teams.controls.forEach((formControl) => {
      formControl.disable({ emitEvent: false });
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
      this.enableFields();
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
      });
    this.gameForm.get('gamePlace')!.valueChanges.subscribe((selectedValue) => {
      this.game.gamePlace = selectedValue;
    });

    this.gameForm.get('byDefault')!.valueChanges.subscribe((selectedValue) => {
      this.game.byDefault = selectedValue;
    });

    this.teams.controls.forEach((teamFormControl, i) => {
      teamFormControl.valueChanges.subscribe((formValue) => {
        if (this.lastTeamUpdated[i] !== formValue.name) {
          this.lastTeamUpdated[i] = formValue.name;
          this.game.teamStats[i].teamId = formValue.name;

          // SETs
          this.sets(i).controls.forEach((formControlSets, j) => {
            formControlSets.valueChanges.subscribe((setValue) => {
              this.game.teamStats[i].setStats[j].points = setValue.set;
            });
          });

          // Clear the players before adding new ones
          this.clearPlayers(i);
          // Load players to the model
          if (this.shouldClearPlayer) {
            this.game.teamStats[i].players = this.setPlayersByCategory(
              formValue.name,
            );
          }
          // Add players to the array
          this.game.teamStats[i].players.forEach((player: PlayerOption, p) => {
            //console.log('player added', i, player, p);
            this.addPlayer(i);
          });

          this.players(i).controls.forEach((formControlPlayers, j) => {
            (formControlPlayers as FormGroup).controls['player'].setValue(
              this.shouldClearPlayer
                ? false
                : this.game.teamStats[i].players[j].gamePlayed,
              { emitEvent: false },
            );
          });

          console.log(
            'team ',
            i,
            'players ',
            this.shouldClearPlayer,
            this.setPlayersByCategory(formValue.name),
            this.players(i).controls,
          );

          this.players(i).controls.forEach((formControlPlayers, j) => {
            /*
            console.log('players on game', i, this.game.teamStats[i].players);
            console.log('players on form', i, formControlPlayers);
            formControlPlayers.get('player')!.setValue(
              {
                player: this.game.teamStats[i].players[j].gamePlayed,
              },
              { emitEvent: false },
            );
            formControlPlayers.setValue(
              {
                player: this.game.teamStats[i].players[j].gamePlayed,
              },
              { emitEvent: false },
            );
            */
            formControlPlayers.valueChanges.subscribe((playerValue) => {
              this.game.teamStats[i].players[j].gamePlayed = playerValue.player;
            });
          });
          this.shouldClearPlayer = true;
          this.gameForm.updateValueAndValidity();
        }
      });
    });
  }

  private buildTeamStats(init: boolean) {
    for (let i = 0; i < this.teams.controls.length; i++) {
      for (let j = 0; j < this.stageSets; j++) {
        if (init) {
          this.addSet(i);
        }
        this.game.teamStats[i].setStats.push(emptySetStat(j + 1));
      }
    }
  }

  public teamsValidator(): ValidatorFn {
    return (): ValidationErrors | null => {
      const teamsIds = new Set();
      if (this.teams) {
        this.teams.controls.forEach((teamFormControl) => {
          teamsIds.add(teamFormControl.get('name')?.value);
        });
        this.teams.controls.forEach((teamFormControl) => {
          teamFormControl
            .get('name')
            ?.setErrors(teamsIds.size < 2 ? { duplicated: true } : null);
        });
      }
      return null;
    };
  }
}
