import { PasswordValidator } from "../password-form/password-validator.model"

export function passwordValidatorFunction(password: string) {
    let passwordValidator: PasswordValidator = {
        strength: 0,
        hasLowerCase: false,
        hasUpperCase: false,
        hasNumber: false,
        hasSpecialChars: false,
        hasMinLength: false
    }
    const regex = /[$-/:-?{-~!"^_@`\[\]]/g;

    if (!password) {
        // Reset object
        passwordValidator.strength = 0;
        passwordValidator.hasLowerCase = false;
        passwordValidator.hasUpperCase = false;
        passwordValidator.hasNumber = false;
        passwordValidator.hasSpecialChars = false;
        passwordValidator.hasMinLength = false;
    } else {
        // build object
        passwordValidator.hasLowerCase = /[a-z]+/.test(password);
        passwordValidator.hasUpperCase = /[A-Z]+/.test(password);
        passwordValidator.hasNumber = /[0-9]+/.test(password);
        passwordValidator.hasSpecialChars = regex.test(password);
        passwordValidator.hasMinLength = password.length >= 8 ? true : false;
        // const hasMaxLength = password.length <= 20 ? true : false;

        passwordValidator.strength = 0
            + Number(passwordValidator.hasLowerCase)
            + Number(passwordValidator.hasUpperCase)
            + Number(passwordValidator.hasNumber)
            + Number(passwordValidator.hasSpecialChars)
            + Number(passwordValidator.hasMinLength);
    }
    return passwordValidator;

}