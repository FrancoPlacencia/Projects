import { Injectable } from '@angular/core';

@Injectable({
    providedIn: 'root'
})
export class JwtService {

    private JWT_TOKEN: string = "chfsJWTToken";

    constructor() { }

    getAuthorizationToken() {
        console.log("getAuthorizationToken " + localStorage.getItem(this.JWT_TOKEN));
        return localStorage.getItem(this.JWT_TOKEN);
    }

    setAuthorizationToken(authToken: string) {
        localStorage.setItem(this.JWT_TOKEN, authToken)
    }

    clearAuthorizationToken() {
        localStorage.removeItem(this.JWT_TOKEN);
    }
}
