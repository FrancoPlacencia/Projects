export interface PasswordValidator {
    strength: number,
    hasLowerCase: boolean,
    hasUpperCase: boolean,
    hasNumber: boolean,
    hasSpecialChars: boolean,
    hasMinLength: boolean
}