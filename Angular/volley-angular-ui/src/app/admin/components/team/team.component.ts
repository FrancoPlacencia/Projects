import { Component } from '@angular/core';
import {
  FormBuilder,
  FormGroup,
  FormsModule,
  ReactiveFormsModule,
  Validators,
} from '@angular/forms';
import { MatTableDataSource, MatTableModule } from '@angular/material/table';
import { Team } from '../../model/team.model';
import { TeamsService } from '../../services/teams.service';
import { TournamentService } from '../../services/tournament.service';
import { MatDialog } from '@angular/material/dialog';
import { ActivatedRoute, Router } from '@angular/router';
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
import { Tournament } from '../../model/tournament.model';
import { CommonModule } from '@angular/common';

// @angular/material
import { MatButtonModule } from '@angular/material/button';
import { MatCardModule } from '@angular/material/card';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatIconModule } from '@angular/material/icon';
import { MatInputModule } from '@angular/material/input';
import { MatListModule } from '@angular/material/list';
import { MatSlideToggleModule } from '@angular/material/slide-toggle';
import { MatSelectModule } from '@angular/material/select';
import { emptyTeam } from '../../../util/empty-model-util';
import { CommonResponse } from '../../../common/model/common-response.dto';

@Component({
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
  public category!: string;
  public categoryClass: string = '';
  public tournamentName!: string;

  // Flags
  public tableLoaded: boolean = false;
  public isProcessing: boolean = false;
  public isNew: boolean = true;

  // Table Data
  public columnsHeader: string[] = ['id', 'name', 'initials', 'action'];
  public dataSource: MatTableDataSource<any> | undefined;
  public errorMessage: string = '';

  // Form Data
  public formGroup: FormGroup;

  public teamId: number | undefined;

  private team: Team = emptyTeam();
  private tournamnetId!: number;
  // Inject External Service

  constructor(
    private teamsService: TeamsService,
    private tournamentService: TournamentService,
    private dialog: MatDialog,
    private route: ActivatedRoute,
    private router: Router,
    private formBuilder: FormBuilder
  ) {
    // Get data from URL
    this.route.queryParamMap.subscribe((params) => {
      this.tournamnetId = Number(params.get('id'))!;
      this.category = params.get('category')!;
      this.getTournament();
    });
    // Create the form group from DTO
    this.formGroup = this.formBuilder.group({
      name: [this.team.name, Validators.required],
      initials: [this.team.initials, Validators.required],
    });
    // Subscribe changes of Form Group to the DTO
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

    this.getTeams();
  }

  public reset(): void {
    this.team = emptyTeam();
    this.team.tournamentId = this.tournamnetId;
    this.team.category = this.category;

    this.teamId = this.team.teamId;
    this.isNew = true;

    resetFormGroup(this.formGroup);
    this.getTeams();
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
    this.team.teamId = team.teamId;
    this.team.tournamentId = team.tournamentId;
    this.teamId = team.teamId;
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
        }
      });
    }
  }

  public configure(team: Team): void {
    if (team.teamId) {
      this.router.navigate(['../player'], {
        relativeTo: this.route,
        queryParams: {
          id: team.teamId,
        },
      });
    }
  }

  // ======================================================
  // PRIVATE FUNCTIONS
  // ======================================================
  private createTeam(): void {
    this.teamsService.postTeam(this.team).subscribe({
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

  private getTeams(): void {
    this.teamsService.getTeams(this.tournamnetId, this.category!).subscribe({
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

  private getTournament(): void {
    this.tournamentService.getTournament(this.tournamnetId).subscribe({
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

  private deleteTeam(team: Team): void {
    this.teamsService.deleteTeam(team.teamId!).subscribe({
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
}
