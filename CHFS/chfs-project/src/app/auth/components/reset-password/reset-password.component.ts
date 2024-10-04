// @angular
import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ActivatedRoute, Router } from '@angular/router';
import {
  AbstractControl,
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
import { PasswordValidator } from '../../model/password-validator.model';

import { PasswordComponent } from '../password/password.component';

import { User } from '../../model/user.model';
import { passwordStrongValidator, confirmPasswordValidator, generateResetPasswordDTO, validatePassword } from '../../AuthUtil';
import { JwtService } from '../../services/token.service';

import { AuthService } from '../../services/auth.service';
import { LogoComponent } from '../../../common/logo/logo.component';
import { DialogMessage } from '../../../common/model/dialog-message.model';
import { DialogMessageTypes } from '../../../common/model/dialog-message-types';
import { openDialog } from '../../../common/Utils/MessageUtil';
import { endProcessing, startProcessing } from '../../../common/Utils/FormUtil';

@Component({
  selector: 'app-reset-password',
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

    PasswordComponent,
    LogoComponent
  ],
  templateUrl: './reset-password.component.html',
  styleUrl: './reset-password.component.scss'
})
export class ResetPasswordComponent implements OnInit {

  public isProcessing: boolean = false;

  public formGroup: FormGroup;

  public user: User;

  public emailParam!: string;

  public tokenParam!: string;

  constructor(private authService: AuthService, private activatedRoute: ActivatedRoute, private formBuilder: FormBuilder, private tokenService: JwtService, private dialog: MatDialog, private router: Router) {

    this.activatedRoute.queryParams.subscribe(params => {
      this.emailParam = params['email'];
      this.tokenParam = params['token'];
    });

    this.user = {
      email: this.emailParam,
      password: 'P4$sw0rd',
      rePassword: 'P4$sw0rd',
      token: this.tokenParam,
      passwordValidator: new PasswordValidator(),
    }
    validatePassword(this.user);

    this.formGroup = this.formBuilder.group({
      email: [
        { value: this.user.email, disabled: true }, [
          Validators.required,
          Validators.email
        ]
      ],
      passwordForm: this.formBuilder.group({
        password: [
          this.user.password,
          [
            Validators.required,
            passwordStrongValidator()
          ]
        ],
        rePassword: [
          this.user.rePassword,
          [
            Validators.required,
            confirmPasswordValidator()
          ]
        ]
      })
    });

  }

  ngOnInit(): void {
    this.formGroup.get("passwordForm.password")!.valueChanges.subscribe(selectedValue => {
      this.user.password = selectedValue;
      validatePassword(this.user);
    });
    this.formGroup.get("passwordForm.rePassword")!.valueChanges.subscribe(selectedValue => {
      this.user.rePassword = selectedValue;
    });
  }

  public submit(): void {
    this.formGroup.markAllAsTouched();
    if (this.formGroup.status === "VALID") {
      this.isProcessing = startProcessing(this.formGroup, this.dialog);
      this.reset();
    }
  }

  private reset(): void {

    this.authService.reset(generateResetPasswordDTO(this.user)).subscribe({
      next: (v) => {
        this.isProcessing = endProcessing(this.formGroup, this.dialog);
        this.router.navigateByUrl('/')
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
