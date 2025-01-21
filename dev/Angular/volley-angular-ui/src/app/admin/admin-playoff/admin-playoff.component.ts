// @angular
import { Component } from '@angular/core';
import {
  FormBuilder,
  FormGroup,
  FormsModule,
  ReactiveFormsModule,
  Validators,
} from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { CommonModule } from '@angular/common';

// @angular/material
import { MatTableDataSource, MatTableModule } from '@angular/material/table';
import { MatDialog } from '@angular/material/dialog';
import { MatButtonModule } from '@angular/material/button';
import { MatCardModule } from '@angular/material/card';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatIconModule } from '@angular/material/icon';
import { MatInputModule } from '@angular/material/input';
import { MatListModule } from '@angular/material/list';
import { MatSlideToggleModule } from '@angular/material/slide-toggle';
import { MatSelectModule } from '@angular/material/select';
import { navigateToTournament } from '../../util/navigate-util';

@Component({
  selector: 'app-admin-playoff',
  imports: [
    CommonModule,
    FormsModule,
    ReactiveFormsModule,
    MatButtonModule,
    MatCardModule,
    MatFormFieldModule,
    MatIconModule,
    MatInputModule,
    MatListModule,
    MatSlideToggleModule,
    MatTableModule,
    MatSelectModule,
  ],
  templateUrl: './admin-playoff.component.html',
  styleUrl: './admin-playoff.component.scss',
})
export class AdminPlayoffComponent {
  private tournamnetId!: number;
  public category!: string;

  public formGroup: FormGroup;

  constructor(
    private route: ActivatedRoute,
    private router: Router,
    private formBuilder: FormBuilder,
  ) {
    // Get data from URL
    this.route.queryParamMap.subscribe((params) => {
      this.tournamnetId = Number(params.get('id'))!;
      this.category = params.get('category')!;
    });

    this.formGroup = this.formBuilder.group({
      teamNumber: [undefined, Validators.required],
      name: [undefined, Validators.required],
      initials: [undefined, Validators.required],
    });
  }

  public submit(): void {
    this.formGroup.markAllAsTouched();
  }

  public reset(): void {
    this.formGroup.markAllAsTouched();
  }

  public tournament(): void {
    navigateToTournament(this.router, this.route);
  }
}
