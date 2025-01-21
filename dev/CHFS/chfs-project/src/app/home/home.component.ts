import { Component } from '@angular/core';

// @angular/material
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

import { MatTreeFlatDataSource, MatTreeFlattener, MatTreeModule } from '@angular/material/tree';



import { LogoComponent } from '../common/logo/logo.component';
import { RouterLink, RouterOutlet } from '@angular/router';
import { TreeNode } from '../common/model/tree-node';
import { FlatTreeControl } from '@angular/cdk/tree';

interface NavItem {
  icon: string,
  title: string,
  url: string,
  children?: NavItem[]
}

interface ExampleFlatNode {
  expandable: boolean;
  name: string;
  level: number;
}


const TREE_DATA: TreeNode[] = [
  {
    name: 'admin',
    icon: 'manage_accounts',
    url: './admin',
    children: [
      {
        name: 'admin-list',
        icon: 'manage_accounts',
        url: './admin'
      }
    ]
  },
  {
    name: 'logout',
    icon: 'logout',
    url: '/logout'
  }

];

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

  fillerNav = Array.from({ length: 10 }, (_, i) => `Nav Item ${i + 1}`);


  private transformer = (node: TreeNode, level: number) => {
    return {
      expandable: !!node.children && node.children.length > 0,
      name: node.name,
      level: level,
    }
  };

  public logoType: string = 'white';

  public treeControl = new FlatTreeControl<ExampleFlatNode>(
    node => node.level,
    node => node.expandable
  );

  public treeFlattener = new MatTreeFlattener(
    this.transformer,
    node => node.level,
    node => node.expandable,
    node => node.children
  );

  public dataSource = new MatTreeFlatDataSource(this.treeControl, this.treeFlattener)

  constructor() {
    this.dataSource.data = TREE_DATA;
  }

  hasChild = (_: number, node: ExampleFlatNode) => node.expandable;

}
