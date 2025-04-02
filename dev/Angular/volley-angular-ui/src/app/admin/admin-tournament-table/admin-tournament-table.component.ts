import {
  Component,
  EventEmitter,
  Input,
  OnChanges,
  Output,
  SimpleChanges,
} from '@angular/core';
import {
  animate,
  state,
  style,
  transition,
  trigger,
} from '@angular/animations';

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
import { Tournament } from '../../model/tournament.model';
import { navigateToTeam, navigateToWeek } from '../../util/navigate-util';
import { ActivatedRoute, Router } from '@angular/router';

@Component({
  selector: 'app-admin-tournament-table',
  imports: [
    CommonModule,
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
  animations: [
    trigger('detailExpand', [
      state('collapsed,void', style({ height: '0px', minHeight: '0' })),
      state('expanded', style({ height: '*' })),
      transition(
        'expanded <=> collapsed',
        animate('225ms cubic-bezier(0.4, 0.0, 0.2, 1)'),
      ),
    ]),
  ],
  templateUrl: './admin-tournament-table.component.html',
  styleUrl: './admin-tournament-table.component.scss',
})
export class AdminTournamentTableComponent implements OnChanges {
  @Input() tournaments: Tournament[] = [];

  @Output() editTournament = new EventEmitter<Tournament>();
  @Output() deleteTournament = new EventEmitter<Tournament>();

  public tableLoaded: boolean = false;
  public isProcessing: boolean = false;
  public isNew: boolean = true;

  public columnsToDisplay: string[] = [
    'id',
    'name',
    'year',
    'rounds',
    'stage',
    'regular',
    'elimination',
    'femElimination',
    'varElimination',
    'mixElimination',
    'active',
    'action',
  ];
  public columnsToDisplayWithExpand = [...this.columnsToDisplay, 'expand'];
  public dataSource: MatTableDataSource<any> | undefined;
  public expandedElement: Tournament | null | undefined;

  public errorMessage: string = '';

  constructor(
    private router: Router,
    private route: ActivatedRoute,
  ) {
    this.dataSource = new MatTableDataSource(this.tournaments);
  }

  ngOnChanges(changes: SimpleChanges): void {
    this.tournaments = changes['tournaments'].currentValue;
    this.dataSource = new MatTableDataSource(this.tournaments);
  }

  public edit(tournament: Tournament): void {
    this.editTournament.emit(tournament);
  }

  public delete(tournament: Tournament): void {
    this.deleteTournament.emit(tournament);
  }

  public eliminations(tournamentId: number, stage: string): void {
    this.router.navigate(['../game'], {
      relativeTo: this.route,
      queryParams: {
        id: tournamentId,
        stage: stage,
      },
    });
  }

  public team(category: string, tournamentId: number): void {
    navigateToTeam(tournamentId, category, this.router, this.route);
  }

  public gameWeek(tournamentId: number, week: number) {
    navigateToWeek(tournamentId, week, this.router, this.route);
  }

  public newGameWeek(tournamentId: number, newWeekNumber: number) {
    newWeekNumber++;
    navigateToWeek(tournamentId, newWeekNumber, this.router, this.route);
  }
}
