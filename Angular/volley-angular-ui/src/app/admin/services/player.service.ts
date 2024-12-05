import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Player } from '../model/player.model';
import { Observable } from 'rxjs';
import { CommonResponse } from '../../common/model/common-response.dto';

@Injectable({
  providedIn: 'root',
})
export class PlayerService {
  private SERVER_URL: string = 'http://localhost:8082/api';

  constructor(private http: HttpClient) {}

  // CREATE
  public postPlayer(player: Player): Observable<CommonResponse> {
    const url = `${this.SERVER_URL}/admin/player`;
    return this.http.post<CommonResponse>(url, player);
  }

  // READ
  public getPlayersByTeam(teamId: number): Observable<Player[]> {
    const url = `${this.SERVER_URL}/players?id=${teamId}`;
    return this.http.get<Player[]>(url);
  }

  // UPDATE
  public putPlayer(player: Player): Observable<CommonResponse> {
    const url = `${this.SERVER_URL}/admin/player`;
    return this.http.put<CommonResponse>(url, player);
  }

  // DELETE
  public deletePlayer(playerId: number): Observable<CommonResponse> {
    const url = `${this.SERVER_URL}/admin/player?id=${playerId}`;
    return this.http.delete<CommonResponse>(url);
  }
}
