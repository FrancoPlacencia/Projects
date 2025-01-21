import { Injectable } from '@angular/core';
import { HttpClient } from "@angular/common/http";
import { Observable, of } from 'rxjs';
import { catchError, map, tap } from 'rxjs/operators';
import { UserAdmin } from '../user-admin/user-admin.model';


@Injectable({
    providedIn: 'root'
})
export class UserService {

    private SERVER_URL: string = "http://localhost:8081"

    constructor(private http: HttpClient) { }

    login(user: any): Observable<any> {
        return this.http.post(this.SERVER_URL + "/auth/login", user);
    }

    register(user: any): Observable<any> {
        return this.http.post(this.SERVER_URL + "/auth/register", user);
    }

    userInfo(user: any): Observable<any> {
        return this.http.get(this.SERVER_URL + "/user/info", user)
    }

    getUsers(): Observable<UserAdmin[]> {
        return this.http.get<UserAdmin[]>(this.SERVER_URL + "/admin/users")
            .pipe(
                tap(_ => this.log('GET USERS')),
                catchError(this.handleError<UserAdmin[]>('getAdminUsers', []))
            );
    }


    /**
    * Handle Http operation that failed.
    * Let the app continue.
    *
    * @param operation - name of the operation that failed
    * @param result - optional value to return as the observable result
    */
    private handleError<T>(operation = 'operation', result?: T) {
        return (error: any): Observable<T> => {

            // TODO: send the error to remote logging infrastructure
            console.error(error); // log to console instead

            // TODO: better job of transforming error for user consumption
            this.log(`${operation} failed: ${error.message}`);

            // Let the app keep running by returning an empty result.
            return of(result as T);
        };
    }

    /** Log a HeroService message with the MessageService */
    private log(message: string) {
        console.log(`UserService: ${message}`)
    }


}
