import { Component, Input } from '@angular/core';
import { FormGroup, FormsModule, ReactiveFormsModule } from '@angular/forms';
import { MatTableDataSource, MatTableModule } from '@angular/material/table';
import { Team } from '../../model/team.model';
import { TeamService } from '../../services/team.service';
import { TournamentService } from '../../services/tournament.service';
import { MatDialog } from '@angular/material/dialog';
import { ActivatedRoute, Router } from '@angular/router';
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
import { DialogMessageTypes } from '../../common/model/dialog-message-types';
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
import { emptyTeam } from '../../util/empty-model-util';
import { CommonResponse } from '../../common/model/common-response.dto';
import { TeamOption } from '../../model/team-option.model';

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
  @Input() team!: Team;

  @Input() teamFilter: number = 0;
  public teams: Team[] = [];
  public teamOptions: TeamOption[] = [];

  public category: string = '';
  public teamId: number = 0;

  public minQualify = 50;

  public qualify = 60;

  constructor() {}
}
