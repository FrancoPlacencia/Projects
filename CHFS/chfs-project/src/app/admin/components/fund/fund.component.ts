import { Component } from '@angular/core';
import { CommonModule, DatePipe } from '@angular/common';
import { FormBuilder, FormGroup, FormsModule, ReactiveFormsModule, Validators } from '@angular/forms';

import { MatCardModule } from '@angular/material/card';
import { MatTableDataSource, MatTableModule } from '@angular/material/table';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatButtonModule } from '@angular/material/button';
import { MatInputModule } from '@angular/material/input';
import { MatDialog } from '@angular/material/dialog';
import { MatIconModule } from '@angular/material/icon';

import { Fund } from '../../model/fund.model';

import { CommonResponse } from '../../../common/model/dto/common-response.dto';

import { openCommonDialog, openConfirmDialog, openErrorDialog } from '../../../common/Utils/MessageUtil';
import { endProcessing, resetFormGroup, startProcessing } from '../../../common/Utils/FormUtil';
import { FundService } from '../../services/fund.service';


@Component({
  selector: 'app-fund',
  standalone: true,
  imports: [
    CommonModule,
    FormsModule,
    ReactiveFormsModule,

    MatCardModule,
    MatTableModule,
    MatButtonModule,
    MatFormFieldModule,
    MatInputModule,
    MatIconModule,

    DatePipe
  ],
  templateUrl: './fund.component.html',
  styleUrl: '../../admin.component.scss'
})
export class FundComponent {
  // Load Flags
  public tableLoaded: boolean = false;
  public isProcessing: boolean = false;
  public isNew: boolean = true;

  // Table Data
  public columnsHeader: string[] = ['fund', 'created', 'updated', 'action'];
  public dataSource: MatTableDataSource<any> | undefined;
  public errorMessage: string = '';

  // Form Data
  public formGroup: FormGroup;
  private fund: Fund;

  constructor(
    private fundService: FundService,
    private formBuilder: FormBuilder,
    private dialog: MatDialog
  ) {
    this.fund = {
      name: '',
      description: '',
    }

    this.formGroup = this.formBuilder.group({
      name: [this.fund.name, Validators.required],
      description: [this.fund.description, Validators.required],
    });

    this.formGroup.get("name")!.valueChanges.subscribe(selectedValue => {
      this.fund.name = selectedValue;
    });

    this.formGroup.get("description")!.valueChanges.subscribe(selectedValue => {
      this.fund.description = selectedValue;
    });
    this.getAllRequest();
  }

  // PUBLIC METHODS
  public applyFilter(event: Event): void {
    const filterValue = (event.target as HTMLInputElement).value;
    if (this.dataSource) {
      this.dataSource.filter = filterValue.trim().toLowerCase();
    }
  }

  public edit(fund: Fund): void {
    this.isNew = false;
    this.fund.fundId = fund.fundId;
    this.formGroup.get("name")?.setValue(fund.name);
    this.formGroup.get("description")?.setValue(fund.description);
  }

  public submit(): void {
    this.formGroup.markAllAsTouched();
    if (this.formGroup.status === "VALID") {
      this.isProcessing = startProcessing(this.formGroup, this.dialog);
      this.isNew ? this.createRequest() : this.updateRequest();
      this.isNew = true;
    }
  }

  public delete(fund: Fund): void {
    if (fund) {
      const dialogRef = openConfirmDialog(this.dialog);
      dialogRef.afterClosed().subscribe(result => {
        if (result) {
          this.isProcessing = startProcessing(this.formGroup, this.dialog);
          this.deleteRequest(fund);
        }
      });
    }
  }

  public reset(): void {
    resetFormGroup(this.formGroup);
    this.isNew = true;
  }

  // ======================================================
  // HTTP REQUEST
  // ======================================================
  private createRequest(): void {
    this.fundService.create(this.fund).subscribe({
      next: (commonResponse: CommonResponse) => {
        this.isProcessing = endProcessing(this.formGroup, this.dialog);
        resetFormGroup(this.formGroup!);
        openCommonDialog(this.dialog, commonResponse);
        this.getAllRequest();
      },
      error: (e: any) => {
        this.isProcessing = endProcessing(this.formGroup, this.dialog);
        switch (e.status) {
          case 0:
            openErrorDialog(this.dialog);
            break;
          default:
            openCommonDialog(this.dialog, e.error);
            break;
        }
      }
    });
  }

  private getAllRequest(): void {
    this.fundService.getAll().subscribe({
      next: (fundList: Fund[]) => {
        if (fundList) {
          this.dataSource = new MatTableDataSource(fundList);
        } else {
          this.dataSource = undefined;
          this.errorMessage = "Nothing to display...";
        }
        this.tableLoaded = true;
      },
      error: (e: any) => {
        this.tableLoaded = true;
        this.errorMessage = 'Unable to load the data!';
      }
    });
  }

  private updateRequest(): void {
    this.fundService.update(this.fund).subscribe({
      next: (commonResponse: CommonResponse) => {
        this.isProcessing = endProcessing(this.formGroup, this.dialog);
        resetFormGroup(this.formGroup!);
        openCommonDialog(this.dialog, commonResponse);
        this.getAllRequest();
      },
      error: (e: any) => {
        this.isProcessing = endProcessing(this.formGroup, this.dialog);
        switch (e.status) {
          case 0:
            openErrorDialog(this.dialog);
            break;
          default:
            openCommonDialog(this.dialog, e.error);
            break;
        }
      }
    });
  }

  private deleteRequest(fund: Fund): void {
    this.fundService.delete(fund.name).subscribe({
      next: (commonResponse: CommonResponse) => {
        this.isProcessing = endProcessing(this.formGroup, this.dialog);
        openCommonDialog(this.dialog, commonResponse);
        this.getAllRequest();
      },
      error: (e) => {
        this.isProcessing = endProcessing(this.formGroup, this.dialog);
        switch (e.status) {
          case 0:
            openErrorDialog(this.dialog);
            break;
          default:
            openCommonDialog(this.dialog, e.error);
            break;
        }
      }
    });
  }
}
