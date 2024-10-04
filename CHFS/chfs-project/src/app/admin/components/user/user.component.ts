import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ActivatedRoute, Router } from '@angular/router';
import { FormBuilder, FormGroup, FormsModule, ReactiveFormsModule, Validators } from '@angular/forms';

// @angular/material
import { MatGridListModule } from '@angular/material/grid-list';
import { MatCardModule } from '@angular/material/card';
import { MatDialog } from '@angular/material/dialog';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatInputModule } from '@angular/material/input';
import { MatDividerModule } from '@angular/material/divider';
import { MatIconModule } from '@angular/material/icon';
import { MatButtonModule } from '@angular/material/button';
import { MatSelectModule } from '@angular/material/select';
import { MatExpansionModule } from '@angular/material/expansion';
import { MatListModule } from '@angular/material/list';

import { UserService } from '../../services/user.service';
import { ChurchService } from '../../services/church.service';

import { User } from '../../../auth/model/user.model';

import { openDialog } from '../../../common/Utils/MessageUtil';
import { endProcessing, startProcessing } from '../../../common/Utils/FormUtil';
import { phoneValidator } from '../../../auth/AuthUtil';

import { SelectOption } from '../../../common/model/select-option.form';
import { DialogMessageTypes } from '../../../common/model/dialog-message-types';
import { DialogMessage } from '../../../common/model/dialog-message.model';
import { Permissions } from '../../model/permission.model';
import { CommonResponse } from '../../../common/model/dto/common-response.dto';

import { ChurchOption } from '../../model/dto/church-option.dto';
import { Church } from '../../model/church.model';
import { MatChipsModule } from '@angular/material/chips';


@Component({
  selector: 'app-user',
  standalone: true,
  imports: [
    CommonModule,
    FormsModule,
    ReactiveFormsModule,

    MatGridListModule,
    MatCardModule,
    MatFormFieldModule,
    MatInputModule,
    MatDividerModule,
    MatIconModule,
    MatButtonModule,
    MatSelectModule,
    MatExpansionModule,
    MatListModule,
    MatChipsModule
  ],
  templateUrl: './user.component.html',
  styleUrl: '../../admin.component.scss'
})
export class UserComponent {

  public userId: number = 0;

  public bioLength: number = 0;
  public formGroup: FormGroup | undefined;
  public churchFormGroup: FormGroup;
  public dataLoaded: boolean = false;

  private param: string | undefined;
  public user: User | undefined;

  public churches = new Map<number, ChurchOption>;
  public churchOptions: SelectOption[] = [];

  public userChurches: Church[] = [];
  public addChurchId: number = 0;

  public titleOptions: SelectOption[] = [
    { value: 'pastor', displayValue: 'Pastor' },
    { value: 'treasurer', displayValue: 'Treasurer' },
    { value: 'secretary', displayValue: 'Secretary' }
  ];

  public activeOptions: SelectOption[] = [
    { value: true, displayValue: 'Active', icon: 'check_circle_outline' },
    { value: false, displayValue: 'Inactive', icon: 'unpublished' }
  ];

  public lockedOptions: SelectOption[] = [
    { value: true, displayValue: 'Locked', icon: 'lock' },
    { value: false, displayValue: 'Unlocked', icon: 'lock_open' }
  ];

  public roleOptions: SelectOption[] = [
    { value: 'USER', displayValue: 'User', icon: 'person' },
    { value: 'ADMIN', displayValue: 'Admin', icon: 'manage_accounts' }
  ];

  constructor(
    private userService: UserService,
    private churchService: ChurchService,
    private activatedRoute: ActivatedRoute,
    private formBuilder: FormBuilder,
    private dialog: MatDialog,
    private router: Router
  ) {

    this.churchFormGroup = this.formBuilder.group({
      church: ['', Validators.required]
    });
    this.churchFormGroup.get("church")!.valueChanges.subscribe(selectedValue => {
      this.addChurchId = selectedValue;
    });

    this.activatedRoute.queryParams.subscribe(params => {
      this.param = params['email'];
      this.setUser();
    });
  }

  public updateBio(): void {
    this.bioLength = this.formGroup!.value['bio'].length;
  }

  public addChurch(): void {
    let permission: Permissions = {
      userId: this.user?.userId!,
      churchId: this.addChurchId
    };
    console.log(permission);
    if (this.churchFormGroup!.status === "VALID") {
      startProcessing(this.formGroup, this.dialog);
      this.churchService.addPermission(permission).subscribe({
        next: (commonResponse: CommonResponse) => {
          this.getMissingChurches(this.user?.userId!);
          endProcessing(this.formGroup, this.dialog);
          let dialogMessage = new DialogMessage(commonResponse.responseType, commonResponse.responseTitle, commonResponse.responseMessage);
          openDialog(this.dialog, dialogMessage);
        },
        error: (e) => {
          debugger;
          let dialogMessage;
          switch (e.status) {
            case 0:
              dialogMessage = new DialogMessage(DialogMessageTypes.ERROR, DialogMessageTypes.SERVER_ERROR, DialogMessageTypes.SERVER_ERROR_MESSAGE);
              openDialog(this.dialog, dialogMessage);
              break;
            default:
              dialogMessage = new DialogMessage(e.error.type, e.error.title, e.error.message)
              openDialog(this.dialog, dialogMessage);
              break;
          }
        }
      });
    }
  }

