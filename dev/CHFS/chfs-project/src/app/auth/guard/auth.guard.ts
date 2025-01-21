import { CanActivateFn, Router } from '@angular/router';
import { AuthService } from '../services/auth.service';
import { inject } from '@angular/core';
import { JwtService } from '../services/token.service';

export const authGuard: CanActivateFn = (route, state) => {
  const jwtToken = inject(JwtService).getJWTToken();
  const router: Router = inject(Router);
  let itTokenPresent = false;
  if (jwtToken) {
    itTokenPresent = true;
  }
  return itTokenPresent || router.navigate(['unauthorized']);
};
