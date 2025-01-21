// @angular
import { Component, Input, OnChanges, OnInit, SimpleChanges, booleanAttribute } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormGroup, FormGroupDirective, ReactiveFormsModule } from '@angular/forms';

// @angular/material
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatInputModule } from '@angular/material/input';
import { MatDividerModule } from '@angular/material/divider';
import { MatIconModule } from '@angular/material/icon';
import { MatButtonModule } from '@angular/material/button';

import { PasswordStrengthComponent } from '../password-strength/password-strength.component';
import { PasswordValidator } from '../../model/password-validator.model';

@Component({
  selector: 'app-password',
  standalone: true,
  imports: [
    ReactiveFormsModule,
    CommonModule,
    PasswordStrengthComponent,

    MatFormFieldModule,
    MatInputModule,
    MatDividerModule,
    MatIconModule,
    MatButtonModule
  ],
  templateUrl: './password.component.html',
  styleUrl: './password.component.scss'
})
export class PasswordComponent implements OnInit, OnChanges {

  public passwordFormGroup!: FormGroup;

  public strognPassword = false;

  public viewPassword: boolean = false;
  public iconViewPassword: string = 'visibility_off';

  public viewRePassword: boolean = false;
  public iconViewRePassword: string = 'visibility_off';

  @Input() public formGroupName!: string;
  @Input({ transform: booleanAttribute }) public isFormSubmitted!: boolean;

  @Input() public password!: string;
  @Input() public passwordValidator!: PasswordValidator;

  constructor(private rootFormGroup: FormGroupDirective) { }

  ngOnChanges(changes: SimpleChanges): void {
    if (changes['password']) {
      this.password = changes['password'].currentValue;
    }
    this.passwordValidator.passwordValidation(this.password);
  }

  ngOnInit(): void {
    this.passwordFormGroup = this.rootFormGroup.control.get(this.formGroupName) as FormGroup;
  }

  public togglePassword(): void {
    this.viewPassword = !this.viewPassword;

    if (this.viewPassword) {
      this.iconViewPassword = 'visibility';
    } else {
      this.iconViewPassword = 'visibility_off';
    }
  }

  public toggleRePassword(): void {
    this.viewRePassword = !this.viewRePassword;
    if (this.viewRePassword) {
      this.iconViewRePassword = 'visibility';
    } else {
      this.iconViewRePassword = 'visibility_off';
    }
  }

}
