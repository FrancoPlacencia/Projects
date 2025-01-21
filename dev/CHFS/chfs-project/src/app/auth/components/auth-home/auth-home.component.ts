import { Component, OnInit } from '@angular/core';
import { MatCardModule } from '@angular/material/card';
import { NavigationEnd, Router, RouterOutlet } from '@angular/router';
import { LogoComponent } from '../../../common/logo/logo.component';
import { MatDividerModule } from '@angular/material/divider';

@Component({
  selector: 'app-auth-home',
  standalone: true,
  imports: [
    RouterOutlet,

    MatCardModule,
    MatDividerModule,
    LogoComponent

  ],
  templateUrl: './auth-home.component.html',
  styleUrl: './auth-home.component.scss'
})
export class AuthHomeComponent {

  public title: string = '';

  private url: string = '';

  public size: string = 'small-box';

  constructor(private router: Router) {
    this.router.events.subscribe((ev) => {
      if (ev instanceof NavigationEnd) {
        this.urlChanged();
      }
    });
  }

  private urlChanged(): void {
    // Get the URL
    let urls = this.router.url.split('/');
    this.url = urls[urls.length - 1];
    this.url = this.url.indexOf('?') >= 0 ? this.url.substring(0, this.url.indexOf('?')) : this.url;

    // Set Size
    this.size = this.url === 'register' ? 'big-box' : 'small-box';

    // Set Title
    switch (this.url) {
      case 'login':
        this.title = 'Log In';
        break;
      case 'register':
        this.title = 'Registration';
        break;
      case 'forgot-password':
        this.title = 'Forgot Password';
        break;
      case 'reset-password':
        this.title = 'Reset Password';
        break;
      default: this.title = 'Unknonw';
        break;
    }
  }

}
