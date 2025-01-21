import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

import { Category } from '../model/category.model';
import { CommonResponse } from '../../common/model/dto/common-response.dto';


@Injectable({
  providedIn: 'root'
})
export class CategoryService {
  private SERVER_URL: string = "http://localhost:8081/api/admin";

  constructor(private http: HttpClient) { }

  public getAll(): Observable<Category[]> {
    const url = `${this.SERVER_URL}/category-list`;
    return this.http.get<Category[]>(url)
  }

  public get(id: number): Observable<Category> {
    const url = `${this.SERVER_URL}/category?id=${id}`;
    return this.http.get<Category>(url);
  }

  public update(category: Category): Observable<CommonResponse> {
    const url = `${this.SERVER_URL}/category`;
    return this.http.put<CommonResponse>(url, category);
  }

  public create(category: Category): Observable<CommonResponse> {
    const url = `${this.SERVER_URL}/category`;
    return this.http.post<CommonResponse>(url, category);
  }

  public delete(name: string): Observable<CommonResponse> {
    const url = `${this.SERVER_URL}/category?name=${name}`;
    return this.http.delete<CommonResponse>(url);
  }
}
