import { CommonModule } from '@angular/common';
import { Component } from '@angular/core';
import {
  FormBuilder,
  FormGroup,
  FormsModule,
  ReactiveFormsModule,
  Validators,
} from '@angular/forms';
import { MatButtonModule } from '@angular/material/button';
import { MatCardModule } from '@angular/material/card';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatIconModule } from '@angular/material/icon';
import { MatInputModule } from '@angular/material/input';
import { MatListModule } from '@angular/material/list';
import { MatSelectModule } from '@angular/material/select';
import { MatSlideToggleModule } from '@angular/material/slide-toggle';
import { MatTableDataSource, MatTableModule } from '@angular/material/table';
import { Player } from '../../model/player.model';
import { Team } from '../../model/team.model';
import { ActivatedRoute } from '@angular/router';
import { TeamsService } from '../../services/teams.service';
import { PlayerService } from '../../services/player.service';
import { MatDialog } from '@angular/material/dialog';
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
import { emptyPlayer } from '../../../util/empty-model-util';
import { CommonResponse } from '../../../common/model/common-response.dto';

@Component({
  selector: 'app-player',
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
  templateUrl: './player.component.html',
  styleUrl: './player.component.scss',
})
export class PlayerComponent {
  // Flags
  public tableLoaded: boolean = false;
  public isProcessing: boolean = false;
  public isNew: boolean = true;

  // Table Data
  public columnsHeader: string[] = [
    'id',
    'number',
    'name',
    'lastName',
    'action',
  ];
  public dataSource: MatTableDataSource<any> | undefined;
  public errorMessage: string = '';

  // Form Data
  public formGroup: FormGroup;

  public player: Player = emptyPlayer();
  private team!: Team;

  public teamName: string = '';
  public playerId: number | undefined;
  private teamId: number = 0;

  constructor(
    private route: ActivatedRoute,
    private formBuilder: FormBuilder,
    private teamService: TeamsService,
    private playerService: PlayerService,
    private dialog: MatDialog
  ) {
    // Get data from URL
    this.route.queryParamMap.subscribe((params) => {
      this.teamId = Number(params.get('id')!);
      this.getTeam();
    });
    // Create the form group from DTO
    this.formGroup = this.formBuilder.group({
      name: [this.player.name, Validators.required],
      lastName: [this.player.lastName, Validators.required],
      number: [this.player.number, Validators.required],
    });
    // Subscribe changes of Form Group to the DTO
    this.formGroup
      .get('name')!
      .valueChanges.subscribe((selectedValue: string) => {
        this.player.name = selectedValue;
      });
    this.formGroup
      .get('lastName')!
      .valueChanges.subscribe((selectedValue: string) => {
        this.player.lastName = selectedValue;
      });
    this.formGroup
      .get('number')!
      .valueChanges.subscribe((selectedValue: number) => {
        this.player.number = selectedValue;
      });

    this.getPlayers();
  }

  public reset(): void {
    this.player = emptyPlayer();
    this.player.teamId = this.teamId;

    this.playerId = this.player.playerId;
    this.isNew = true;

    resetFormGroup(this.formGroup);
    this.getPlayers();
  }

  public submit(): void {
    this.formGroup.markAllAsTouched();
    if (this.formGroup.status === 'VALID') {
      this.isProcessing = startProcessing(this.formGroup, this.dialog);
      this.player.teamId = this.teamId;
      this.isNew ? this.createPlayer() : this.updatePlayer();
    }
  }

  public edit(player: Player): void {
    this.isNew = false;
    this.player.playerId = player.playerId;
    this.player.name = player.name;
    this.player.lastName = player.lastName;
    this.player.number = player.number;
    this.playerId = player.playerId;
    this.formGroup.get('name')?.setValue(player.name);
    this.formGroup.get('lastName')?.setValue(player.lastName);
    this.formGroup.get('number')?.setValue(player.number);
  }

  public delete(player: Player): void {
    if (player) {
      const dialogRef = openConfirmDialog(this.dialog, 'Borrar', 'Jugador');
      dialogRef.afterClosed().subscribe((result) => {
        if (result) {
          this.isProcessing = startProcessing(this.formGroup, this.dialog);
          this.deletePlayer(player);
        }
      });
    }
  }

  // ======================================================
  // PRIVATE FUNCTIONS
  // ======================================================
  private createPlayer(): void {
    this.playerService.postPlayer(this.player).subscribe({
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

  private getTeam(): void {
    this.teamService.getTeam(this.teamId).subscribe({
      next: (team: Team) => {
        this.team = team;
        this.teamName = team.name;
        this.player.teamId = this.team.teamId!;
      },
      error: (e: any) => {
        // TODO
      },
    });
  }

  private getPlayers(): void {
    this.playerService.getPlayersByTeam(this.teamId).subscribe({
      next: (players: Player[]) => {
        if (players && players.length > 0) {
          this.dataSource = new MatTableDataSource(players);
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

  private updatePlayer() {
    this.playerService.putPlayer(this.player).subscribe({
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

  private deletePlayer(player: Player): void {
    this.playerService.deletePlayer(player.playerId!).subscribe({
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
