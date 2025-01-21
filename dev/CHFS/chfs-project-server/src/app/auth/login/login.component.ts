import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, FormsModule, ReactiveFormsModule, Validators } from '@angular/forms';
import { LoginUser } from '../model/login-user.model';
import { CommonModule } from '@angular/common';
import { FontAwesomeModule } from '@fortawesome/angular-fontawesome';
import { Router } from '@angular/router';
import { MatDialog } from '@angular/material/dialog';
import { AlertMessageComponent } from '../../messages/alert-message/alert-message.component';
import { AuthService } from '../service/auth.service';
import { JwtService } from '../service/jwt.service';
import { MatGridListModule } from '@angular/material/grid-list';

@Component({
    selector: 'app-login',
    standalone: true,
    imports: [
        FormsModule,
        ReactiveFormsModule,
        CommonModule,
        FontAwesomeModule,
        MatGridListModule
    ],
    templateUrl: './login.component.html',
    styleUrl: './login.component.scss'
})
export class LoginComponent implements OnInit {

    // Variables
    public isProcessing: boolean = false;

    public viewPassword: boolean = false;

    public httpResponse: string = ""

    public loginForm = new FormGroup({
        email: new FormControl('', Validators.email),
        password: new FormControl('')
    });

    private loginUser: LoginUser = new LoginUser('', '');

    // Constructor
    constructor(
        private authService: AuthService,
        private jwtService: JwtService,
        private router: Router,
        public dialog: MatDialog
    ) { }

    ngOnInit(): void {
        this.jwtService.clearAuthorizationToken();
    }

    // Functions
    public login(): void {
        this.openDialog();
        /*
        this.isProcessing = true;
        this.loginForm.disable();
        this.loginUser.email = this.loginForm.value['email']!;
        this.loginUser.password = this.loginForm.value['password']!;
        this.loginCall();
        */
    }

    public togglePassword() {
        this.viewPassword = !this.viewPassword;
    }

    private loginCall(): void {
        this.authService.login(this.loginUser).subscribe({
            next: (v) => {
                this.jwtService.setAuthorizationToken(v.token);
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

                /*
                Swal.fire({
                    title: errorTitle,
                    text: errorMsg,
                    confirmButtonColor: "#0d6efd",
                    icon: 'error',
                    confirmButtonText: 'Cool'
                });
                */
                this.loginForm.enable();
                this.isProcessing = false;
            }
        });
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

    openDialog() {
        this.dialog.open(AlertMessageComponent, this.buildAlertMessage('ERROR', 'ERROR', 'An alert ERROR', 'OK'));
    }
}
