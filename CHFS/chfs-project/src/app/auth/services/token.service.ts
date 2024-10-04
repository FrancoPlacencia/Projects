import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class JwtService {

  private JWT_TOKEN: string = "chfsJWTToken";

  constructor() { }

  getJWTToken() {
    return localStorage.getItem(this.JWT_TOKEN);
  }

  setJWTToken(authToken: string) {
    localStorage.setItem(this.JWT_TOKEN, authToken);
  }

  clearJWTToken() {
    localStorage.removeItem(this.JWT_TOKEN);
  }

}
