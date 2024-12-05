import { SidenavElement } from './../common/model/sidenav-element';
import { Component, ViewChild } from '@angular/core';
import { MatButtonModule } from '@angular/material/button';
import { MatCardModule } from '@angular/material/card';
import { MatDividerModule } from '@angular/material/divider';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatIconModule } from '@angular/material/icon';
import { MatInputModule } from '@angular/material/input';
import { MatListModule } from '@angular/material/list';
import { MatMenuModule } from '@angular/material/menu';
import { MatSelectModule } from '@angular/material/select';
import { MatSidenav, MatSidenavModule } from '@angular/material/sidenav';
import { MatToolbarModule } from '@angular/material/toolbar';
import { MatTreeModule } from '@angular/material/tree';
import { RouterLink, RouterOutlet } from '@angular/router';
import { LogoComponent } from '../common/logo/logo.component';
import { BreakpointObserver } from '@angular/cdk/layout';
import { CommonModule } from '@angular/common';

interface NavItem {
  icon: string;
  title: string;
  url: string;
  children?: NavItem[];
}

@Component({
    selector: 'app-home',
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
        CommonModule,
        LogoComponent,
    ],
    templateUrl: './home.component.html',
    styleUrl: './home.component.scss'
})
export class HomeComponent {
  title = 'material-responsive-sidenav';
  @ViewChild(MatSidenav)
  sidenav!: MatSidenav;
  isMobile = false;
  isCollapsed = true;
  sideNavElements: SidenavElement[] = [
    {
      url: '/',
      icon: 'home',
      description: 'Inicio',
    },
    {
      url: '../admin/tournament',
      icon: 'admin_panel_settings',
      description: 'Administrador',
    },
  ];

  constructor(private observer: BreakpointObserver) {}

  ngOnInit() {
    this.observer.observe(['(max-width: 800px)']).subscribe((screenSize) => {
      this.isMobile = screenSize.matches ? true : false;
    });
  }

  toggleMenu() {
    if (this.isMobile) {
      //this.sidenav.toggle();
      this.isCollapsed = false;
    } else {
      this.sidenav.open();
      this.isCollapsed = !this.isCollapsed;
    }
  }
  something() {
    console.log('hey');
    this.sidenav.open();
    this.isCollapsed = true;
  }
}
