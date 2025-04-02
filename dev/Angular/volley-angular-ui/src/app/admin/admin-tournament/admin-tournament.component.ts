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
import { MatDialog } from '@angular/material/dialog';
import { MatSelectModule } from '@angular/material/select';

// Models
import { Tournament } from '../../model/tournament.model';
import { WeekOption } from '../../model/week-option.model';

// Services
import { TournamentService } from '../../services/tournament.service';

// Utils
import {
  endProcessing,
  resetFormGroup,
  startProcessing,
} from '../../util/form-util';
import {
  openConfirmDialog,
  openDialog,
  openErrorDialog,
} from '../../util/message-util';

// Common
import { DialogMessageTypes } from '../../common/model/dialog-message-types';
import { CommonResponse } from '../../common/model/common-response.dto';
import { emptyTournament } from '../../util/empty-model-util';
import { AppConstant } from '../../util/app-constant';
import { AdminTournamentTableComponent } from '../admin-tournament-table/admin-tournament-table.component';

@Component({
  selector: 'app-admin-tournament',
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
    AdminTournamentTableComponent,
  ],
  templateUrl: './admin-tournament.component.html',
  styleUrl: './admin-tournament.component.scss',
})
export class AdminTournamentComponent {
  public tournaments: Tournament[] = [];

  public isProcessing: boolean = false;
  public isNew: boolean = true;

  public formGroup: FormGroup;

  public tournamentWeeks: WeekOption[] = [];

  public tournamentId: number | undefined;
  private tournament: Tournament = emptyTournament();

  constructor(
    private tournamentService: TournamentService,
    private formBuilder: FormBuilder,
    private dialog: MatDialog,
    private router: Router,
    private route: ActivatedRoute,
  ) {
    this.formGroup = this.formBuilder.group({
      name: [undefined, Validators.required],
      year: [undefined, Validators.required],
      description: [undefined, Validators.required],
      rounds: [
        undefined,
        [
          Validators.required,
          Validators.maxLength,
          Validators.max,
          Validators.min,
        ],
      ],
      stage: [undefined, Validators.required],
      regularSets: [undefined, Validators.required],
      eliminationSets: [undefined, Validators.required],
      femElimination: [undefined, Validators.required],
      varElimination: [undefined, Validators.required],
      mixElimination: [undefined, Validators.required],
      url: [undefined, Validators.required],
      isActive: [false, Validators.required],
    });
    this.formGroup
      .get('name')!
      .valueChanges.subscribe((selectedValue: string) => {
        this.tournament.name = selectedValue;
      });
    this.formGroup
      .get('year')!
      .valueChanges.subscribe((selectedValue: number) => {
        this.tournament.year = selectedValue;
      });
    this.formGroup
      .get('description')!
      .valueChanges.subscribe((selectedValue: string) => {
        this.tournament.description = selectedValue;
      });
    this.formGroup
      .get('rounds')!
      .valueChanges.subscribe((selectedValue: number) => {
        this.tournament.rounds = selectedValue;
      });
    this.formGroup
      .get('stage')!
      .valueChanges.subscribe((selectedValue: string) => {
        this.tournament.stage = selectedValue;
      });
    this.formGroup
      .get('regularSets')!
      .valueChanges.subscribe((selectedValue: number) => {
        this.tournament.regularSets = selectedValue;
      });
    this.formGroup
      .get('eliminationSets')!
      .valueChanges.subscribe((selectedValue: number) => {
        this.tournament.eliminationSets = selectedValue;
      });
    this.formGroup
      .get('femElimination')!
      .valueChanges.subscribe((selectedValue: number) => {
        this.tournament.femElimination = selectedValue;
      });
    this.formGroup
      .get('varElimination')!
      .valueChanges.subscribe((selectedValue: number) => {
        this.tournament.varElimination = selectedValue;
      });
    this.formGroup
      .get('mixElimination')!
      .valueChanges.subscribe((selectedValue: number) => {
        this.tournament.mixElimination = selectedValue;
      });
    this.formGroup.get('url')!.valueChanges.subscribe((selectedValue) => {
      this.tournament.url = selectedValue;
    });
    this.formGroup.get('isActive')!.valueChanges.subscribe((selectedValue) => {
      this.tournament.isActive = selectedValue;
    });
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
    this.formGroup.get('stage')?.setValue(tournament.stage);
    this.formGroup.get('regularSets')?.setValue(tournament.regularSets);
    this.formGroup.get('eliminationSets')?.setValue(tournament.eliminationSets);
    this.formGroup.get('femElimination')?.setValue(tournament.femElimination);
    this.formGroup.get('varElimination')?.setValue(tournament.varElimination);
    this.formGroup.get('mixElimination')?.setValue(tournament.mixElimination);
    this.formGroup.get('url')?.setValue(tournament.url);
    this.formGroup.get('isActive')?.setValue(tournament.isActive);
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
          this.tournaments = tournaments;
        } else {
          this.tournaments = [];
        }
      },
      error: (e: any) => {},
    });
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
}
