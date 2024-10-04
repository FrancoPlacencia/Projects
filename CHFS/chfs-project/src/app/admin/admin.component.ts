import { Component } from '@angular/core';
import { Router, RouterLink, RouterOutlet } from '@angular/router';
import { MatCardModule } from '@angular/material/card';
import { MatDialog } from '@angular/material/dialog';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatInputModule } from '@angular/material/input';
import { MatDividerModule } from '@angular/material/divider';
import { MatIconModule } from '@angular/material/icon';
import { MatButtonModule } from '@angular/material/button';
import { MatToolbarModule } from '@angular/material/toolbar';
import { MatSelectModule } from '@angular/material/select';
import { MatSidenavModule } from '@angular/material/sidenav';
import { MatMenuModule } from '@angular/material/menu';
import { MatListModule } from '@angular/material/list';
import { LogoComponent } from '../common/logo/logo.component';
import { Tile } from '../common/model/tile.model';


@Component({
  selector: 'app-admin',
  standalone: true,
  imports: [
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
    LogoComponent
  ],
  templateUrl: './admin.component.html',
  styleUrl: './admin.component.scss'
})
export class AdminComponent {

  constructor(private router: Router) { }

  public tiles: Tile[] = [
    {
      icon: 'manage_accounts',
      title: 'Users',
      description: 'Manage users data.',
      url: './user-list'
    },
    {
      icon: 'church',
      title: 'Churchs',
      description: 'Manage church data.',
      url: './church'
    },
    {
      icon: 'category',
      title: 'Categories',
      description: 'Manage category data.',
      url: './category'
    },
    {
      icon: 'category',
      title: 'Fund',
      description: 'Manage fund data.',
      url: './fund'
    }
  ];

  public logoType: string = 'white';

  public moveTo(url: string): void {
    this.router.navigateByUrl(url)
  }
}
