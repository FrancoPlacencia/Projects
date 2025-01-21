import { Component, Input } from '@angular/core';

import { CommonModule } from '@angular/common';
import {
  FormBuilder,
  FormGroup,
  FormsModule,
  ReactiveFormsModule,
  Validators,
} from '@angular/forms';
import { MatCardModule } from '@angular/material/card';
import { MatFormFieldModule } from '@angular/material/form-field';

import { MatSelectModule } from '@angular/material/select';
import { MatIconModule } from '@angular/material/icon';
import { MatButtonModule } from '@angular/material/button';

import { TeamOption } from '../../model/team-option.model';

import { TeamStat } from './../../model/team-stat.model';
import { Team } from './../../model/team.model';
import { Game } from '../../model/game.model';

import { GameComponent } from '../game/game.component';

@Component({
  selector: 'app-games',
  imports: [
    CommonModule,
    FormsModule,
    ReactiveFormsModule,
    MatCardModule,
    MatFormFieldModule,
    MatSelectModule,
    MatIconModule,
    MatButtonModule,
    GameComponent,
  ],
  templateUrl: './games.component.html',
  styleUrl: './games.component.scss',
})
export class GamesComponent {
  @Input() public inputGames: Game[] = [];
  public games: Game[] = [];

  @Input() public teamOptionsMap: Map<string, TeamOption[]> = new Map<
    string,
    TeamOption[]
  >();
  public teamOptions: TeamOption[] = [];

  public category: string = '';
  public teamId: number = 0;

  public formGroup: FormGroup;

  constructor(private formBuilder: FormBuilder) {
    this.formGroup = this.formBuilder.group({
      category: [this.category, Validators.required],
      team: [{ value: this.teamId, disabled: true }, Validators.required],
    });

    this.formGroup
      .get('category')!
      .valueChanges.subscribe((selectedValue: string) => {
        this.formGroup.get('team')!.enable();
        this.teamOptions = this.teamOptionsMap.get(selectedValue)! ?? [];
        this.category = selectedValue;
        this.filterCategory();
      });

    this.formGroup
      .get('team')!
      .valueChanges.subscribe((selectedValue: number) => {
        this.teamId = selectedValue;
        this.filterCategory();
        this.filterTeams();
      });
  }

  private filterCategory(): void {
    this.games = [];
    this.inputGames.forEach((game: Game) => {
      if (game.category === this.category) {
        this.games.push(game);
      }
    });
  }

  private filterTeams() {
    let _games: Game[] = this.games;
    this.games = [];
    _games.forEach((game: Game) => {
      game.teamStats.forEach((teamStat: TeamStat) => {
        if (teamStat.teamId == this.teamId) {
          this.games.push(game);
        }
      });
    });
    console.log('games', this.games);
  }
}
