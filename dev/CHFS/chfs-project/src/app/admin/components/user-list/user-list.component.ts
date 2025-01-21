import { AfterViewInit, Component, ViewChild } from '@angular/core';
import { Router, RouterLink } from '@angular/router';
import { CommonModule, DatePipe } from '@angular/common';

import { MatTableDataSource, MatTableModule } from '@angular/material/table';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatButtonModule } from '@angular/material/button';
import { MatInputModule } from '@angular/material/input';
import { MatPaginator, MatPaginatorModule } from '@angular/material/paginator';


import { UserService } from '../../services/user.service';
import { User } from '../../../auth/model/user.model';

import { generateTableUser } from '../../AdminUtil';
import { TableUser } from '../../model/dto/table-user.dto';
import { MatSort } from '@angular/material/sort';
import { MatIconModule } from '@angular/material/icon';
import { DialogMessage } from '../../../common/model/dialog-message.model';
import { DialogMessageTypes } from '../../../common/model/dialog-message-types';
import { openDialog } from '../../../common/Utils/MessageUtil';
import { endProcessing, startProcessing } from '../../../common/Utils/FormUtil';
import { MatDialog } from '@angular/material/dialog';
import { CommonResponse } from '../../../common/model/dto/common-response.dto';


@Component({
  selector: 'app-user-list',
  standalone: true,
  imports: [
    CommonModule,
    RouterLink,

    MatTableModule,
    MatButtonModule,
    MatFormFieldModule,
    MatInputModule,
    MatPaginatorModule,
    MatIconModule,

    DatePipe
  ],
  templateUrl: './user-list.component.html',
  styleUrl: '../../admin.component.scss'
})
export class UserListComponent {

  @ViewChild(MatPaginator) paginator!: MatPaginator;

  @ViewChild(MatSort) sort!: MatSort;

  public dataSource!: MatTableDataSource<TableUser>;

  public dataLoaded: boolean = false;

  public columnsHeader: string[] = ['user', 'title', 'createdOn', 'action'];

  public isProcessing: boolean = false;

  constructor(
    private userService: UserService,
    private router: Router,
    private dialog: MatDialog
  ) {
    this.getData();
  }

  public applyFilter(event: Event): void {
    const filterValue = (event.target as HTMLInputElement).value;
    this.dataSource.filter = filterValue.trim().toLowerCase();
  }

  public delete(user: User): void {
    if (user) {
      let dialogMessage = new DialogMessage(DialogMessageTypes.CONFIRM, DialogMessageTypes.SERVER_ERROR, DialogMessageTypes.SERVER_ERROR_MESSAGE);
      const dialogRef = openDialog(this.dialog, dialogMessage);
      dialogRef.afterClosed().subscribe(result => {
        if (result) {
          this.isProcessing = startProcessing(undefined, this.dialog);
          this.deleteAPI(user);
        }
      });
    }
  }

  private getData() {
    this.dataLoaded = false;
    this.userService.getAll().subscribe(users => {
      this.dataSource = new MatTableDataSource(generateTableUser(users));
      this.dataLoaded = true;
    });
  }

  private deleteAPI(user: User): void {
    this.userService.delete(user!.email!).subscribe({
      next: (commonResponse: CommonResponse) => {
        debugger;
        let dialogMessage = new DialogMessage(commonResponse.responseType, commonResponse.responseTitle, commonResponse.responseMessage)
        const dialogRef = openDialog(this.dialog, dialogMessage);
        dialogRef.afterClosed().subscribe(result => {
          this.isProcessing = endProcessing(undefined, this.dialog);
          this.getData();
        });

      },
      error: (e) => {
        endProcessing(undefined, this.dialog);
        let dialogMessage;
        switch (e.status) {
          case 0:
            dialogMessage = new DialogMessage(DialogMessageTypes.ERROR, DialogMessageTypes.SERVER_ERROR, DialogMessageTypes.SERVER_ERROR_MESSAGE);
            openDialog(this.dialog, dialogMessage);
            break;
          default:
            if (e.error) {
              dialogMessage = new DialogMessage(e.error.type, e.error.title, e.error.message)
              openDialog(this.dialog, dialogMessage);
            } else {
              dialogMessage = new DialogMessage(DialogMessageTypes.ERROR, DialogMessageTypes.SERVER_ERROR, DialogMessageTypes.SERVER_ERROR_MESSAGE);
              openDialog(this.dialog, dialogMessage);
            }
            break;
        }
      }
    });
  }


}
