// @angular
import { Component } from '@angular/core';
import {
  FormBuilder,
  FormGroup,
  Validators,
  FormsModule,
  ReactiveFormsModule,
} from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { CommonModule } from '@angular/common';

// @angular/material
import { MatButtonModule } from '@angular/material/button';
import { MatCardModule } from '@angular/material/card';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatIconModule } from '@angular/material/icon';
import { MatInputModule } from '@angular/material/input';
import { MatListModule } from '@angular/material/list';
import { MatSlideToggleModule } from '@angular/material/slide-toggle';
import { MatTableDataSource, MatTableModule } from '@angular/material/table';
import { MatDialog } from '@angular/material/dialog';
import { MatSelectModule } from '@angular/material/select';
// Models
import { Tournament } from '../../model/tournament.model';
import { WeekOption } from '../../model/week-option.model';

// Services
import { TournamentService } from '../../services/tournament.service';
import { GameService } from '../../services/game.service';

// Util
import {
  endProcessing,
  resetFormGroup,
  startProcessing,
} from '../../../util/form-util';
import {
  openConfirmDialog,
  openDialog,
  openErrorDialog,
} from '../../../util/message-util';

// Comon
import { DialogMessageTypes } from '../../../common/model/dialog-message-types';
import { CommonResponse } from '../../../common/model/common-response.dto';
import { emptyTournament } from '../../../util/empty-model-util';

@Component({
  selector: 'app-tournament',
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
    MatTableModule,
    MatSelectModule,
  ],
  templateUrl: './tournament.component.html',
  styleUrl: './tournament.component.scss',
})
export class TournamentComponent {
  // Flags
  public tableLoaded: boolean = false;
  public isProcessing: boolean = false;
  public isNew: boolean = true;

  // Table Data
  public columnsHeader: string[] = ['id', 'name', 'year', 'rounds', 'action'];
  public dataSource: MatTableDataSource<any> | undefined;
  public errorMessage: string = '';

  // Form Data
  public formGroup: FormGroup;

  public tournamentWeeks: WeekOption[] = [];

  public tournamentId: number | undefined;
  private tournament: Tournament = emptyTournament();

  constructor(
    private tournamentService: TournamentService,
    private gameService: GameService,
    private formBuilder: FormBuilder,
    private dialog: MatDialog,
    private router: Router,
    private route: ActivatedRoute
  ) {
    // Create the form group from DTO
    this.formGroup = this.formBuilder.group({
      name: [this.tournament.name, Validators.required],
      year: [this.tournament.year, Validators.required],
      description: [this.tournament.description, Validators.required],
      rounds: [
        this.tournament.rounds,
        [
          Validators.required,
          Validators.maxLength,
          Validators.max,
          Validators.min,
        ],
      ],
      url: [this.tournament.url, Validators.required],
    });
    // Subscribe changes of Form Group to the DTO
    this.formGroup.get('name')!.valueChanges.subscribe((selectedValue) => {
      this.tournament.name = selectedValue;
    });
    this.formGroup.get('year')!.valueChanges.subscribe((selectedValue) => {
      this.tournament.year = selectedValue;
    });
    this.formGroup
      .get('description')!
      .valueChanges.subscribe((selectedValue) => {
        this.tournament.description = selectedValue;
      });
    this.formGroup.get('rounds')!.valueChanges.subscribe((selectedValue) => {
      this.tournament.rounds = selectedValue;
    });
    this.formGroup.get('url')!.valueChanges.subscribe((selectedValue) => {
      this.tournament.url = selectedValue;
    });
    // Load table data
    this.getTournaments();
  }

  public reset() {
    this.tournament = emptyTournament();

    this.tournamentId = this.tournament.tournamentId;
    this.isNew = true;

    resetFormGroup(this.formGroup);
    this.getTournaments();
  }

  public submit(): void {
    this.formGroup.markAllAsTouched();
    if (this.formGroup.status === 'VALID') {
      this.isProcessing = startProcessing(this.formGroup, this.dialog);
      this.isNew ? this.createTournament() : this.updateTournament();
    }
  }

  public edit(tournament: Tournament): void {
    this.isNew = false;
    this.tournament.tournamentId = tournament.tournamentId;
    this.tournamentId = tournament.tournamentId;
    this.formGroup.get('name')?.setValue(tournament.name);
    this.formGroup.get('year')?.setValue(tournament.year);
    this.formGroup.get('description')?.setValue(tournament.description);
    this.formGroup.get('rounds')?.setValue(tournament.rounds);
    this.formGroup.get('url')?.setValue(tournament.url);

    this.getWeekOptions(tournament.tournamentId!);
  }

  public delete(tournament: Tournament): void {
    if (tournament) {
      const dialogRef = openConfirmDialog(this.dialog, 'Borrar', 'Torneo');
      dialogRef.afterClosed().subscribe((result) => {
        if (result) {
          this.isProcessing = startProcessing(this.formGroup, this.dialog);
          this.deleteTournament(tournament);
        }
      });
    }
  }

  public team(category: string): void {
    if (this.tournament.tournamentId) {
      this.router.navigate(['../team'], {
        relativeTo: this.route,
        queryParams: {
          id: this.tournament.tournamentId,
          category: category,
        },
        //skipLocationChange: true
      });
    }
  }

  public gameWeek(week: WeekOption) {
    this.router.navigate(['../game'], {
      relativeTo: this.route,
      queryParams: {
        id: week.tournamentId,
        weekNumber: week.weekNumber,
      },
      //skipLocationChange: true
    });
  }

  public newGameWeek() {
    let newWeekNumber = this.tournamentWeeks.length + 1;
    this.router.navigate(['../game'], {
      relativeTo: this.route,
      queryParams: {
        id: this.tournament.tournamentId,
        weekNumber: newWeekNumber,
      },
      //skipLocationChange: true
    });
  }

  // ======================================================
  // PRIVATE FUNCTIONS
  // ======================================================
  private createTournament(): void {
    this.tournamentService.postTournament(this.tournament).subscribe({
      next: (result: CommonResponse) => {
        this.isProcessing = endProcessing(this.formGroup, this.dialog);
        openDialog(this.dialog, DialogMessageTypes.SUCCESS, result.response);
        this.reset();
      },
      error: (e: any) => {
        this.isProcessing = endProcessing(this.formGroup, this.dialog);
        openErrorDialog(this.dialog, e.status, e.error.result);
      },
    });
  }

  private getTournaments(): void {
    this.tournamentService.getTournaments().subscribe({
      next: (tournaments: Tournament[]) => {
        if (tournaments && tournaments.length > 0) {
          this.dataSource = new MatTableDataSource(tournaments);
        } else {
          this.dataSource = undefined;
          this.errorMessage = 'Nothing to display...';
        }
      },
      error: (e: any) => {
        this.errorMessage = 'Unable to load the data!';
      },
    });
    this.tableLoaded = true;
  }

  private updateTournament(): void {
    this.tournamentService.putTournament(this.tournament).subscribe({
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

  private deleteTournament(tournament: Tournament): void {
    this.tournamentService
      .deleteTournament(tournament.tournamentId!)
      .subscribe({
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

  private getWeekOptions(id: number): void {
    this.gameService.getWeekOptions(id).subscribe({
      next: (weekOptions: WeekOption[]) => {
        this.tournamentWeeks = weekOptions;
      },
      error: (e: any) => {
        this.tournamentWeeks = [];
      },
    });
  }
}
