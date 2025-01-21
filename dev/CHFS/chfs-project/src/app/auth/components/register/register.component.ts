// @angular
import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';

// @angular/forms
import {
  AbstractControl,
  FormBuilder,
  FormControl,
  FormGroup,
  FormsModule,
  ReactiveFormsModule,
  ValidationErrors,
  ValidatorFn,
  Validators
} from '@angular/forms';

// @angular/material
import { MatGridListModule } from '@angular/material/grid-list';
import { MatCardModule } from '@angular/material/card';
import { MatDialog } from '@angular/material/dialog';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatInputModule } from '@angular/material/input';
import { MatDividerModule } from '@angular/material/divider';
import { MatIconModule } from '@angular/material/icon';
import { MatButtonModule } from '@angular/material/button';
import { MatProgressSpinnerModule } from '@angular/material/progress-spinner';
import { MatSelectModule } from '@angular/material/select';

// services
import { AuthService } from '../../services/auth.service';

// components
import { PasswordComponent } from '../password/password.component';
import { PrettyJsonPipe } from '../../../pipes/pretty-json.pipe';

// models

import { PasswordValidator } from '../../model/password-validator.model';
import { confirmPasswordValidator, generateRegisterDTO, passwordStrongValidator, phoneValidator, validatePassword } from '../../AuthUtil';
import { LogoComponent } from '../../../common/logo/logo.component';
import { User } from '../../model/user.model';
import { DialogMessage } from '../../../common/model/dialog-message.model';
import { DialogMessageTypes } from '../../../common/model/dialog-message-types';
import { openDialog } from '../../../common/Utils/MessageUtil';
import { endProcessing, resetFormGroup, startProcessing } from '../../../common/Utils/FormUtil';
import { SelectOption } from '../../../common/model/select-option.form';

@Component({
  selector: 'app-register',
  standalone: true,
  imports: [
    CommonModule,

    FormsModule,
    ReactiveFormsModule,

    MatGridListModule,
    MatCardModule,
    MatFormFieldModule,
    MatInputModule,
    MatDividerModule,
    MatIconModule,
    MatButtonModule,
    MatSelectModule,

    PasswordComponent,
    LogoComponent,
    PrettyJsonPipe
  ],
  templateUrl: './register.component.html',
  styleUrl: './register.component.scss'
})
export class RegisterComponent implements OnInit {
  public strongPassword = false;
  public isProcessing = false;
  public isEmailAlreadyUse = false;

  public previousEmail: string = '';

  public formValidator = '';

  public bioLength: number = 0;

  public formGroup: FormGroup;

  public user!: User;

  public titles: SelectOption[] = [
    { value: 'pastor', displayValue: 'Pastor' },
    { value: 'treasurer', displayValue: 'Treasurer' },
    { value: 'secretary', displayValue: 'Secretary' }
  ];

  constructor(public authService: AuthService, private formBuilder: FormBuilder, public dialog: MatDialog,) {
    this.user = {
      email: 'john.doe@mail.com',
      password: 'P4$sw0rd',
      rePassword: 'P4$sw0rd',
      passwordValidator: new PasswordValidator(),

      firstName: 'John',
      lastName: 'Doe',
      responseTitle: 'treasurer',
      bio: 'Something',

      phone: '1231234567',
      address: 'Street Name #123 Location Country, State',
    };
    validatePassword(this.user);

    this.formGroup = this.formBuilder.group({
      firstName: [this.user.firstName, Validators.required],
      lastName: [this.user.lastName, Validators.required],
      email: [
        this.user.email, [
          Validators.required,
          Validators.email,
          this.uniqueEmailValidator()
        ]
      ],
      phone: [this.user.phone, [Validators.required, phoneValidator()]],
      address: [this.user.address, Validators.required],
      title: [this.user.responseTitle, Validators.required],
      bio: [this.user.bio, Validators.required],
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

    this.updateBio();
  }


  ngOnInit(): void {
    this.formGroup.get("firstName")!.valueChanges.subscribe(selectedValue => {
      this.user.firstName = selectedValue;
    });
    this.formGroup.get("lastName")!.valueChanges.subscribe(selectedValue => {
      this.user.lastName = selectedValue;
    });
    this.formGroup.get("email")!.valueChanges.subscribe(selectedValue => {
      this.user.email = selectedValue;
    });
    this.formGroup.get("title")!.valueChanges.subscribe(selectedValue => {
      this.user.responseTitle = selectedValue;
    });
    this.formGroup.get("bio")!.valueChanges.subscribe(selectedValue => {
      this.user.bio = selectedValue;
    });

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
      this.register();
    }
  }

  private register(): void {
    this.authService.register(generateRegisterDTO(this.user)).subscribe({
      next: (v) => {
        this.isProcessing = endProcessing(this.formGroup, this.dialog);
        resetFormGroup(this.formGroup);

        let dialogMessage = new DialogMessage(v.responseType, v.responseTitle, v.responseMessage);
        openDialog(this.dialog, dialogMessage);

        this.isEmailAlreadyUse = false;
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
            debugger;
            dialogMessage = new DialogMessage(e.error.type, e.error.title, e.error.message);
            if (e.error.title == "Email already exists.") {
              this.formGroup.controls['email'].setErrors({ 'used': true });
              this.formGroup.controls['email'].markAsDirty();
              this.isEmailAlreadyUse = true;
              this.previousEmail = this.user.email;
            }
            openDialog(this.dialog, dialogMessage);
            break;
        }
      },
      complete: () => {
        console.info('complete');
      }
    });
  }

  titleValidator(): ValidatorFn {
    return (control: AbstractControl): ValidationErrors | null => {
      let title = control.value;
      if (!title) {
        return null;
      }
      return title === '' ? {
        titleRequired: true
      } : null;

    };
  }

  uniqueEmailValidator(): ValidatorFn {
    return (control: AbstractControl): ValidationErrors | null => {
      console.log(control.value + '>' + this.previousEmail)
      if (this.isEmailAlreadyUse) {
        if (control.value === this.previousEmail) {
          return { emailUsed: true };
        }
      }
      return null;
    };
  }

  updateBio() {
    this.bioLength = this.formGroup.value['bio'].length;

  }
}
