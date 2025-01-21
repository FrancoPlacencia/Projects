import { MatTabsModule } from '@angular/material/tabs';
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
} from '../../util/form-util';
import {
  openConfirmDialog,
  openDialog,
  openErrorDialog,
} from '../../util/message-util';

// Comon
import { DialogMessageTypes } from '../../common/model/dialog-message-types';
import { CommonResponse } from '../../common/model/common-response.dto';
import { emptyTournament } from '../../util/empty-model-util';
import { TeamService } from '../../services/team.service';
import { TournamentApp } from '../../model/tournament-app.model';
import { Standing } from '../../model/standing.model';

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
    MatTabsModule,
  ],
  templateUrl: './tournament.component.html',
  styleUrl: './tournament.component.scss',
})
export class TournamentComponent {
  public errorMessage: string = '';

  public tournament: Tournament = emptyTournament();
  public tournamentApp?: TournamentApp;
  constructor(
    private tournamentService: TournamentService,
    private teamService: TeamService,
    private gameService: GameService,
    private formBuilder: FormBuilder,
    private dialog: MatDialog,
    private router: Router,
    private route: ActivatedRoute,
  ) {
    this.getTournamentApp();
  }

  private getTournamentApp() {
    this.teamService.getStandings(2).subscribe({
      next: (standingMap: Map<string, Standing[]>) => {
        console.log(
          'tournamentApp.standings ',
          typeof standingMap,
          standingMap,
          new Map(Object.entries(standingMap)),
        );

        /*
        this.tournamentApp.standings.forEach(
          (value: Standing[], key: string) => {
            console.log(key);
            console.log(value);
          },
        );
        */
      },
      error: (e: any) => {},
    });
  }
}
