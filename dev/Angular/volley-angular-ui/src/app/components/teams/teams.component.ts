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
import { TeamComponent } from '../team/team.component';

@Component({
  selector: 'app-teams',
  imports: [
    CommonModule,
    FormsModule,
    ReactiveFormsModule,
    MatCardModule,
    MatFormFieldModule,
    MatSelectModule,
    MatIconModule,
    MatButtonModule,

    TeamComponent,
  ],
  templateUrl: './teams.component.html',
  styleUrl: './teams.component.scss',
})
export class TeamsComponent {
  @Input() public teamsMap: Map<string, Team[]> = new Map<string, Team[]>();
  @Input() public teamOptionsMap: Map<string, TeamOption[]> = new Map<
    string,
    TeamOption[]
  >();

  public teams: Team[] = [];
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
        this.teamOptions = this.teamOptionsMap.get(selectedValue)! ?? [];
        this.category = selectedValue;
        this.formGroup.get('team')!.enable();
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
    this.teams = this.teamsMap.get(this.category) ?? [];
    console.log(this.teams);
  }

  private filterTeams() {
    let _teams: Team[] = this.teams;
    this.teams = [];
    _teams.forEach((team: Team) => {
      if (team.teamId == this.teamId) {
        let _team = team;
        _team.players.sort((a, b) => b.gamesPercentage - a.gamesPercentage);
        this.teams.push(team);
      }
    });
  }
}
