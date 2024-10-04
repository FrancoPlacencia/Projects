// @angular
import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';

// Forms
import {
  FormBuilder,
  FormGroup,
  FormsModule,
  ReactiveFormsModule,
  Validators
} from '@angular/forms';

// @angular/material
import { MatDialog } from '@angular/material/dialog';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatInputModule } from '@angular/material/input';
import { MatDividerModule } from '@angular/material/divider';
import { MatIconModule } from '@angular/material/icon';
import { MatButtonModule } from '@angular/material/button';
import { MatCardModule } from '@angular/material/card';

// Services
import { AuthService } from '../../services/auth.service';

import { User } from '../../model/user.model';
import { generateForgotPasswordDTO } from '../../AuthUtil';

import { PasswordValidator } from '../../model/password-validator.model';
import { LogoComponent } from '../../../common/logo/logo.component';
import { DialogMessage } from '../../../common/model/dialog-message.model';
import { DialogMessageTypes } from '../../../common/model/dialog-message-types';
import { endProcessing, resetFormGroup, startProcessing } from '../../../common/Utils/FormUtil';
import { openDialog } from '../../../common/Utils/MessageUtil';

@Component({
  selector: 'app-forgot-password',
  standalone: true,
  imports: [
    CommonModule,

    FormsModule,
    ReactiveFormsModule,

    MatCardModule,
    MatFormFieldModule,
    MatInputModule,
    MatDividerModule,
    MatIconModule,
    MatButtonModule,

    LogoComponent
  ],
  templateUrl: './forgot-password.component.html',
  styleUrl: './forgot-password.component.scss'
})
export class ForgotPasswordComponent implements OnInit {
  public isProcessing: boolean = false;
  public email!: string;
  public formGroup: FormGroup;

  public user: User;

  constructor(public authService: AuthService, private formBuilder: FormBuilder, public dialog: MatDialog) {
    this.user = {
      email: 'john.doe@mail.com',
      password: '',
      rePassword: '',
      token: '',
      passwordValidator: new PasswordValidator()
    }

    this.formGroup = this.formBuilder.group({
      email: [
        this.user.email, [
          Validators.required,
          Validators.email
        ]
      ]
    })
  }

  ngOnInit(): void {
    this.formGroup.get("email")!.valueChanges.subscribe(selectedValue => {
      this.user.email = selectedValue;
    });
  }

  public submit(): void {
    this.formGroup.markAllAsTouched();
    if (this.formGroup.status === "VALID") {
      this.isProcessing = startProcessing(this.formGroup, this.dialog);
      this.forgot();
    }
  }

  private forgot(): void {
    this.authService.forgot(generateForgotPasswordDTO(this.user)).subscribe({
      next: (v) => {
        this.isProcessing = endProcessing(this.formGroup, this.dialog);
        resetFormGroup(this.formGroup);
        let dialogMessage = new DialogMessage(v.responseType, v.responseTitle, v.responseMessage);
        openDialog(this.dialog, dialogMessage);
      },
      error: (e) => {
        this.isProcessing = endProcessing(this.formGroup, this.dialog);
        let dialogMessage;
        switch (e.status) {
          case 0:
            dialogMessage = new DialogMessage(DialogMessageTypes.ERROR, DialogMessageTypes.SERVER_ERROR, DialogMessageTypes.SERVER_ERROR_MESSAGE);
            openDialog(this.dialog, dialogMessage);
            break;
          default:
            dialogMessage = new DialogMessage(e.error.type, e.error.title, e.error.message);
            openDialog(this.dialog, dialogMessage);
            break;
        }
      },
      complete: () => {
        console.info('complete');
      }
    });
  }
}
