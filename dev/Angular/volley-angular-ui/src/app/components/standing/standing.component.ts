import { CommonModule } from '@angular/common';
import { Component, Input } from '@angular/core';
import { MatTableDataSource, MatTableModule } from '@angular/material/table';
import { MatTabsModule } from '@angular/material/tabs';

@Component({
  selector: 'app-standing',
  imports: [CommonModule, MatTabsModule, MatTableModule],
  templateUrl: './standing.component.html',
  styleUrl: './standing.component.scss',
})
export class StandingComponent {
  // Table Data
  public columnsHeader: string[] = [
    'position',
    'name',
    'games',
    'sets',
    'points',
  ];

  @Input() dataSource: MatTableDataSource<any> | undefined;

  @Input() category: string | undefined;
}
