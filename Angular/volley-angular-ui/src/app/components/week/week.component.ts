import { Component, EventEmitter, Input, Output, signal } from '@angular/core';
import { CommonModule } from '@angular/common';

import { Game } from '../../model/game.model';
import { MatExpansionModule } from '@angular/material/expansion';

import { GameComponent } from '../game/game.component';

@Component({
  selector: 'app-week',
  imports: [CommonModule, MatExpansionModule, GameComponent],
  templateUrl: './week.component.html',
  styleUrl: './week.component.scss',
})
export class WeekComponent {
  @Input() days: Map<string, Game[]> = new Map<string, Game[]>();
  @Input() isAdmin: boolean = false;
  @Output('parentEdit') parentEdit: EventEmitter<any> = new EventEmitter();

  @Output('parentDelete') parentDelete: EventEmitter<any> = new EventEmitter();

  public edit(game: Game): void {
    console.log('Week edit');
    this.parentEdit.emit(game);
  }
  public delete(game: Game): void {
    console.log('Week delete');
    this.parentDelete.emit(game);
  }

  step = signal(0);

  setStep(index: number) {
    this.step.set(index);
  }

  nextStep() {
    this.step.update((i) => i + 1);
  }

  prevStep() {
    this.step.update((i) => i - 1);
  }
}
