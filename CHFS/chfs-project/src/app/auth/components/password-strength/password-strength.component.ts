import { Component, EventEmitter, Input, OnChanges, Output, SimpleChange } from '@angular/core';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-password-strength',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './password-strength.component.html',
  styleUrl: './password-strength.component.scss'
})
export class PasswordStrengthComponent implements OnChanges {

  public bar0: string | undefined;
  public bar1: string | undefined;
  public bar2: string | undefined;
  public bar3: string | undefined;
  public bar4: string | undefined;


  public message: string | undefined;
  public messageColor: string | undefined;

  private colors = ['gray', 'darkred', 'orangered', 'orange', 'yellowgreen', 'green'];
  private messages = ['None', 'Poor', 'Not Good', 'Average', 'Good', 'Great'];

  @Input() public strength!: number;

  constructor() { }

  ngOnChanges(changes: { [propName: string]: SimpleChange }): void {
    this.strength = changes['strength'].currentValue;
    // clears the bars to default
    this.setBarColors(5, '#d5d5d5');
    this.displayStrength(this.strength);
  }

  private setBarColors(count: number, color: string) {
    for (let n = 0; n < count; n++) {
      (this as any)['bar' + n] = color;
    }
  }

  private displayStrength(strength: number) {
    const index = strength--;
    this.message = this.messages[index];
    this.messageColor = this.colors[index];
    this.setBarColors(index, this.messageColor);
  }
}
