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

import { Church } from '../../model/church.model';
import { ChurchService } from '../../services/church.service';
import { CommonResponse } from '../../../common/model/dto/common-response.dto';

import { openCommonDialog, openConfirmDialog, openDialog, openErrorDialog } from '../../../common/Utils/MessageUtil';
import { endProcessing, resetFormGroup, startProcessing } from '../../../common/Utils/FormUtil';
import { Category } from '../../model/category.model';
import { MatListModule } from '@angular/material/list';



@Component({
  selector: 'app-church',
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
    MatListModule,

    DatePipe
  ],
  templateUrl: './church.component.html',
  styleUrl: '../../admin.component.scss'
})
export class ChurchComponent {

  // Flags
  public tableLoaded: boolean = false;
  public isProcessing: boolean = false;
  public isNew: boolean = true;

  // Table Data
  public columnsHeader: string[] = ['church', 'legal', 'created', 'updated', 'action'];
  public dataSource: MatTableDataSource<any> | undefined;
  public errorMessage: string = '';

  // Form Data
  public formGroup: FormGroup;
  public categories: Category[] = [];


  private church: Church;

  constructor(
    private churchService: ChurchService,
    private formBuilder: FormBuilder,
    private dialog: MatDialog,
  ) {

    this.church = {
      name: '',
      denomination: '',
      address: '',
      registration: '',
      categories: []
    };

    this.formGroup = this.formBuilder.group({
      name: [this.church.name, Validators.required],
      denomination: [this.church.denomination, Validators.required],
      address: [this.church.address, Validators.required],
      registration: [this.church.registration, Validators.required]
    });

    this.formGroup.get("name")!.valueChanges.subscribe(selectedValue => {
      this.church.name = selectedValue;
    });

    this.formGroup.get("denomination")!.valueChanges.subscribe(selectedValue => {
      this.church.denomination = selectedValue;
    });

    this.formGroup.get("address")!.valueChanges.subscribe(selectedValue => {
      this.church.address = selectedValue;
    });

    this.formGroup.get("registration")!.valueChanges.subscribe(selectedValue => {
      this.church.registration = selectedValue;
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

  public edit(church: Church): void {
    this.isNew = false;
    this.church.churchId = church.churchId;
    this.formGroup.get("name")?.setValue(church.name);
    this.formGroup.get("denomination")?.setValue(church.denomination);
    this.formGroup.get("address")?.setValue(church.address);
    this.formGroup.get("registration")?.setValue(church.registration);
  }

  public reset(): void {
    resetFormGroup(this.formGroup);
    this.isNew = true;
  }

  public submit(): void {
    this.formGroup.markAllAsTouched();
    if (this.formGroup.status === "VALID") {
      this.isProcessing = startProcessing(this.formGroup, this.dialog);
      console.log(this.church);
      this.isNew ? this.createRequest() : this.updateRequest();
    }
  }

  public delete(church: Church): void {
    if (church) {
      const dialogRef = openConfirmDialog(this.dialog);
      dialogRef.afterClosed().subscribe(result => {
        if (result) {
          this.isProcessing = startProcessing(this.formGroup, this.dialog);
          this.deleteRequest(church);
        }
      });
    }
  }

  // ======================================================
  // HTTP REQUEST
  // ======================================================
  private createRequest(): void {
    this.churchService.createChurch(this.church).subscribe({
      next: (commonResponse: CommonResponse) => {
        this.isProcessing = endProcessing(this.formGroup, this.dialog);
        resetFormGroup(this.formGroup!);
        openCommonDialog(this.dialog, commonResponse);
        this.getAllRequest();
        this.isNew = true;
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
    this.churchService.getChurches().subscribe({
      next: (churchList: Church[]) => {
        if (churchList) {
          console.log(churchList);
          this.dataSource = new MatTableDataSource(churchList);
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
    this.churchService.updateChurch(this.church).subscribe({
      next: (commonResponse: CommonResponse) => {
        this.isProcessing = endProcessing(this.formGroup, this.dialog);
        resetFormGroup(this.formGroup!);
        openCommonDialog(this.dialog, commonResponse);
        this.getAllRequest();
        this.isNew = true;
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

  private deleteRequest(church: Church): void {
    this.churchService.deleteChurch(church.name).subscribe({
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
