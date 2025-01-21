import { AbstractControl, FormGroup, ValidationErrors, ValidatorFn } from "@angular/forms";
import { PasswordValidator } from "./model/password-validator.model";


import { User } from "./model/user.model";
import { RequestLogin } from "./model/dto/request-login.dto";
import { RequestRegister } from "./model/dto/request-register.dto";
import { RequestForgotPassword } from "./model/dto/request-forgot-password.dto";
import { RequestResetPassword } from "./model/dto/request-reset-password.dto";
import { DialogMessageComponent } from "../common/dialog-message/dialog-message.component";
import { DialogMessage } from "../common/model/dialog-message.model";
import { MatDialog } from "@angular/material/dialog";
import { DialogMessageTypes } from "../common/model/dialog-message-types";

// ==================================================================================
// PASSWORD VALIDATIONS
// ==================================================================================
export function passwordStrongValidator(): ValidatorFn {
  return (control: AbstractControl): ValidationErrors | null => {
    let password = control.value;
    if (!password) {
      return null;
    } else {
      let passwordValidator = new PasswordValidator();
      passwordValidator.passwordValidation(password);
      return passwordValidator.strength !== 5 ?
        { passwordStrength: true } : null;
    }
  };
}

export function confirmPasswordValidator(): ValidatorFn {
  return (control: AbstractControl): ValidationErrors | null => {
    let rePassword = control.value;
    if (!rePassword) {
      return null;
    }
    let password = control.parent?.value.password;
    return password !== rePassword ? { passwordMatch: true } : null;
  };
}

export function phoneValidator(): ValidatorFn {
  return (control: AbstractControl): ValidationErrors | null => {
    let phone = control.value;
    if (!phone) {
      return null;
    }
    return phone.match(/[0-9]/g) ? null : { phone: true };
  };
}

export function validatePassword(user: User) {
  user.passwordValidator!.passwordValidation(user.password!);
}

// ==================================================================================
// GENERATE DTOs
// ==================================================================================
export function generateLoginDTO(user: User): RequestLogin {
  let requestLogin: RequestLogin = {
    email: user.email,
    password: user.password!
  }
  return requestLogin;
}

export function generateRegisterDTO(user: User): RequestRegister {
  let requestRegister: RequestRegister = {
    email: user.email,
    password: user.password!,
    firstName: user.firstName!,
    lastName: user.lastName!,
    title: user.responseTitle!,
    bio: user.bio!
  }
  return requestRegister;
}

export function generateForgotPasswordDTO(user: User): RequestForgotPassword {
  let requestForgotPassword: RequestForgotPassword = {
    email: user.email
  }
  return requestForgotPassword;
}

export function generateResetPasswordDTO(user: User): RequestResetPassword {
  let requestResetPassword: RequestResetPassword = {
    email: user.email,
    password: user.password!,
    token: user.token!
  };
  return requestResetPassword;
}


