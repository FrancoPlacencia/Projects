import { Tournament } from '../model/tournament.model';
import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { CommonResponse } from '../../common/model/common-response.dto';

@Injectable({
  providedIn: 'root',
})
export class TournamentService {
  private SERVER_URL: string = 'http://localhost:8082/api';

  constructor(private http: HttpClient) {}

  // CREATE
  public postTournament(tournament: Tournament): Observable<CommonResponse> {
    const url = `${this.SERVER_URL}/admin/tournament`;
    return this.http.post<CommonResponse>(url, tournament);
  }

  // READ
  public getTournament(id: number): Observable<Tournament> {
    const url = `${this.SERVER_URL}/tournament?id=${id}`;
    return this.http.get<Tournament>(url);
  }

  public getTournaments(): Observable<Tournament[]> {
    const url = `${this.SERVER_URL}/tournaments`;
    return this.http.get<Tournament[]>(url);
  }

  // UPDATE
  public putTournament(tournament: Tournament): Observable<CommonResponse> {
    const url = `${this.SERVER_URL}/admin/tournament`;
    return this.http.put<CommonResponse>(url, tournament);
  }

  // DELETE
  public deleteTournament(id: number): Observable<CommonResponse> {
    const url = `${this.SERVER_URL}/admin/tournament?id=${id}`;
    return this.http.delete<CommonResponse>(url);
  }
}
