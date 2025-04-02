import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Team } from '../model/team.model';
import { Observable, map, pipe } from 'rxjs';
import { CommonResponse } from '../common/model/common-response.dto';
import { TeamOption } from '../model/team-option.model';
import { Standing } from '../model/standing.model';

@Injectable({
  providedIn: 'root',
})
export class TeamService {
  private SERVER_URL: string = 'http://localhost:8082/api';

  constructor(private http: HttpClient) {}

  // CREATE
  public postTeam(team: Team): Observable<CommonResponse> {
    const url = `${this.SERVER_URL}/admin/team`;
    return this.http.post<CommonResponse>(url, team);
  }

  // READ
  public getTeam(teamId: number): Observable<Team> {
    const url = `${this.SERVER_URL}/team?id=${teamId}`;
    return this.http.get<Team>(url);
  }

  public getTeams(
    tournamentId: number,
    category: string,
    stage: string,
  ): Observable<Team[]> {
    const url = `${this.SERVER_URL}/teams?id=${tournamentId}&category=${category}&stage=${stage}`;
    return this.http.get<Team[]>(url);
  }

  public getStandings(
    tournamentId: number,
  ): Observable<Map<string, Standing[]>> {
    const url = `${this.SERVER_URL}/standings?id=${tournamentId}`;
    return this.http.get<Map<string, Standing[]>>(url);
  }

  public getTeamOptions(
    tournamentId: number,
    stage: string,
  ): Observable<Map<string, TeamOption[]>> {
    const url = `${this.SERVER_URL}/teamOptions?id=${tournamentId}&stage=${stage}`;
    return this.http.get<Map<string, TeamOption[]>>(url);
  }

  public getPlayoffTeamOptions(
    tournamentId: number,
    stage: string,
  ): Observable<Map<string, TeamOption[]>> {
    const url = `${this.SERVER_URL}/playoffTeamOptions?id=${tournamentId}&stage=${stage}`;
    return this.http.get<Map<string, TeamOption[]>>(url);
  }

  // UPDATE
  public putTeam(team: Team): Observable<CommonResponse> {
    const url = `${this.SERVER_URL}/admin/team`;
    return this.http.put<CommonResponse>(url, team);
  }

  // DELETE
  public deleteTeam(teamId: number): Observable<CommonResponse> {
    const url = `${this.SERVER_URL}/admin/team?id=${teamId}`;
    return this.http.delete<CommonResponse>(url);
  }
}
