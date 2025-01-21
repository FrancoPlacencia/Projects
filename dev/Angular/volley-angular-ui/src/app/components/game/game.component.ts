import { Component, EventEmitter, Input, output, Output } from '@angular/core';

import { CommonModule } from '@angular/common';

import { MatIconModule } from '@angular/material/icon';
import { MatButtonModule } from '@angular/material/button';

import { Game } from '../../model/game.model';

@Component({
  selector: 'app-game',
  imports: [CommonModule, MatIconModule, MatButtonModule],
  templateUrl: './game.component.html',
  styleUrl: './game.component.scss',
})
export class GameComponent {
  @Input() game!: Game;

  @Input() isAdmin: boolean = false;

  @Input() teamFilter: number = 0;

  @Output() isProcessing: boolean = false;

  @Output('parentEdit') parentEdit: EventEmitter<any> = new EventEmitter();

  @Output('parentDelete') parentDelete: EventEmitter<any> = new EventEmitter();

  public edit(game: Game): void {
    console.log('Game edit');
    this.parentEdit.emit(game);
  }
  public delete(game: Game): void {
    console.log('Game delete');
    this.parentDelete.emit(game);
  }
}
