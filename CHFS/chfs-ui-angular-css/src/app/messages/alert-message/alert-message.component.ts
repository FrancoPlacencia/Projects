import { Component, Inject } from '@angular/core';
import {
    MAT_DIALOG_DATA,
    MatDialogActions,
    MatDialogClose,
    MatDialogContent,
    MatDialogTitle,
} from '@angular/material/dialog';
import { AlertMessage } from './alert-message.model';


@Component({
    selector: 'app-alert-message',
    standalone: true,
    imports: [
        MatDialogActions,
        MatDialogClose,
        MatDialogContent,
        MatDialogTitle,
    ],
    templateUrl: './alert-message.component.html',
    styleUrl: './alert-message.component.css'
})
export class AlertMessageComponent {

    constructor(@Inject(MAT_DIALOG_DATA) public data: AlertMessage) { }
}
