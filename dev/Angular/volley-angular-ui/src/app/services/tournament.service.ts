import { Tournament } from '../model/tournament.model';
import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { map, Observable } from 'rxjs';
import { CommonResponse } from '../common/model/common-response.dto';
import { TournamentApp } from '../model/tournament-app.model';

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
  public getTournamentById(id: number): Observable<Tournament> {
    const url = `${this.SERVER_URL}/tournamentById?id=${id}`;
    return this.http.get<Tournament>(url);
  }

  public getTournament(): Observable<Tournament> {
    const url = `${this.SERVER_URL}/tournament`;
    return this.http.get<Tournament>(url);
  }

  public getTournaments(): Observable<Tournament[]> {
    const url = `${this.SERVER_URL}/tournaments`;
    return this.http.get<Tournament[]>(url);
  }

  public getTournamentApp(): Observable<TournamentApp> {
    const url = `${this.SERVER_URL}/tournamentApp`;
    return this.http.get<TournamentApp>(url);
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
