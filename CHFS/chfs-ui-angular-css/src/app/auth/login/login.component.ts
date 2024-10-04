import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, FormsModule, ReactiveFormsModule, Validators } from '@angular/forms';
import { UserService } from '../../users/user-service/user.service';
import { LoginUser } from './login-user.model';
import { CommonModule } from '@angular/common';
import Swal from 'sweetalert2';
import { Router } from '@angular/router';
import { AuthService } from '../../helpers/auth.service';
import { FontAwesomeModule } from '@fortawesome/angular-fontawesome';
import { MatDialog } from '@angular/material/dialog';
import { AlertMessageComponent } from '../../messages/alert-message/alert-message.component';

@Component({
  selector: 'app-login',
  standalone: true,
  imports: [
    FormsModule,
    ReactiveFormsModule,
    CommonModule,
    FontAwesomeModule
  ],
  templateUrl: './login.component.html',
  styleUrl: './login.component.css'
})
export class LoginComponent implements OnInit {

  public isProcessing: boolean = false;

  public viewPassword: boolean = false;

  constructor(
    public userService: UserService,
    private authService: AuthService,
    private router: Router,
    public dialog: MatDialog
  ) { }

  openDialog() {
    this.dialog.open(AlertMessageComponent, this.buildAlertMessage('ERROR', 'ERROR', 'An alert ERROR', 'OK'));
  }

  ngOnInit(): void {
    this.authService.clearAuthorizationToken();
  }

  public loginForm = new FormGroup({
    email: new FormControl('', Validators.email),
    password: new FormControl('')
  });

  private loginUser: LoginUser = {
    email: '',
    password: ''
  };

  public httpResponse = "";



  login() {
    //this.openDialog();

    this.isProcessing = true;
    this.loginForm.disable();
    this.loginUser.email = this.loginForm.value['email']!;
    this.loginUser.password = this.loginForm.value['password']!;
    this.loginCall();

  }

  private loginCall() {
    this.userService.login(this.loginUser).subscribe({
      next: (v) => {
        this.authService.setAuthorizationToken(v.token);
        this.router.navigateByUrl('/home')
      },
      error: (e) => {
        let errorMsg = "";
        let errorTitle = "";
        switch (e.status) {
          case 0:
            errorTitle = "SERVER ERROR";
            errorMsg = "Opps something went wrong. Please try again later.";
            break;
          case 400:
            errorTitle = "BAD ERROR";
            errorMsg = e.error.message;
            break;
          case 401:
            errorTitle = "AUTH ERROR";
            errorMsg = "Email or Password incorrect.";
            break;
          default:
            errorTitle = "UNKW ERROR";
            errorMsg = "Opps something went wrong. Please try again later.";
            break;
        }
        Swal.fire({
          title: errorTitle,
          text: errorMsg,
          confirmButtonColor: "#0d6efd",
          icon: 'error',
          confirmButtonText: 'Cool'
        });
        this.loginForm.enable();
        this.isProcessing = false;
      }
    });
  }

  togglePassword() {
    this.viewPassword = !this.viewPassword;
  }

  private buildAlertMessage(icon: string, title: string, alertMessage: string, buttonMessage: string) {
    return {
      data: {
        icon: icon,
        title: title,
        alertMessage: alertMessage,
        buttonMessage: buttonMessage
      }
    };
  }

}
