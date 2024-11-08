import { Component } from '@angular/core';
import { MatButtonModule } from '@angular/material/button';
import { MatCardModule } from '@angular/material/card';
import { MatDividerModule } from '@angular/material/divider';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatIconModule } from '@angular/material/icon';
import { MatInputModule } from '@angular/material/input';
import { MatListModule } from '@angular/material/list';
import { MatMenuModule } from '@angular/material/menu';
import { MatSelectModule } from '@angular/material/select';
import { MatSidenavModule } from '@angular/material/sidenav';
import { MatToolbarModule } from '@angular/material/toolbar';
import { MatTreeModule } from '@angular/material/tree';
import { RouterLink, RouterOutlet } from '@angular/router';
import { LogoComponent } from '../common/logo/logo.component';

interface NavItem {
  icon: string,
  title: string,
  url: string,
  children?: NavItem[]
}



@Component({
  selector: 'app-home',
  standalone: true,
  imports: [
    RouterOutlet,
    RouterLink,

    MatCardModule,
    MatFormFieldModule,
    MatInputModule,
    MatDividerModule,
    MatIconModule,
    MatButtonModule,
    MatToolbarModule,
    MatSidenavModule,
    MatFormFieldModule,
    MatSelectModule,
    MatButtonModule,
    MatMenuModule,
    MatListModule,
    MatTreeModule,

    LogoComponent
  ],
  templateUrl: './home.component.html',
  styleUrl: './home.component.scss'
})
export class HomeComponent {
  public navItems: NavItem[] = [
    {
      icon: 'manage_accounts',
      title: 'admin',
      url: './admin',
      children: [
        {
          icon: 'manage_accounts',
          title: 'admin-list',
          url: './admin'
        }
      ]
    },
    {
      icon: 'logout',
      title: 'logout',
      url: '/logout'
    },

  ];
}
