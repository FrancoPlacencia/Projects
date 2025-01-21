import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, FormsModule, ReactiveFormsModule, Validators } from '@angular/forms';
import { UserService } from '../../users/user-service/user.service';
import { LoginUser } from './login-user.model';
import { CommonModule } from '@angular/common';
import Swal from 'sweetalert2';
import { Router } from '@angular/router';
import { AuthService } from '../../helpers/auth.service';
import { FontAwesomeModule } from '@fortawesome/angular-fontawesome';

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

    constructor(
        public userService: UserService,
        private authService: AuthService,
        private router: Router

    ) { }


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
        this.loginUser.email = this.loginForm.value['email']!;
        this.loginUser.password = this.loginForm.value['password']!;
        this.isProcessing = true;
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
                })
            }
        });
    }

}
