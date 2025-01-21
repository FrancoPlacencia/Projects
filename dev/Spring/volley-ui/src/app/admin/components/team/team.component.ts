import { Tournament } from './../../model/tournament.model';
import { TournamentService } from './../../services/tournament.service';
import { TeamsService } from './../../services/teams.service';

import { CommonModule } from '@angular/common';
import { Component, inject, Inject, Input } from '@angular/core';
import {
  FormsModule,
  ReactiveFormsModule,
  FormBuilder,
  Validators,
  FormGroup,
} from '@angular/forms';

// Materials
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

import { ActivatedRoute, Router } from '@angular/router';
import { Team } from '../../model/team.model';

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
import { successResponse } from '../../../util/response-util';
import { DialogMessageTypes } from '../../../common/model/dialog-message-types';

@Component({
  standalone: true,
  selector: 'app-team',
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
  templateUrl: './team.component.html',
  styleUrl: './team.component.scss',
})
export class TeamComponent {
  private uuid!: string;
  public category!: string;
  public categoryClass: string = '';
  public tournamentName!: string;

  // Flags
  public tableLoaded: boolean = false;
  public isProcessing: boolean = false;
  public isNew: boolean = true;

  // Table Data
  public columnsHeader: string[] = ['name', 'initials', 'action'];
  public dataSource: MatTableDataSource<any> | undefined;
  public errorMessage: string = '';

  // Form Data
  public formGroup: FormGroup;

  private team: Team;

  // Inject External Service

  private formBuilder: FormBuilder = inject(FormBuilder);
  private route: ActivatedRoute = inject(ActivatedRoute);
  constructor(
    private teamsService: TeamsService,
    private tournamentService: TournamentService,
    private dialog: MatDialog
  ) {
    this.route.queryParamMap.subscribe((params) => {
      console.log(params);
      this.uuid = params.get('uuid')!;
      this.category = params.get('category')!;
      this.categoryClass = `color-clear-${this.category
        .substring(0, 3)
        .toLowerCase()}`;
    });

    this.team = {
      tournamentUuid: this.uuid,
      name: '',
      initials: '',
      category: this.category!,
      isActive: false,
    };

    this.formGroup = this.formBuilder.group({
      name: [this.team.name, Validators.required],
      initials: [this.team.initials, Validators.required],
      //isActive: [this.team.isActive, Validators.required],
    });

    this.formGroup
      .get('name')!
      .valueChanges.subscribe((selectedValue: string) => {
        this.team.name = selectedValue;
      });
    this.formGroup
      .get('initials')!
      .valueChanges.subscribe((selectedValue: string) => {
        this.team.initials = selectedValue;
      });
    /*
    this.formGroup
      .get('isActive')!
      .valueChanges.subscribe((selectedValue: boolean) => {
        this.team.isActive = selectedValue;
      });
*/
    this.getTeams();
    this.getTournament();
  }

  public reset(): void {
    resetFormGroup(this.formGroup);
    this.isNew = true;
  }

  public submit(): void {
    this.formGroup.markAllAsTouched();
    if (this.formGroup.status === 'VALID') {
      this.isProcessing = startProcessing(this.formGroup, this.dialog);
      this.team.name = this.team.name.toUpperCase();
      this.team.initials = this.team.initials.toUpperCase();
      this.isNew ? this.createTeam() : this.updateTeam();
    }
  }

  public edit(team: Team): void {
    this.isNew = false;
    this.team.teamUuid = team.teamUuid;
    this.team.tournamentUuid = team.tournamentUuid;
    this.formGroup.get('name')?.setValue(team.name);
    this.formGroup.get('initials')?.setValue(team.initials);
  }

  public delete(team: Team): void {
    if (team) {
      const dialogRef = openConfirmDialog(this.dialog, 'Borrar', 'Equipo');
      dialogRef.afterClosed().subscribe((result) => {
        if (result) {
          this.isProcessing = startProcessing(this.formGroup, this.dialog);
          this.deleteTeam(team);
        } else {
          console.log('canceled');
        }
      });
    }
  }

  private createTeam(): void {
    console.log('team ', this.team);
    this.teamsService.postTeam(this.team).subscribe({
      next: (team: Team) => {
        this.isProcessing = endProcessing(this.formGroup, this.dialog);
        this.isNew = true;

        openDialog(this.dialog, DialogMessageTypes.SUCCESS, 'Equipo', 'Creado');
        resetFormGroup(this.formGroup);
        this.getTeams();
      },
      error: (e: any) => {
        this.isProcessing = endProcessing(this.formGroup, this.dialog);
        openErrorDialog(this.dialog, e.status, e.error);
      },
    });
  }

  public getTeams(): void {
    this.teamsService.getTeams(this.uuid, this.category!).subscribe({
      next: (teams: Team[]) => {
        if (teams && teams.length > 0) {
          this.dataSource = new MatTableDataSource(teams);
        } else {
          this.dataSource = undefined;
          this.errorMessage = 'Nothing to display';
        }
      },
      error: (e: any) => {
        this.errorMessage = 'Unable to load the Data!';
      },
    });
    this.tableLoaded = true;
  }

  public getTournament(): void {
    this.tournamentService.getTournament(this.uuid).subscribe({
      next: (tournament: Tournament) => {
        this.tournamentName = tournament.name;
      },
      error: (e: any) => {
        this.tournamentName = '';
      },
    });
  }

  private updateTeam(): void {
    this.teamsService.putTeam(this.team).subscribe({
      next: (team: Team) => {
        this.isProcessing = endProcessing(this.formGroup, this.dialog);
        resetFormGroup(this.formGroup);
        openDialog(
          this.dialog,
          DialogMessageTypes.SUCCESS,
          'Torneo',
          'Actualizado'
        );
        this.getTeams();
        this.isNew = true;
      },
      error: (e: any) => {
        this.isProcessing = endProcessing(this.formGroup, this.dialog);
        openErrorDialog(this.dialog, e.status, e.error);
      },
    });
  }

  private deleteTeam(team: Team): void {
    this.teamsService.deleteTeam(team).subscribe({
      next: (team: Team) => {
        this.isProcessing = endProcessing(this.formGroup, this.dialog);
        openDialog(
          this.dialog,
          DialogMessageTypes.SUCCESS,
          'Equipo',
          'Borrado'
        );
        this.getTeams();
      },
      error: (e: any) => {
        this.isProcessing = endProcessing(this.formGroup, this.dialog);
        openErrorDialog(this.dialog, e.status, e.error);
      },
    });
  }

  public configure(team: Team): void {
    if (team.teamUuid) {
      this.router.navigate(['../player'], {
        relativeTo: this.route,
        queryParams: {
          uuid: team.teamUuid,
        },
        //skipLocationChange: true
      });
    }
  }
}
