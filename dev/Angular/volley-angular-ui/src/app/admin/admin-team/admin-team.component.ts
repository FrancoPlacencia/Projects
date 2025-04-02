// @angular
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
import { MatTableDataSource, MatTableModule } from '@angular/material/table';
import { MatDialog } from '@angular/material/dialog';
import { MatButtonModule } from '@angular/material/button';
import { MatCardModule } from '@angular/material/card';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatIconModule } from '@angular/material/icon';
import { MatInputModule } from '@angular/material/input';
import { MatListModule } from '@angular/material/list';
import { MatSlideToggleModule } from '@angular/material/slide-toggle';
import { MatSelectModule } from '@angular/material/select';

// Models
import { Tournament } from '../../model/tournament.model';
import { Team } from '../../model/team.model';

// Services
import { TeamService } from '../../services/team.service';
import { TournamentService } from '../../services/tournament.service';

// Utils
import { emptyTeam } from '../../util/empty-model-util';
import { AppConstant } from '../../util/app-constant';
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
import {
  navigateToPlayer,
  navigateToTournament,
} from '../../util/navigate-util';

@Component({
  selector: 'app-admin-team',
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
  templateUrl: './admin-team.component.html',
  styleUrl: './admin-team.component.scss',
})
export class AdminTeamComponent {
  public category!: string;
  public categoryClass: string = '';
  public tournamentName!: string;

  // Flags
  public tableLoaded: boolean = false;
  public isProcessing: boolean = false;
  public isNew: boolean = true;

  // Table Data
  public columnsHeader: string[] = [
    'number',
    'name',
    'initials',
    'id',
    'players',
    'action',
  ];
  public dataSource: MatTableDataSource<any> | undefined;
  public errorMessage: string = '';

  // Form Data
  public formGroup: FormGroup;

  public teamId: number | undefined;

  private team: Team = emptyTeam();
  private tournamnetId!: number;
  // Inject External Service

  constructor(
    private teamService: TeamService,
    private tournamentService: TournamentService,
    private dialog: MatDialog,
    private route: ActivatedRoute,
    private router: Router,
    private formBuilder: FormBuilder,
  ) {
    // Get data from URL
    this.route.queryParamMap.subscribe((params) => {
      this.tournamnetId = Number(params.get('id'))!;
      this.category = params.get('category')!;
      this.team.category = this.category;
      this.team.tournamentId = this.tournamnetId;
      this.getTournament();
    });
    // Create the form group from DTO
    this.formGroup = this.formBuilder.group({
      teamNumber: [undefined, Validators.required],
      name: [undefined, Validators.required],
      initials: [undefined, Validators.required],
    });
    // Subscribe changes of Form Group to the DTO
    this.formGroup
      .get('teamNumber')!
      .valueChanges.subscribe((selectedValue: number) => {
        this.team.teamNumber = selectedValue;
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
    this.team.teamId = team.teamId;
    this.team.tournamentId = team.tournamentId;
    this.team.teamNumber = team.teamNumber;

    this.teamId = team.teamId;
    this.isNew = false;

    this.formGroup.get('teamNumber')?.setValue(team.teamNumber);
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
      navigateToPlayer(
        team.tournamentId!,
        team.category,
        team.teamId,
        this.router,
        this.route,
      );
      /*
      this.router.navigate(['../player'], {
        relativeTo: this.route,
        queryParams: {
          id: team.teamId,
          tournament: team.tournamentId,
          category: team.category,
        },
      });
      */
    }
  }

  public tournament(): void {
    navigateToTournament(this.router, this.route);
  }

  public playoff(): void {
    this.router.navigate(['../playoff'], {
      relativeTo: this.route,
      queryParams: {
        id: this.tournamnetId,
        category: this.category,
      },
    });
  }

  // ======================================================
  // PRIVATE FUNCTIONS
  // ======================================================
  private createTeam(): void {
    this.team.stage = 'REGULAR';
    this.teamService.postTeam(this.team).subscribe({
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
    this.teamService
      .getTeams(this.tournamnetId, this.category!, 'REGULAR')
      .subscribe({
        next: (teams: Team[]) => {
          if (teams && teams.length > 0) {
            console.log(teams);
            this.dataSource = new MatTableDataSource(teams);
          } else {
            this.dataSource = undefined;
            console.log('nothing to display');
            this.errorMessage = AppConstant.NOTHING_TO_DISPLAY;
          }
        },
        error: (e: any) => {
          console.log('unable to load');
          this.errorMessage = AppConstant.UNABLE_TO_LOAD;
        },
      });
    this.tableLoaded = true;
  }

  private getTournament(): void {
    this.tournamentService.getTournamentById(this.tournamnetId).subscribe({
      next: (tournament: Tournament) => {
        this.tournamentName = tournament.name;
      },
      error: (e: any) => {
        this.tournamentName = '';
      },
    });
  }

  private updateTeam(): void {
    this.teamService.putTeam(this.team).subscribe({
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
    this.teamService.deleteTeam(team.teamId!).subscribe({
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
