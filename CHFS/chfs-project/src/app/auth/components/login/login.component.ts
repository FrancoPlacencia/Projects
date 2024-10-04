// @angular
import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Router } from '@angular/router';

// Forms
import {
  FormControl,
  FormGroup,
  FormsModule,
  ReactiveFormsModule,
  Validators
} from '@angular/forms';

// @angular/material
import { MatCardModule } from '@angular/material/card';
import { MatDialog, MatDialogModule } from '@angular/material/dialog';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatInputModule } from '@angular/material/input';
import { MatDividerModule } from '@angular/material/divider';
import { MatIconModule } from '@angular/material/icon';
import { MatButtonModule } from '@angular/material/button';

// Services
import { AuthService } from '../../services/auth.service';
import { JwtService } from '../../services/token.service';

import { User } from '../../model/user.model';
import { generateLoginDTO } from '../../AuthUtil';
import { LogoComponent } from '../../../common/logo/logo.component';
import { DialogMessageTypes } from '../../../common/model/dialog-message-types';
import { DialogMessage } from '../../../common/model/dialog-message.model';
import { endProcessing, startProcessing } from '../../../common/Utils/FormUtil';
import { openDialog } from '../../../common/Utils/MessageUtil';
import { AuthResponse } from '../../model/dto/auth-response.dto';

@Component({
  selector: 'app-login',
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
  templateUrl: './login.component.html',
  styleUrl: './login.component.scss'
})
export class LoginComponent implements OnInit {

  public logoType: string = 'auth';

  public viewPassword: boolean = false;

  public isProcessing: boolean = false;

  public visibility: string;

  public formGroup: FormGroup;

  private user: User;

  constructor(
    private authService: AuthService,
    private tokenService: JwtService,
    private router: Router,
    private dialog: MatDialog
  ) {
    this.user = {
      email: 'john.doe@mail.com',
      password: 'P4$sw0rd'
    }

    this.formGroup = new FormGroup({
      email: new FormControl(
        this.user.email,
        [
          Validators.required,
          Validators.email
        ]),
      password: new FormControl(
        this.user.password,
        [
          Validators.required
        ]
      )
    });

    this.visibility = 'visibility_off';
  }

  ngOnInit(): void {
    this.tokenService.clearJWTToken();

    this.formGroup.get("email")!.valueChanges.subscribe(selectedValue => {
      this.user.email = selectedValue;
    });

    this.formGroup.get("password")!.valueChanges.subscribe(selectedValue => {
      this.user.password = selectedValue;
    });
  }

  public submit(): void {
    this.formGroup.markAllAsTouched();
    if (this.formGroup.status === "VALID") {
      this.isProcessing = startProcessing(this.formGroup, this.dialog);
      this.login();
    }
  }



  private login(): void {
    this.authService.login(generateLoginDTO(this.user)).subscribe({
      next: (authResponse: AuthResponse) => {
        this.isProcessing = endProcessing(this.formGroup, this.dialog);
        this.tokenService.setJWTToken(authResponse.token);
        this.router.navigateByUrl('/app');
      },
      error: (e) => {
        debugger;
        this.isProcessing = endProcessing(this.formGroup, this.dialog);
        let dialogMessage;
        switch (e.status) {
          case 0:
            dialogMessage = new DialogMessage(DialogMessageTypes.ERROR, DialogMessageTypes.SERVER_ERROR, DialogMessageTypes.SERVER_ERROR_MESSAGE);
            openDialog(this.dialog, dialogMessage);
            break;
          default:
            dialogMessage = new DialogMessage(e.error.type, e.error.title, e.error.message)
            openDialog(this.dialog, dialogMessage);
            break;
        }
      }
    });
  }

  public togglePassword(): void {
    this.viewPassword = !this.viewPassword;
    if (this.viewPassword) {
      this.visibility = 'visibility';
    } else {
      this.visibility = 'visibility_off';
    }
  }
}
