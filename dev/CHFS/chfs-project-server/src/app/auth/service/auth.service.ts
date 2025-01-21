import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { LoginUser } from '../model/login-user.model';

@Injectable({
    providedIn: 'root'
})
export class AuthService {

    private SERVER_URL: string = "http://localhost:8081";

    constructor(private http: HttpClient) { }

    login(user: LoginUser): Observable<any> {
        return this.http.post(this.SERVER_URL + "/auth/login", user);
    }

    register(user: LoginUser): Observable<any> {
        return this.http.post(this.SERVER_URL + "/auth/register", user);
    }

}
