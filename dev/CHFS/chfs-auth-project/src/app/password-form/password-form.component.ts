import { CommonModule } from '@angular/common';
import { Component, Input, OnInit, booleanAttribute, numberAttribute } from '@angular/core';
import { FormGroup, FormGroupDirective, ReactiveFormsModule } from '@angular/forms';
import { PasswordStrengthComponent } from '../password-strength/password-strength.component';
import { PasswordValidator } from './password-validator.model';

@Component({
    selector: 'app-password-form',
    standalone: true,
    imports: [
        ReactiveFormsModule,
        CommonModule,
        PasswordStrengthComponent
    ],
    templateUrl: './password-form.component.html',
    styleUrl: './password-form.component.css'
})
export class PasswordFormComponent implements OnInit {

    public passwordFormGroup!: FormGroup;

    public strongPassword = false;

    public viewPassword: boolean = false;

    public viewRePassword: boolean = false;

    public passwordValidator!: PasswordValidator;

    @Input() public formGroupName!: string;
    @Input({ transform: booleanAttribute }) public isFormSubmitted!: boolean;

    constructor(private rootFormGroup: FormGroupDirective) {
    }

    ngOnInit(): void {
        this.passwordFormGroup = this.rootFormGroup.control.get(this.formGroupName) as FormGroup;
    }

    onPasswordStrengthChanged(event: PasswordValidator) {
        this.passwordValidator = event;
    }

    passwordStrengthUpdate(event: PasswordValidator) {
        this.passwordValidator = event;
    }

    togglePassword() {
        this.viewPassword = !this.viewPassword;
    }

    toggleRePassword() {
        this.viewRePassword = !this.viewRePassword;

    }
}
