import { Injectable } from '@angular/core';

const JWT_TOKEN: string = "chfsJWTToken"

@Injectable({
    providedIn: 'root'
})
export class AuthService {

    constructor() { }

    getAuthorizationToken() {
        console.log("getAuthorizationToken " + localStorage.getItem(JWT_TOKEN));
        return localStorage.getItem(JWT_TOKEN);
    }

    setAuthorizationToken(authToken: string) {
        localStorage.setItem(JWT_TOKEN, authToken)
    }

    clearAuthorizationToken() {
        localStorage.removeItem(JWT_TOKEN);
    }
}