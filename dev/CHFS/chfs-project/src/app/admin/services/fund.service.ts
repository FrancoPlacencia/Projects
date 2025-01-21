import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';


import { CommonResponse } from '../../common/model/dto/common-response.dto';
import { Fund } from '../model/fund.model';
import { FundOption } from '../model/dto/fund-option.dto';

@Injectable({
  providedIn: 'root'
})
export class FundService {

  private SERVER_URL: string = "http://localhost:8081/api/admin";

  constructor(private http: HttpClient) { }

  public getAll(): Observable<Fund[]> {
    const url = `${this.SERVER_URL}/fund-list`;
    return this.http.get<Fund[]>(url)
  }

  public getAllOption(): Observable<FundOption[]> {
    const url = `${this.SERVER_URL}/fund-option-list`;
    return this.http.get<FundOption[]>(url)
  }

  public get(id: number): Observable<Fund> {
    const url = `${this.SERVER_URL}/fund?id=${id}`;
    return this.http.get<Fund>(url);
  }

  public update(fund: Fund): Observable<CommonResponse> {
    const url = `${this.SERVER_URL}/fund`;
    return this.http.put<CommonResponse>(url, fund);
  }

  public create(fund: Fund): Observable<CommonResponse> {
    const url = `${this.SERVER_URL}/fund`;
    return this.http.post<CommonResponse>(url, fund);
  }

  public delete(name: string): Observable<CommonResponse> {
    const url = `${this.SERVER_URL}/fund?name=${name}`;
    return this.http.delete<CommonResponse>(url);
  }
}
