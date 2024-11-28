import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Player } from '../model/player.model';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root',
})
export class PlayerService {
  private SERVER_URL: string = 'http://localhost:8082/api';

  constructor(private http: HttpClient) {}

  // CREATE
  public postPlayer(player: Player): Observable<Player> {
    const url = `${this.SERVER_URL}/admin/player`;
    return this.http.post<Player>(url, player);
  }

  // READ
  public getPlayersByTeam(uuid: string): Observable<Player[]> {
    const url = `${this.SERVER_URL}/players?uuid=${uuid}`;
    return this.http.get<Player[]>(url);
  }

  // UPDATE
  public putPlayer(player: Player): Observable<Player> {
    const url = `${this.SERVER_URL}/admin/player`;
    return this.http.put<Player>(url, player);
  }

  // DELETE
  public deletePlayer(uuid: string): Observable<Player> {
    const url = `${this.SERVER_URL}/admin/player?uuid=${uuid}`;
    return this.http.delete<Player>(url);
  }
}
