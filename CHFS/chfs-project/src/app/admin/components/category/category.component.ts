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
import { MatSelectModule } from '@angular/material/select';

import { Category } from '../../model/category.model';
import { CategoryService } from '../../services/category.service';
import { CommonResponse } from '../../../common/model/dto/common-response.dto';

import { openCommonDialog, openConfirmDialog, openErrorDialog } from '../../../common/Utils/MessageUtil';
import { endProcessing, resetFormGroup, startProcessing } from '../../../common/Utils/FormUtil';
import { Church } from '../../model/church.model';
import { Fund } from '../../model/fund.model';
import { FundService } from '../../services/fund.service';
import { ChurchService } from '../../services/church.service';
import { SelectOption } from '../../../common/model/select-option.form';
import { ChurchOption } from '../../model/dto/church-option.dto';
import { FundOption } from '../../model/dto/fund-option.dto';


@Component({
  selector: 'app-category',
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
    MatSelectModule,

    DatePipe
  ],
  templateUrl: './category.component.html',
  styleUrl: '../../admin.component.scss'
})
export class CategoryComponent {

  // Load Flags
  public tableLoaded: boolean = false;
  public isProcessing: boolean = false;
  public isNew: boolean = true;

  // Table Data
  public columnsHeader: string[] = ['category', 'church', 'fund', 'action'];
  public dataSource: MatTableDataSource<any> | undefined;
  public errorMessage: string = '';

  // Form Data
  public formGroup: FormGroup;


  public churches = new Map<number, ChurchOption>;
  public churchOptions: SelectOption[] = [];

  public funds = new Map<number, Fund>;
  public fundOptions: SelectOption[] = [];

  public category: Category;

  constructor(
    private categoryService: CategoryService,
    private churchService: ChurchService,
    private fundService: FundService,

    private formBuilder: FormBuilder,
    private dialog: MatDialog
  ) {
    this.category = {

      name: 'Category901234567890123456789012345678901234567890',
      description: 'Category901234567890123456789012345678901234567890Category901234567890123456789012345678901234567890',
    }

    this.formGroup = this.formBuilder.group({
      name: [this.category.name, Validators.required],
      description: [this.category.description, Validators.required],
      church: ['', Validators.required],
      fund: ['', Validators.required]
    });

    this.formGroup.get("name")!.valueChanges.subscribe(selectedValue => {
      this.category.name = selectedValue;
    });

    this.formGroup.get("description")!.valueChanges.subscribe(selectedValue => {
      this.category.description = selectedValue;
    });

    this.getAllRequest();
    this.getAllChurchesRequest();
    this.getAllFundsRequest();
  }

  // PUBLIC METHODS
  public applyFilter(event: Event): void {
    const filterValue = (event.target as HTMLInputElement).value;
    if (this.dataSource) {
      this.dataSource.filter = filterValue.trim().toLowerCase();
    }
  }

  public edit(category: Category): void {
    this.isNew = false;
    this.category.id = category.id;
    this.formGroup.get("name")?.setValue(category.name);
    this.formGroup.get("description")?.setValue(category.description);
    this.formGroup.get("church")?.setValue(category.church?.churchId);
    this.formGroup.get("fund")?.setValue(category.fund?.fundId);
  }

  public submit(): void {
    this.formGroup.markAllAsTouched();
    if (this.formGroup.status === "VALID") {
      this.isProcessing = startProcessing(this.formGroup, this.dialog);

      this.category.church = this.churches.get(this.formGroup.get("church")!.value);
      this.category.fund = this.funds.get(this.formGroup.get("fund")!.value);
      this.isNew ? this.createRequest() : this.updateRequest();
    }
  }

  public delete(category: Category): void {
    if (category) {
      const dialogRef = openConfirmDialog(this.dialog);
      dialogRef.afterClosed().subscribe(result => {
        if (result) {
          this.isProcessing = startProcessing(this.formGroup, this.dialog);
          this.deleteRequest(category);
        }
      });
    }
  }

  // ======================================================
  // HTTP REQUEST
  // ======================================================
  private createRequest(): void {
    console.log(this.category)
    this.categoryService.create(this.category).subscribe({
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
    this.categoryService.getAll().subscribe({
      next: (categoryList: Category[]) => {
        if (categoryList) {
          console.log(categoryList);
          this.dataSource = new MatTableDataSource(categoryList);
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
    console.log(this.category);
    this.isProcessing = startProcessing(this.formGroup, this.dialog);
    this.categoryService.update(this.category).subscribe({
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

  private deleteRequest(category: Category): void {
    this.categoryService.delete(category.name).subscribe({
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

  private getAllChurchesRequest(): void {
    this.churchService.getChurchOptions().subscribe({
      next: (churches: ChurchOption[]) => {
        if (churches) {
          churches.forEach((church) => {
            this.churches.set(church.churchId, church);

            let option: SelectOption = {
              value: church.churchId,
              displayValue: church.name
            }
            this.churchOptions.push(option);
          });
        }
      },
      error: (e: any) => {
        let option: SelectOption = {
          value: 0,
          displayValue: "Unable to load the options"
        }
        this.churchOptions.push(option);
      }
    });
  }

  private getAllFundsRequest(): void {
    this.fundService.getAll().subscribe({
      next: (funds: Fund[]) => {
        if (funds) {

          funds.forEach((fund) => {
            this.funds.set(fund.fundId!, fund);

            let option: SelectOption = {
              value: fund.fundId!,
              displayValue: fund.name
            }
            this.fundOptions.push(option);
          });
        }
      },
      error: (e: any) => {
        let option: SelectOption = {
          value: 0,
          displayValue: "Unable to load the options"
        }
        this.churchOptions.push(option);
      }
    });
  }
}
