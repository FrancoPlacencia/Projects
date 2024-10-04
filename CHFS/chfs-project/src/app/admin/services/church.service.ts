import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable, of } from 'rxjs';
import { catchError, map, tap } from 'rxjs/operators';
import { User } from '../../auth/model/user.model';
import { CommonResponse } from '../../common/model/dto/common-response.dto';
import { Church } from '../model/church.model';
import { ChurchOption } from '../model/dto/church-option.dto';
import { Permissions } from '../model/permission.model';


@Injectable({
  providedIn: 'root'
})
export class ChurchService {
  private SERVER_URL: string = "http://localhost:8081/api/admin";

  constructor(private http: HttpClient) { }

  public createChurch(church: Church): Observable<CommonResponse> {
    const url = `${this.SERVER_URL}/church`;
    return this.http.post<CommonResponse>(url, church);
  }

  public getChurches(): Observable<Church[]> {
    const url = `${this.SERVER_URL}/churches`;
    return this.http.get<Church[]>(url)
  }

  public getChurchById(churchId: number): Observable<Church> {
    const url = `${this.SERVER_URL}/church?churchId=${churchId}`;
    return this.http.get<Church>(url);
  }

  public updateChurch(church: Church): Observable<CommonResponse> {
    const url = `${this.SERVER_URL}/church`;
    return this.http.put<CommonResponse>(url, church);
  }

  public deleteChurch(name: string): Observable<CommonResponse> {
    const url = `${this.SERVER_URL}/church?name=${name}`;
    return this.http.delete<CommonResponse>(url);
  }

  public getChurchOptions(): Observable<ChurchOption[]> {
    const url = `${this.SERVER_URL}/church-option-list`;
    return this.http.get<ChurchOption[]>(url)
  }

  public getChurchByUser(userId: number): Observable<ChurchOption[]> {
    const url = `${this.SERVER_URL}/user-churches?userId=${userId}`;
    return this.http.get<ChurchOption[]>(url)
  }

  public getChurchMissingByUser(userId: number): Observable<ChurchOption[]> {
    const url = `${this.SERVER_URL}/user-missing-churches?userId=${userId}`;
    return this.http.get<ChurchOption[]>(url)
  }

  public addPermission(permission: Permissions): Observable<CommonResponse> {
    const url = `${this.SERVER_URL}/permission`;
    return this.http.post<CommonResponse>(url, permission);
  }

}
