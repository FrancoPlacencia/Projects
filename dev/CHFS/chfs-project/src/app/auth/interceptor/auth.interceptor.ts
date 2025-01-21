import { HTTP_INTERCEPTORS, HttpEvent, HttpHandler, HttpInterceptor, HttpRequest } from "@angular/common/http";
import { Observable } from "rxjs";
import { Provider } from "@angular/core";
import { AuthInterceptor } from "../services/auth.interceptor";
import { JwtService } from "../services/token.service";

export class Auth implements HttpInterceptor {

  constructor(private jwtService: JwtService) { }

  intercept(req: HttpRequest<any>, next: HttpHandler): Observable<HttpEvent<any>> {
    // Get the auth token
    debugger;
    const authToken: string = this.jwtService.getJWTToken() as string;
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