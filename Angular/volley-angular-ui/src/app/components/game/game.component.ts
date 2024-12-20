import { Component, EventEmitter, Input, Output } from '@angular/core';

import { CommonModule } from '@angular/common';

import { MatIconModule } from '@angular/material/icon';

import { Game } from '../../model/game.model';

@Component({
  selector: 'app-game',
  imports: [CommonModule, MatIconModule],
  templateUrl: './game.component.html',
  styleUrl: './game.component.scss',
})
export class GameComponent {
  @Input() game!: Game;
}
