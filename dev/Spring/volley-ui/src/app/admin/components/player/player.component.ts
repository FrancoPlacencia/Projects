import { PlayerService } from './../../services/player.service';
import { Player } from './../../model/player.model';
import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import {
  FormsModule,
  ReactiveFormsModule,
  FormBuilder,
  Validators,
  FormGroup,
} from '@angular/forms';
import { ActivatedRoute } from '@angular/router';

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
import { TeamsService } from '../../services/teams.service';
import { Team } from '../../model/team.model';
import { Tournament } from '../../model/tournament.model';
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
    styleUrl: './player.component.scss'
})
export class PlayerComponent {
  // Flags
  public tableLoaded: boolean = false;
  public isProcessing: boolean = false;
  public isNew: boolean = true;

  // Table Data
  public columnsHeader: string[] = ['number', 'name', 'lastName', 'action'];
  public dataSource: MatTableDataSource<any> | undefined;
  public errorMessage: string = '';

  // Form Data
  public formGroup: FormGroup;

  private player: Player;
  private team!: Team;

  public teamName: string = '';
  private teamUuid: string = '';

  constructor(
    private route: ActivatedRoute,
    private formBuilder: FormBuilder,
    private teamService: TeamsService,
    private playerService: PlayerService,
    private dialog: MatDialog
  ) {
    this.route.queryParamMap.subscribe((params) => {
      this.teamUuid = params.get('uuid')!;
      if (this.teamUuid) {
        this.getTeam(this.teamUuid);
        this.getPlayers();
      }
    });

    this.player = {
      teamUuid: '',
      name: '',
      lastName: '',
      number: 0,
    };

    this.formGroup = this.formBuilder.group({
      name: [this.player.name, Validators.required],
      lastName: [this.player.lastName, Validators.required],
      number: [this.player.number, Validators.required],
    });

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
  }

  public reset(): void {
    throw new Error('Method not implemented.');
  }

  public submit(): void {
    this.player.teamUuid = this.teamUuid;
    this.formGroup.markAllAsTouched();
    if (this.formGroup.status === 'VALID') {
      this.isProcessing = startProcessing(this.formGroup, this.dialog);
      this.isNew ? this.createPlayer() : this.updatePlayer();
    }
  }
  public edit(player: Player): void {
    this.isNew = false;
    this.player.playerUuid = player.playerUuid;
    this.player.name = player.name;
    this.player.lastName = player.lastName;
    this.player.number = player.number;
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
        } else {
          console.log('canceled');
        }
      });
    }
  }

  private updatePlayer() {
    this.playerService.putPlayer(this.player).subscribe({
      next: (player: Player) => {
        this.isProcessing = endProcessing(this.formGroup, this.dialog);
        resetFormGroup(this.formGroup);
        openDialog(
          this.dialog,
          DialogMessageTypes.SUCCESS,
          'Jugador',
          'Actualizado'
        );
        this.getPlayers();
        this.isNew = true;
      },
      error: (e: any) => {
        this.isProcessing = endProcessing(this.formGroup, this.dialog);
        openErrorDialog(this.dialog, e.status, e.error);
      },
    });
  }

  private createPlayer(): void {
    console.log(this.player);
    this.playerService.postPlayer(this.player).subscribe({
      next: (player: Player) => {
        this.isProcessing = endProcessing(this.formGroup, this.dialog);
        this.isNew = true;

        openDialog(
          this.dialog,
          DialogMessageTypes.SUCCESS,
          'Jugador',
          'Creado'
        );
        resetFormGroup(this.formGroup);
        this.getPlayers();
      },
      error: (e: any) => {
        this.isProcessing = endProcessing(this.formGroup, this.dialog);
        openErrorDialog(this.dialog, e.status, e.error);
      },
    });
  }

  private getTeam(uuid: string): void {
    this.teamService.getTeam(uuid).subscribe({
      next: (team: Team) => {
        this.team = team;
        this.teamName = team.name;
        this.player.teamUuid = this.team.teamUuid!;
      },
      error: (e: any) => {
        // TODO
      },
    });
  }

  private getPlayers(): void {
    this.playerService.getPlayersByTeam(this.teamUuid).subscribe({
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

  private deletePlayer(player: Player): void {
    this.playerService.deletePlayer(player.playerUuid!).subscribe({
      next: (player: Player) => {
        this.isProcessing = endProcessing(this.formGroup, this.dialog);
        openDialog(
          this.dialog,
          DialogMessageTypes.SUCCESS,
          'Jugador',
          'Borrado'
        );
        this.getPlayers();
      },
      error: (e: any) => {
        this.isProcessing = endProcessing(this.formGroup, this.dialog);
        openErrorDialog(this.dialog, e.status, e.error);
      },
    });
  }
}
