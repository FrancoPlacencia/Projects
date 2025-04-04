import { Tournament } from '../model/tournament.model';
import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root',
})
export class TournamentService {
  private SERVER_URL: string = 'http://localhost:8082/api/admin';

  constructor(private http: HttpClient) {}

  // CREATE
  public postTournament(tournament: Tournament): Observable<Tournament> {
    console.log(tournament);
    const url = `${this.SERVER_URL}/tournament`;
    return this.http.post<Tournament>(url, tournament);
  }

  // READ
  public getTournament(uuid: string): Observable<Tournament> {
    const url = `${this.SERVER_URL}/tournament?uuid=${uuid}`;
    return this.http.get<Tournament>(url);
  }

  public getTournaments(): Observable<Tournament[]> {
    const url = `${this.SERVER_URL}/tournaments`;
    return this.http.get<Tournament[]>(url);
  }

  // UPDATE
  public putTournament(tournament: Tournament): Observable<Tournament> {
    const url = `${this.SERVER_URL}/tournament`;
    return this.http.put<Tournament>(url, tournament);
  }

  // DELETE
  public deleteTournament(tournament: Tournament): Observable<Tournament> {
    const url = `${this.SERVER_URL}/tournament?uuid=${tournament.tournamentUuid}`;
    return this.http.delete<Tournament>(url);
  }
}
