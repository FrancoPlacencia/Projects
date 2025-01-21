import { Routes } from '@angular/router';
import { LoginComponent } from './auth/components/login/login.component';
import { RegisterComponent } from './auth/components/register/register.component';
import { NotFoundComponent } from './common/not-found/not-found.component';
import { HomeComponent } from './home/home.component';
import { ForgotPasswordComponent } from './auth/components/forgot-password/forgot-password.component';
import { ResetPasswordComponent } from './auth/components/reset-password/reset-password.component';
import { authGuard } from './auth/guard/auth.guard';
import { UnauthorizedComponent } from './common/unauthorized/unauthorized.component';
import { AdminComponent } from './admin/admin.component';
import { UserListComponent } from './admin/components/user-list/user-list.component';
import { UserComponent } from './admin/components/user/user.component';
import { LogoutComponent } from './auth/components/logout/logout.component';
import { AuthHomeComponent } from './auth/components/auth-home/auth-home.component';
import { ChurchComponent } from './admin/components/church/church.component';
import { CategoryComponent } from './admin/components/category/category.component';
import { FundComponent } from './admin/components/fund/fund.component';



export const routes: Routes = [
  { path: '', redirectTo: 'auth/login', pathMatch: 'full' },

  {
    path: 'auth', component: AuthHomeComponent,
    children: [
      { path: 'login', component: LoginComponent },
      { path: 'logout', component: LogoutComponent },
      { path: 'register', component: RegisterComponent },
      { path: 'forgot-password', component: ForgotPasswordComponent },
      { path: 'reset-password', component: ResetPasswordComponent }
    ]
  },
  {
    path: 'app', component: HomeComponent, canActivate: [authGuard],
    children: [
      { path: 'admin', component: AdminComponent },

      // User
      { path: 'admin/user-list', component: UserListComponent },
      { path: 'admin/user', component: UserComponent },

      { path: 'admin/church', component: ChurchComponent },
      { path: 'admin/category', component: CategoryComponent },
      { path: 'admin/fund', component: FundComponent },
    ]
  },



  { path: 'unauthorized', component: UnauthorizedComponent },
  { path: '**', component: NotFoundComponent }
];
