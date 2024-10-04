import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable, of } from 'rxjs';
import { catchError, map, tap } from 'rxjs/operators';
import { User } from '../../auth/model/user.model';
import { CommonResponse } from '../../common/model/dto/common-response.dto';
import { Permissions } from '../model/permission.model';


@Injectable({
  providedIn: 'root'
})
export class UserService {
  private SERVER_URL: string = "http://localhost:8081/api/admin";

  constructor(private http: HttpClient) { }

  public getAll(): Observable<User[]> {
    const url = `${this.SERVER_URL}/users`;
    return this.http.get<User[]>(url);
  }

  public get(email: string): Observable<User> {
    const url = `${this.SERVER_URL}/user?email=${email}`;
    return this.http.get<User>(url);
  }

  public update(user: User): Observable<CommonResponse> {
    const url = `${this.SERVER_URL}/user`;
    console.log('patch url {} user {}', url, user);
    return this.http.patch<CommonResponse>(url, user);
  }

  public delete(email: string): Observable<CommonResponse> {
    const url = `${this.SERVER_URL}/user?email=${email}`;
    return this.http.delete<CommonResponse>(url);
  }

  public addChurch(permission: Permissions): Observable<CommonResponse> {
    const url = `${this.SERVER_URL}/user-church`;
    return this.http.post<CommonResponse>(url, permission);
  }

  public deleteChurch(userId: number, churchId: number): Observable<CommonResponse> {
    const url = `${this.SERVER_URL}/user-church?userId=${userId}&churchId=${churchId}`;
    return this.http.delete<CommonResponse>(url);
  }

}