  public removeChurch(churchId: number): void {
    console.log("remove " + churchId);
  }

  public submit(): void {
    if (this.user) {
      startProcessing(this.formGroup, this.dialog);
      console.log('updating user');
      this.userService.update(this.user!).subscribe({
        next: (commonResponse: CommonResponse) => {
          endProcessing(this.formGroup, this.dialog);
          let dialogMessage = new DialogMessage(commonResponse.responseType, commonResponse.responseTitle, commonResponse.responseMessage);
          openDialog(this.dialog, dialogMessage);
        },
        error: (e) => {
          debugger;
          let dialogMessage;
          switch (e.status) {
            case 0:
              dialogMessage = new DialogMessage(DialogMessageTypes.ERROR, DialogMessageTypes.SERVER_ERROR, DialogMessageTypes.SERVER_ERROR_MESSAGE);
              openDialog(this.dialog, dialogMessage);
              break;
            default:
              dialogMessage = new DialogMessage(e.error.type, e.error.title, e.error.message)
              openDialog(this.dialog, dialogMessage);
              break;
          }
        }
      });
    }
  }

  private setUser(): void {
    if (this.param) {
      this.userService.get(this.param!).subscribe({
        next: (user: User) => {
          this.user = user;
          this.userChurches = this.user?.churches!;

          this.getMissingChurches(this.user.userId!);
          this.setUserFormGroup();

          this.dataLoaded = true;
        },
        error: (e) => {
          let dialogMessage;
          switch (e.status) {
            case 0:
              dialogMessage = new DialogMessage(DialogMessageTypes.ERROR, DialogMessageTypes.SERVER_ERROR, DialogMessageTypes.SERVER_ERROR_MESSAGE);
              openDialog(this.dialog, dialogMessage);
              break;
            default:
              dialogMessage = new DialogMessage(e.error.responseType, e.error.responseTitle, e.error.responseMessage);
              openDialog(this.dialog, dialogMessage);
              break;
          }
        }
      });
    }
  }

  private setUserFormGroup(): void {
    this.formGroup = this.formBuilder.group({
      email: [this.user!.email, Validators.required],
      firstName: [this.user!.firstName, Validators.required],
      lastName: [this.user!.lastName, Validators.required],

      phone: [this.user!.phone, [Validators.required, phoneValidator()]],
      address: [this.user!.address, Validators.required],
      title: [this.user!.title, Validators.required],
      bio: [this.user!.bio, Validators.required],

      role: [this.user!.role, Validators.required],
      isActive: [this.user!.isActive, Validators.required],
      isLocked: [this.user!.isLocked, Validators.required],
    });

    this.formGroup.controls['email'].setValue(this.user!.email);
    this.formGroup.controls['email'].disable();

    this.formGroup.controls['firstName'].setValue(this.user!.firstName);
    this.formGroup.get("firstName")!.valueChanges.subscribe(selectedValue => {
      this.user!.firstName = selectedValue;
    });

    this.formGroup.controls['lastName'].setValue(this.user!.lastName);
    this.formGroup.get("lastName")!.valueChanges.subscribe(selectedValue => {
      this.user!.lastName = selectedValue;
    });

    this.formGroup.controls['phone'].setValue(this.user!.phone);
    this.formGroup.get("phone")!.valueChanges.subscribe(selectedValue => {
      this.user!.phone = selectedValue;
    });

    this.formGroup.controls['title'].setValue(this.user!.title);
    this.formGroup.get("title")!.valueChanges.subscribe(selectedValue => {
      this.user!.title = selectedValue;
    });

    this.formGroup.controls['address'].setValue(this.user!.address);
    this.formGroup.get("address")!.valueChanges.subscribe(selectedValue => {
      this.user!.address = selectedValue;
    });

    this.formGroup.controls['bio'].setValue(this.user!.bio);
    this.formGroup.get("bio")!.valueChanges.subscribe(selectedValue => {
      this.user!.bio = selectedValue;
    });

    this.formGroup.controls['role'].setValue(this.user!.role);
    this.formGroup.get("role")!.valueChanges.subscribe(selectedValue => {
      this.user!.role = selectedValue;
    });

    this.formGroup.controls['isActive'].setValue(this.user!.isActive);
    this.formGroup.get("isActive")!.valueChanges.subscribe(selectedValue => {
      this.user!.isActive = selectedValue;
    });
    this.formGroup.controls['isLocked'].setValue(this.user!.isLocked);
    this.formGroup.get("isLocked")!.valueChanges.subscribe(selectedValue => {
      this.user!.isLocked = selectedValue;
    });

    this.userId = this.user!.userId!;
    this.updateBio();
  }

  private getMissingChurches(userId: number): void {
    this.churchService.getChurchMissingByUser(userId).subscribe({
      next: (churches: ChurchOption[]) => {
        console.log("MissingOptions");
        console.log(churches);
        if (churches) {
          if (churches.length == 0) {
            this.churchFormGroup.controls['church'].disable();
          } else {
            churches.forEach((church) => {
              this.churches.set(church.churchId, church);
              let option: SelectOption = {
                value: church.churchId,
                displayValue: church.name
              }
              this.churchOptions.push(option);
            });
          }
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