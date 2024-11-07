import { CommonModule } from '@angular/common';
import { Component } from '@angular/core';
import { FormBuilder, FormGroup, FormsModule, ReactiveFormsModule, Validators } from '@angular/forms';

import { MatCardModule } from '@angular/material/card';
import { MatTableDataSource, MatTableModule } from '@angular/material/table';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatButtonModule } from '@angular/material/button';
import { MatInputModule } from '@angular/material/input';
import { MatDialog } from '@angular/material/dialog';
import { MatIconModule } from '@angular/material/icon';
import { MatListModule } from '@angular/material/list';
import { MatSlideToggleModule } from '@angular/material/slide-toggle';

import { Tournament } from './tournament.model';
import { TournamentService } from '../../services/tournament.service';
import { endProcessing, resetFormGroup, startProcessing } from '../../../util/form-util';
import { openCommonDialog, openConfirmDialog } from '../../../util/message-util';
import { successResponse } from '../../../util/response-util';
import { CommonResponse } from '../../../common/model/common-response.dto';
import { DialogMessageTypes } from '../../../common/model/dialog-message-types';


@Component({
  selector: 'app-tournament',
  standalone: true,
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
    MatTableModule

  ],
  templateUrl: './tournament.component.html',
  styleUrl: './tournament.component.scss'
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

  constructor(
    private tournamentService: TournamentService,
    private formBuilder: FormBuilder,
    private dialog: MatDialog
  ) {
    // initialize the object
    this.tournament = {
      name: '',
      year: (new Date()).getFullYear(),
      description: '',
      rounds: 0,
      url: ''
    }

    // create the form group and subscribe any changes to the object
    this.formGroup = this.formBuilder.group({
      name: [this.tournament.name, Validators.required],
      year: [this.tournament.year, Validators.required],
      description: [this.tournament.description, Validators.required],
      rounds: [this.tournament.rounds,[
        Validators.required,
        Validators.maxLength,
        Validators.max,
        Validators.min
      ]],
      url: [this.tournament.url, Validators.required]
    });

    this.formGroup.get("name")!.valueChanges.subscribe(selectedValue => {
      this.tournament.name = selectedValue;
    });

    this.formGroup.get("year")!.valueChanges.subscribe(selectedValue => {
      this.tournament.year = selectedValue;
    });
    this.formGroup.get("description")!.valueChanges.subscribe(selectedValue => {
      this.tournament.description = selectedValue;
    });
    this.formGroup.get("rounds")!.valueChanges.subscribe(selectedValue => {
      this.tournament.rounds = selectedValue;
    });
    this.formGroup.get("url")!.valueChanges.subscribe(selectedValue => {
      this.tournament.url = selectedValue;
    });

    // Load existing data
    this.getTournaments()
  }

  public reset() {
    resetFormGroup(this.formGroup);
    this.isNew = true;
  }

  public submit(): void {
    this.formGroup.markAllAsTouched();
    if (this.formGroup.status === "VALID") {
      this.isProcessing = startProcessing(this.formGroup, this.dialog);
      this.isNew ? this.createTournament() : this.updateTournament();
    }
  }

  public edit(tournament: Tournament): void {
    this.isNew = false;
    this.tournament.uuid = tournament.uuid;
    this.formGroup.get("name")?.setValue(tournament.name);
    this.formGroup.get("year")?.setValue(tournament.year);
    this.formGroup.get("description")?.setValue(tournament.description);
    this.formGroup.get("rounds")?.setValue(tournament.rounds);
    this.formGroup.get("url")?.setValue(tournament.url);
  }

  public delete(tournament: Tournament): void {
    if(tournament) {
      const dialogRef = openConfirmDialog(this.dialog);
      dialogRef.afterClosed().subscribe(result => {
        if (result) {
          this.isProcessing = startProcessing(this.formGroup, this.dialog);
          this.deleteTournament(tournament);
        }
      });
    }
  }

  private getTournaments(): void {
    this.tournamentService.getTournaments().subscribe({
      next: (tournaments : Tournament[]) => {
        if(tournaments) {
          if(tournaments.length > 0) {
            console.log(tournaments);
            this.dataSource = new MatTableDataSource(tournaments);
          } else {
            this.dataSource = undefined;
            this.errorMessage = "Nothing to display...";
          }
        } else {
          this.dataSource = undefined;
          this.errorMessage = "Nothing to display...";
        }
      },
      error: (e: any) => {
        console.log(e);
        this.errorMessage = 'Unable to load the data!';
      }
    });
    this.tableLoaded = true;
  }


  private createTournament(): void {
    console.log('CREATE');
    this.tournamentService.postTournament(this.tournament).subscribe({
      next: (tournament: Tournament) => {
        this.isProcessing = endProcessing(this.formGroup, this.dialog);
        openCommonDialog(this.dialog, successResponse('Torneo', 'Creado'));
        resetFormGroup(this.formGroup);
        this.isNew = true;
        this.getTournaments();
      },
      error: (e: any) => {
        console.log(e.error);
      }
    });
  }

  private updateTournament(): void {
    this.tournamentService.putTournament(this.tournament).subscribe({
      next: (tournament: Tournament) => {
        this.isProcessing = endProcessing(this.formGroup, this.dialog);
        resetFormGroup(this.formGroup);

        this.isNew = true;
        console.log(tournament);
      },
      error: (e: any) => {
        console.log(e.error);
      }
    });
  }

  private deleteTournament(tournament: Tournament): void {
    console.log(tournament);
    this.tournamentService.deleteTournament(tournament).subscribe({
      next: (tournament: Tournament) => {
        console.log(tournament);
      },
      error: (e :any) => {
        console.log(e.error)
      }
    });
  }

}


