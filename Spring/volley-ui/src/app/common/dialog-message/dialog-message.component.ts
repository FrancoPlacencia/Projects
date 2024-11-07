import { Component, Inject } from '@angular/core';
import { CommonModule } from '@angular/common';

import { MatDialogModule, MAT_DIALOG_DATA, MatDialogActions, MatDialogClose, MatDialogContent, MatDialogTitle } from '@angular/material/dialog';
import { MatIconModule } from '@angular/material/icon';
import { MatProgressSpinnerModule } from '@angular/material/progress-spinner';
import { MatButtonModule } from '@angular/material/button';

import { DialogMessage } from '../model/dialog-message.model';
import { DialogMessageTypes } from '../model/dialog-message-types';

@Component({
  selector: 'app-dialog-message',
  standalone: true,
  imports: [
    CommonModule,

    MatDialogModule,
    MatDialogTitle,
    MatDialogContent,
    MatDialogActions,
    MatDialogClose,
    MatIconModule,
    MatProgressSpinnerModule,
    MatButtonModule

  ],
  templateUrl: './dialog-message.component.html',
  styleUrl: './dialog-message.component.scss'
})
export class DialogMessageComponent {

  public typeMessageClass: String;

  readonly dialogMessageTypes: typeof DialogMessageTypes = DialogMessageTypes;

  constructor(@Inject(MAT_DIALOG_DATA) public dialogMessage: DialogMessage) {
    this.typeMessageClass = this.dialogMessage.type.toLowerCase() + "-message";
  }
}

