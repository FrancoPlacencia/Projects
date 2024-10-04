import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable, catchError, of, tap } from 'rxjs';
import { User } from '../model/user.model';
import { AuthResponse } from '../model/dto/auth-response.dto';
import { RequestLogin } from '../model/dto/request-login.dto';
import { RequestRegister } from '../model/dto/request-register.dto';
import { CommonResponse } from '../../common/model/dto/common-response.dto';
import { RequestResetPassword } from '../model/dto/request-reset-password.dto';
import { RequestForgotPassword } from '../model/dto/request-forgot-password.dto';

@Injectable({
  providedIn: 'root'
})
export class AuthService {

  private SERVER_URL: string = 'http://localhost:8081/api/auth';

  httpOptions = {
    headers: new HttpHeaders({ 'Content-Type': 'application/json' })
  };

  constructor(private http: HttpClient) { }

  login(requestLogin: RequestLogin): Observable<AuthResponse> {
    const url = `${this.SERVER_URL}/login`;
    return this.http.post<AuthResponse>(url, requestLogin);
  }

  register(requestRegister: RequestRegister): Observable<CommonResponse> {
    return this.http.post<CommonResponse>(this.SERVER_URL + "/register", requestRegister);
  }

  forgot(requestForgotPassword: RequestForgotPassword): Observable<CommonResponse> {
    return this.http.post<CommonResponse>(this.SERVER_URL + "/forgot-password", requestForgotPassword);
  }

  reset(requestResetPassword: RequestResetPassword): Observable<CommonResponse> {
    return this.http.post<CommonResponse>(this.SERVER_URL + "/reset-password", requestResetPassword);
  }

  logout() {
    console.log('logout');
    return '';
  }

}
