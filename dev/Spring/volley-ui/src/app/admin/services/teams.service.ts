import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Team } from '../model/team.model';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root',
})
export class TeamsService {
  private SERVER_URL: string = 'http://localhost:8082/api/admin';

  constructor(private http: HttpClient) {}

  // CREATE
  public postTeam(team: Team): Observable<Team> {
    const url = `${this.SERVER_URL}/team`;
    return this.http.post<Team>(url, team);
  }

  // READ
  public getTeam(uuid: string): Observable<Team> {
    const url = `${this.SERVER_URL}/team?uuid=${uuid}`;
    return this.http.get<Team>(url);
  }

  public getTeams(uuid: string, category: string): Observable<Team[]> {
    console.log(
      'call ',
      `${this.SERVER_URL}/teams?uuid=${uuid}&category=${category}`
    );
    const url = `${this.SERVER_URL}/teams?uuid=${uuid}&category=${category}`;
    return this.http.get<Team[]>(url);
  }

  // UPDATE
  public putTeam(team: Team): Observable<Team> {
    const url = `${this.SERVER_URL}/team`;
    return this.http.put<Team>(url, team);
  }

  // DELETE
  public deleteTeam(team: Team): Observable<Team> {
    const url = `${this.SERVER_URL}/team?uuid=${team.teamUuid}`;
    return this.http.delete<Team>(url);
  }
}
