import {
  MatDialog,
  MatDialogModule,
  MatDialogRef,
} from '@angular/material/dialog';

import { DialogMessageComponent } from '../common/dialog-message/dialog-message.component';
import { DialogMessage } from '../common/model/dialog-message.model';
import { DialogMessageTypes } from '../common/model/dialog-message-types';
import { CommonResponse } from '../common/model/common-response.dto';

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
  action: string,
  element: string
): void {
  let dialogMessageTitle: string;
  let dialogMessageMessage: string;
  switch (type) {
    case DialogMessageTypes.SUCCESS:
      break;
    case DialogMessageTypes.ERROR:
      break;
  }
  let dialogMessage = new DialogMessage(
    type,
    `${action} ${element.toLowerCase()} exitosamente.`,
    ''
  );
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
  let errorTitle: string;
  let errorMessage: string;
  switch (status) {
    case 400:
      errorTitle = DialogMessageTypes.BAD_REQUEST;
      errorMessage = DialogMessageTypes.BAD_REQUEST_MESSAGE;
      break;
    case 500:
    default:
      errorTitle = DialogMessageTypes.SERVER_ERROR;
      errorMessage = DialogMessageTypes.SERVER_ERROR_MESSAGE;
      break;
  }
  let dialogMessage = new DialogMessage(
    DialogMessageTypes.ERROR,
    errorTitle,
    errorMessage
  );
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
