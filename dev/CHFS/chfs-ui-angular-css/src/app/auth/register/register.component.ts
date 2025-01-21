import { CommonModule } from '@angular/common';
import { Component, OnInit } from '@angular/core';
import { AbstractControl, FormBuilder, FormControl, FormGroup, FormsModule, ReactiveFormsModule, ValidationErrors, ValidatorFn, Validators } from '@angular/forms';
import { RegisterUser } from './register-user.model';
import { UserService } from '../../users/user-service/user.service';
import { PasswordFormComponent } from '../password-form/password-form.component';
import { passwordValidatorFunction } from '../password-strength/password-validator.function';
import { PasswordValidator } from '../password-form/password-validator.model';
import Swal from 'sweetalert2';
import { PrettyjsonPipe } from '../../prettyjson.pipe';
import { FontAwesomeModule } from '@fortawesome/angular-fontawesome';

@Component({
    selector: 'app-register',
    standalone: true,
    imports: [
        FormsModule,
        ReactiveFormsModule,
        CommonModule,
        PasswordFormComponent,
        PrettyjsonPipe,
        FontAwesomeModule
    ],
    templateUrl: './register.component.html',
    styleUrl: './register.component.css'
})
export class RegisterComponent {

    strongPassword = false;
    isProcessing = false;
    isEmailAlreadyUse = false;

    private passwordRegex: RegExp = /(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@$!%*#?&^_-]).{8,}/;

    private registerUser: RegisterUser = {
        firstName: '',
        lastName: '',
        email: '',
        password: '',
        title: '',
        bio: ''
    };

    public isFormSubmitted: boolean = false;

    public formValidator = '';

    public registerForm: FormGroup;

    public passwordValidator!: PasswordValidator;

    public bioLength: number = 0;

    constructor(public userService: UserService, private formBuilder: FormBuilder) {
        this.registerForm = this.formBuilder.group({
            firstName: ['Francisco', Validators.required],
            lastName: ['Placencia', Validators.required],
            email: [
                'john.doe@mail.com', [
                    Validators.required,
                    Validators.email
                ]
            ],
            title: ['treasurer', Validators.required],
            bio: ['Something', Validators.required],
            passwordForm: this.formBuilder.group({
                password: [
                    '',
                    [
                        Validators.required,
                        this.passwordStrongValidator()
                    ]
                ],
                rePassword: [
                    '',
                    [
                        Validators.required,
                        this.confirmPasswordValidator()
                    ]
                ]

            })
        });
    }

    register() {
        this.isFormSubmitted = true;
        this.formValidator = "was-validated";
        if (this.registerForm.status === "VALID") {
            this.isProcessing = true;
            this.registerForm.disable();
            this.buildUserRegistration();
            this.registrationCall();
        }
    }

    private registrationCall() {
        this.userService.register(this.registerUser).subscribe({
            next: (v) => {
                console.log(v);
            },
            error: (e) => {
                console.error(e);
                let errorMsg = "";
                let errorTitle = "";
                switch (e.status) {
                    case 0:
                        errorTitle = "SERVER ERROR";
                        errorMsg = "Opps something went wrong. Please try again later.";
                        break;
                    case 400:
                        errorTitle = "ERROR";
                        errorMsg = e.error.message;
                        if (errorMsg == "Email already exists.") {
                            this.isEmailAlreadyUse = true;
                        }
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
                this.registerForm.enable();
                this.isProcessing = false;
            },
            complete: () => {
                console.info('complete');
            }
        });
    }

    buildUserRegistration() {
        this.registerUser.firstName = this.registerForm.value['firstName']!;
        this.registerUser.lastName = this.registerForm.value['lastName']!;
        this.registerUser.email = this.registerForm.value['email']!;
        this.registerUser.title = this.registerForm.value['title']!;
        this.registerUser.bio = this.registerForm.value['bio']!;
        this.registerUser.password = this.registerForm.get('passwordForm.password')?.value;
    }

    passwordStrongValidator(): ValidatorFn {
        return (control: AbstractControl): ValidationErrors | null => {
            let password = control.value;
            if (!password) {
                return null;
            } else {
                this.passwordValidator = passwordValidatorFunction(password);
                return this.passwordValidator.strength !== 5 ? {
                    passwordStrength: true
                } : null;
            }
        };
    }
    // P4$sw0rd
    confirmPasswordValidator(): ValidatorFn {
        return (control: AbstractControl): ValidationErrors | null => {
            let rePassword = control.value;
            if (!rePassword) {
                return null;
            }
            let password = this.registerForm.get('passwordForm.password')?.value;
            return password !== rePassword ? { passwordMatch: true } : null;
        };
    }

    updateBio() {
        this.bioLength = this.registerForm.value['bio'].length;
    }

}
