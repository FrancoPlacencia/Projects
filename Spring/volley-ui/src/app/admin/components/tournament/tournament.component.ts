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
import { openCommonDialog, openConfirmDialog, openErrorDialog } from '../../../util/message-util';
import { successResponse } from '../../../util/response-util';
import { CommonResponse } from '../../../common/model/common-response.dto';
import { DialogMessageTypes } from '../../../common/model/dialog-message-types';
import { ActivatedRoute, Router } from '@angular/router';


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
    private dialog: MatDialog,
    private router: Router,
    private route: ActivatedRoute
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
    this.tournament.tournamentUuid = tournament.tournamentUuid;
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

  public team(tournament: Tournament): void {
    this.router.navigate(['/admin/team', {uuid: tournament.tournamentUuid}]);
    //this.router.navigate(['team', 33, 'user', 11]);
    this.router.navigate(['../team'], {relativeTo: this.route, queryParams: {uuid: tournament.tournamentUuid},skipLocationChange: true})
  }

  // ======================================================
  // PRIVATE FUNCTIONS
  // ======================================================
  private createTournament(): void {
    this.tournamentService.postTournament(this.tournament).subscribe({
      next: (tournament: Tournament) => {
        this.isProcessing = endProcessing(this.formGroup, this.dialog);
        openCommonDialog(this.dialog, successResponse('Torneo', 'Creado'));
        resetFormGroup(this.formGroup);
        this.getTournaments();
        this.isNew = true;
      },
      error: (e: any) => {
        this.isProcessing = endProcessing(this.formGroup, this.dialog);
        e.status == 0 ? openErrorDialog(this.dialog) : openCommonDialog(this.dialog, e.error);
      }
    });
  }


  private getTournaments(): void {
    this.tournamentService.getTournaments().subscribe({
      next: (tournaments : Tournament[]) => {
        if(tournaments && tournaments.length > 0) {
          this.dataSource = new MatTableDataSource(tournaments);
        } else {
          this.dataSource = undefined;
          this.errorMessage = "Nothing to display...";
        }
      },
      error: (e: any) => {
        this.errorMessage = 'Unable to load the data!';
      }
    });
    this.tableLoaded = true;
  }

  private updateTournament(): void {
    this.tournamentService.putTournament(this.tournament).subscribe({
      next: (tournament: Tournament) => {
        this.isProcessing = endProcessing(this.formGroup, this.dialog);
        resetFormGroup(this.formGroup);
        openCommonDialog(this.dialog, successResponse('Torneo', 'Actualizado'));
        this.getTournaments();
        this.isNew = true;
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
        this.isProcessing = endProcessing(this.formGroup, this.dialog);
        openCommonDialog(this.dialog, successResponse('Torneo', 'Borrado'));
        this.getTournaments();
      },
      error: (e :any) => {
        this.isProcessing = endProcessing(this.formGroup, this.dialog);
        e.status == 0 ? openErrorDialog(this.dialog) : openCommonDialog(this.dialog, e.error);
      }
    });
  }

}


