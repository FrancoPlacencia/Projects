import { MatDialog, MatDialogModule, MatDialogRef } from '@angular/material/dialog';

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
export function openDialog(dialog: MatDialog, dialogMessage: DialogMessage): MatDialogRef<any> {
  return dialog.open(DialogMessageComponent, dialogMessage.getDialogJson());
}

/**
 * Common Response Dialog Message
 * @param dialog
 * @param commonResponse
 */
export function openCommonDialog(dialog: MatDialog, commonResponse: CommonResponse): void {
  if (commonResponse) {
    let dialogMessage = new DialogMessage(commonResponse.responseType, commonResponse.responseTitle, commonResponse.responseMessage)
    openDialog(dialog, dialogMessage);
  } else {
    openErrorDialog(dialog);
  }
}

/**
 * Generic Error Dialog Message
 * @param dialog
 * @returns
 */
export function openErrorDialog(dialog: MatDialog): MatDialogRef<any> {
  let dialogMessage = new DialogMessage(DialogMessageTypes.ERROR, DialogMessageTypes.SERVER_ERROR, DialogMessageTypes.SERVER_ERROR_MESSAGE);
  return dialog.open(DialogMessageComponent, dialogMessage.getDialogJson());
}

/**
 * Generic Confirmation Dialog Message
 * @param dialog
 * @returns
 */
export function openConfirmDialog(dialog: MatDialog): MatDialogRef<any> {
  let dialogMessage = new DialogMessage(DialogMessageTypes.CONFIRM, DialogMessageTypes.CONFIRM_TITLE, DialogMessageTypes.DELETE_MESSAGE);
  return dialog.open(DialogMessageComponent, dialogMessage.getDialogJson());
}

export function openLoadingDialog(dialog: MatDialog) {
  let dialogMessage = new DialogMessage(DialogMessageTypes.LOADING, DialogMessageTypes.LOADING_TITLE, DialogMessageTypes.LOADING_DATA_MESSAGE);
  return dialog.open(DialogMessageComponent, dialogMessage.getDialogJson());
}

