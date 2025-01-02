import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { WeekOption } from '../model/week-option.model';
import { Game } from '../model/game.model';
import { CommonResponse } from '../common/model/common-response.dto';
import { AppConstant } from '../util/app-constant';

@Injectable({
  providedIn: 'root',
})
export class GameService {
  constructor(private http: HttpClient) {}

  // CREATE
  public postGame(game: Game): Observable<CommonResponse> {
    AppConstant.SERVER_URL;
    const url = `${AppConstant.SERVER_URL}/admin/game`;
    return this.http.post<CommonResponse>(url, game);
  }

  // READ
  public getWeekOptions(id: number): Observable<WeekOption[]> {
    const url = `${AppConstant.SERVER_URL}/gameWeeks?id=${id}`;
    return this.http.get<WeekOption[]>(url);
  }

  public getGamesWeek(id: number, weekNumber: number): Observable<Game[]> {
    const url = `${AppConstant.SERVER_URL}/gamesByWeek?id=${id}&weekNumber=${weekNumber}`;
    return this.http.get<Game[]>(url);
  }

  public getGames(id: number): Observable<Game[]> {
    const url = `${AppConstant.SERVER_URL}/games?id=${id}`;
    return this.http.get<Game[]>(url);
  }

  // UPDATE
  public putGame(game: Game): Observable<CommonResponse> {
    console.log('putGame ', game);
    const url = `${AppConstant.SERVER_URL}/admin/game`;
    return this.http.put<CommonResponse>(url, game);
  }

  // DELETE
  public deleteGame(gameId: number): Observable<CommonResponse> {
    const url = `${AppConstant.SERVER_URL}/admin/game?id=${gameId}`;
    return this.http.delete<CommonResponse>(url);
  }
}
