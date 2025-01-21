import { CommonModule } from '@angular/common';
import { Component, EventEmitter, Input, OnChanges, OnInit, Output, SimpleChange } from '@angular/core';
import { PasswordValidator } from '../password-form/password-validator.model';
import { passwordValidatorFunction } from './password-validator.function';

@Component({
    selector: 'app-password-strength',
    standalone: true,
    imports: [
        CommonModule
    ],
    templateUrl: './password-strength.component.html',
    styleUrl: './password-strength.component.css'
})
export class PasswordStrengthComponent implements OnChanges {

    bar0: string | undefined;
    bar1: string | undefined;
    bar2: string | undefined;
    bar3: string | undefined;
    bar4: string | undefined;

    private colors = ['gray', 'darkred', 'orangered', 'orange', 'yellowgreen', 'green'];
    private messages = ['Empty', 'Poor', 'Not Good', 'Average', 'Good', 'Great'];

    public passwordValidator: PasswordValidator = {
        strength: 0,
        hasLowerCase: false,
        hasUpperCase: false,
        hasNumber: false,
        hasSpecialChars: false,
        hasMinLength: false
    }

    message: string | undefined;
    messageColor: string | undefined;

    @Input() public passwordToCheck: string | null | undefined;

    @Output() passwordValidatorOutput = new EventEmitter<PasswordValidator>();

    constructor() { }

    checkStrength(password: string) {
        this.passwordValidator = passwordValidatorFunction(password)
        this.passwordValidatorOutput.emit(this.passwordValidator);
    }

    ngOnChanges(changes: { [propName: string]: SimpleChange }): void {
        const password = changes['passwordToCheck'].currentValue;

        this.setBarColors(5, '#DDD');
        this.checkStrength(password);
        this.displayStrength(this.passwordValidator.strength);
        /*
        if (password) {
            this.checkStrength(password);
            this.displayStrength(this.passwordValidator.strength);
        } else {
            this.message = '';
        }
        */
    }

    private displayStrength(strength: number) {
        const index = strength--;
        this.message = this.messages[index];
        this.messageColor = this.colors[index];
        this.setBarColors(index, this.messageColor);
    }

    private setBarColors(count: number, color: string) {
        for (let n = 0; n < count; n++) {
            (this as any)['bar' + n] = color;
        }
    }
}