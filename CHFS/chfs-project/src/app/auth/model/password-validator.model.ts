export class PasswordValidator {
  strength: number;
  hasLowerCase: boolean;
  hasUpperCase: boolean;
  hasNumber: boolean;
  hasSpecialChars: boolean;
  hasMinLength: boolean;

  constructor() {
    this.strength = 0;
    this.hasLowerCase = false;
    this.hasUpperCase = false;
    this.hasNumber = false;
    this.hasSpecialChars = false;
    this.hasMinLength = false;
  }

  public passwordValidation(password: string): void {
    const regex = /[$-/:-?{-~!"^_@`\[\]]/g;

    if (!password) {
      // Reset object
      this.strength = 0;
      this.hasLowerCase = false;
      this.hasUpperCase = false;
      this.hasNumber = false;
      this.hasSpecialChars = false;
      this.hasMinLength = false;
    } else {
      // build object
      this.hasLowerCase = /[a-z]+/.test(password);
      this.hasUpperCase = /[A-Z]+/.test(password);
      this.hasNumber = /[0-9]+/.test(password);
      this.hasSpecialChars = regex.test(password);
      this.hasMinLength = password.length >= 8 ? true : false;
      // const hasMaxLength = password.length <= 20 ? true : false;

      this.strength = 0
        + Number(this.hasLowerCase)
        + Number(this.hasUpperCase)
        + Number(this.hasNumber)
        + Number(this.hasSpecialChars)
        + Number(this.hasMinLength);
    }
  }
}
