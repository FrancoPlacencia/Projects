import { HTTP_INTERCEPTORS, HttpEvent, HttpHandler, HttpInterceptor, HttpRequest } from "@angular/common/http";
import { Injectable, Provider } from "@angular/core";
import { Observable } from "rxjs";
import { JwtService } from "./token.service";

@Injectable()
export class AuthInterceptor implements HttpInterceptor {
  constructor(private tokenService: JwtService) { }

  intercept(req: HttpRequest<any>, next: HttpHandler): Observable<HttpEvent<any>> {
    // Get the auth token
    const authToken: string = this.tokenService.getJWTToken() as string;
    // Clone request
    if (authToken) {
      const authRequest = req.clone({
        setHeaders: { Authorization: 'Bearer ' + authToken }
      });
      return next.handle(authRequest)
    } else {
      return next.handle(req);
    }
  }
};

export const authInterceptorProvider: Provider = [
  { provide: HTTP_INTERCEPTORS, useClass: AuthInterceptor, multi: true }
];