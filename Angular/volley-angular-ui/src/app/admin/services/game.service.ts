import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { WeekOption } from '../model/week-option.model';
import { Game } from '../model/game.model';
import { CommonResponse } from '../../common/model/common-response.dto';

@Injectable({
  providedIn: 'root',
})
export class GameService {
  private SERVER_URL: string = 'http://localhost:8082/api';

  constructor(private http: HttpClient) {}

  // CREATE
  public postGame(game: Game): Observable<CommonResponse> {
    const url = `${this.SERVER_URL}/admin/game`;
    return this.http.post<CommonResponse>(url, game);
  }

  // READ
  public getWeekOptions(id: number): Observable<WeekOption[]> {
    const url = `${this.SERVER_URL}/gameWeeks?id=${id}`;
    return this.http.get<WeekOption[]>(url);
  }

  public getGames(
    tournamentId: number,
    weekNumber: number
  ): Observable<Game[]> {
    const url = `${this.SERVER_URL}/games?id=${tournamentId}&weekNumber=${weekNumber}`;
    return this.http.get<Game[]>(url);
  }

  // UPDATE
  public putGame(game: Game): Observable<CommonResponse> {
    const url = `${this.SERVER_URL}/admin/game`;
    return this.http.put<CommonResponse>(url, game);
  }
}
