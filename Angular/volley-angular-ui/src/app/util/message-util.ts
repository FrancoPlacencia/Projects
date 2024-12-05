import {
  MatDialog,
  MatDialogModule,
  MatDialogRef,
} from '@angular/material/dialog';
import { DialogMessage } from '../common/model/dialog-message.model';
import { DialogMessageComponent } from '../common/dialog-message/dialog-message.component';
import { DialogMessageTypes } from '../common/model/dialog-message-types';

/**
 * Custom Dialog message
 * @param dialog
 * @param dialogMessage
 * @returns
 */
export function openDialogMessage(
  dialog: MatDialog,
  dialogMessage: DialogMessage
): MatDialogRef<any> {
  return dialog.open(DialogMessageComponent, dialogMessage.getDialogJson());
}

/**
 * Common Response Dialog Message
 * @param dialog
 * @param commonResponse
 */
export function openDialog(
  dialog: MatDialog,
  type: string,
  message: string
): void {
  let dialogMessage = new DialogMessage(type, message, '');
  openDialogMessage(dialog, dialogMessage);
}

/**
 * Generic Error Dialog Message
 * @param dialog
 * @returns
 */
export function openErrorDialog(
  dialog: MatDialog,
  status: number,
  message: string
): MatDialogRef<any> {
  let errorType: string = '';
  let errorTitle: string;
  let errorMessage: string;

  switch (status) {
    case 400:
      errorType: DialogMessageTypes.WARNING;
      errorTitle = DialogMessageTypes.BAD_REQUEST;
      errorMessage = DialogMessageTypes.BAD_REQUEST_MESSAGE;
      break;
    case 409:
      errorType: DialogMessageTypes.WARNING;
      errorTitle = DialogMessageTypes.CONFLICT;
      errorMessage = message;
      break;
    case 500:
    default:
      errorType: DialogMessageTypes.ERROR;
      errorTitle = DialogMessageTypes.SERVER_ERROR;
      errorMessage = DialogMessageTypes.SERVER_ERROR_MESSAGE;
      break;
  }
  let dialogMessage = new DialogMessage(errorType, errorTitle, errorMessage);
  return openDialogMessage(dialog, dialogMessage);
}

/**
 * Generic Confirmation Dialog Message
 * @param dialog
 * @returns
 */
export function openConfirmDialog(
  dialog: MatDialog,
  action: string,
  element: string
): MatDialogRef<any> {
  let dialogMessage = new DialogMessage(
    DialogMessageTypes.CONFIRM,
    `¿${action} ${element}?`,
    DialogMessageTypes.DELETE_MESSAGE
  );
  return openDialogMessage(dialog, dialogMessage);
}

export function openLoadingDialog(dialog: MatDialog) {
  let dialogMessage = new DialogMessage(
    DialogMessageTypes.LOADING,
    DialogMessageTypes.LOADING_TITLE,
    DialogMessageTypes.LOADING_DATA_MESSAGE
  );
  return openDialogMessage(dialog, dialogMessage);
}
