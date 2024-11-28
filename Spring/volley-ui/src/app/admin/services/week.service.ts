import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { WeekOption } from '../model/week-option.model';

@Injectable({
  providedIn: 'root',
})
export class WeekService {
  private SERVER_URL: string = 'http://localhost:8082/api/admin';

  constructor(private http: HttpClient) {}

  // READ
  public getWeekOptions(uuid: string): Observable<WeekOption[]> {
    const url = `${this.SERVER_URL}/weekOptions?uuid=${uuid}`;
    return this.http.get<WeekOption[]>(url);
  }
}
