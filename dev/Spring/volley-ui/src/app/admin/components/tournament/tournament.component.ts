import { Component } from '@angular/core';
import {
  FormBuilder,
  FormGroup,
  FormsModule,
  ReactiveFormsModule,
  Validators,
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

// Models
import { Tournament } from '../../model/tournament.model';
import { WeekOption } from './../../model/week-option.model';

// Services
import { WeekService } from './../../services/week.service';
import { TournamentService } from '../../services/tournament.service';

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

import { DialogMessageTypes } from '../../../common/model/dialog-message-types';

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
  public columnsHeader: string[] = ['name', 'year', 'rounds', 'action'];
  public dataSource: MatTableDataSource<any> | undefined;
  public errorMessage: string = '';

  // Form Data
  public formGroup: FormGroup;

  private tournament: Tournament;

  public tournamentWeeks: WeekOption[] = [];

  constructor(
    private tournamentService: TournamentService,
    private weekService: WeekService,
    private formBuilder: FormBuilder,
    private dialog: MatDialog,
    private router: Router,
    private route: ActivatedRoute
  ) {
    // initialize the object
    this.tournament = {
      name: '',
      year: new Date().getFullYear(),
      description: '',
      rounds: 0,
      url: '',
    };

    // create the form group and subscribe any changes to the object
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

    // Load existing data
    this.getTournaments();
  }

  public reset() {
    resetFormGroup(this.formGroup);
    this.isNew = true;
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
    this.tournament.tournamentUuid = tournament.tournamentUuid;
    this.formGroup.get('name')?.setValue(tournament.name);
    this.formGroup.get('year')?.setValue(tournament.year);
    this.formGroup.get('description')?.setValue(tournament.description);
    this.formGroup.get('rounds')?.setValue(tournament.rounds);
    this.formGroup.get('url')?.setValue(tournament.url);

    this.getWeekOptions(tournament.tournamentUuid!);
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
    if (this.tournament.tournamentUuid) {
      this.router.navigate(['../team'], {
        relativeTo: this.route,
        queryParams: {
          uuid: this.tournament.tournamentUuid,
          category: category,
        },
        //skipLocationChange: true
      });
    }
  }

  public gameDay(week: WeekOption) {
    console.log(week);
    this.router.navigate(['../game'], {
      relativeTo: this.route,
      queryParams: {
        uuid: week.tournamentUuid,
        weekNumber: week.weekNumber,
      },
      //skipLocationChange: true
    });
  }

  // ======================================================
  // PRIVATE FUNCTIONS
  // ======================================================
  private createTournament(): void {
    this.tournamentService.postTournament(this.tournament).subscribe({
      next: (tournament: Tournament) => {
        this.isProcessing = endProcessing(this.formGroup, this.dialog);
        openDialog(this.dialog, DialogMessageTypes.SUCCESS, 'Torneo', 'Creado');
        resetFormGroup(this.formGroup);
        this.getTournaments();
        this.isNew = true;
      },
      error: (e: any) => {
        this.isProcessing = endProcessing(this.formGroup, this.dialog);
        openErrorDialog(this.dialog, e.status, e.error);
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
      next: (tournament: Tournament) => {
        this.isProcessing = endProcessing(this.formGroup, this.dialog);
        resetFormGroup(this.formGroup);
        openDialog(
          this.dialog,
          DialogMessageTypes.SUCCESS,
          'Torneo',
          'Actualizado'
        );
        this.getTournaments();
        this.isNew = true;
      },
      error: (e: any) => {
        this.isProcessing = endProcessing(this.formGroup, this.dialog);
        openErrorDialog(this.dialog, e.status, e.error);
      },
    });
  }

  private deleteTournament(tournament: Tournament): void {
    console.log(tournament);
    this.tournamentService.deleteTournament(tournament).subscribe({
      next: (tournament: Tournament) => {
        this.isProcessing = endProcessing(this.formGroup, this.dialog);
        openDialog(
          this.dialog,
          DialogMessageTypes.SUCCESS,
          'Torneo',
          'Borrado'
        );
        this.getTournaments();
      },
      error: (e: any) => {
        this.isProcessing = endProcessing(this.formGroup, this.dialog);
        openErrorDialog(this.dialog, e.status, e.error);
      },
    });
  }

  public getWeekOptions(uuid: string): void {
    this.weekService.getWeekOptions(uuid).subscribe({
      next: (weekOptions: WeekOption[]) => {
        this.tournamentWeeks = weekOptions;
        console.log('Tournament Weeks ', this.tournamentWeeks);
      },
      error: (e: any) => {
        this.tournamentWeeks = [];
      },
    });
  }
}
