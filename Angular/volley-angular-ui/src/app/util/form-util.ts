import { FormGroup } from '@angular/forms';
import { MatDialog } from '@angular/material/dialog';
import { DialogMessageComponent } from '../common/dialog-message/dialog-message.component';
import { DialogMessageTypes } from '../common/model/dialog-message-types';
import { DialogMessage } from '../common/model/dialog-message.model';

/**
 * Disable the form to start the process
 * Open a MatDialog to display a loading message to the user
 * Returns a true to be used as a flag for proccessing
 * @param formGroup
 * @param dialog
 * @returns true
 */
export function startProcessing(
  formGroup: FormGroup | undefined,
  dialog: MatDialog
): boolean {
  if (formGroup) {
    formGroup.disable();
  }
  dialog.open(
    DialogMessageComponent,
    new DialogMessage(
      DialogMessageTypes.LOADING,
      DialogMessageTypes.LOADING_TITLE,
      DialogMessageTypes.LOADING_REQUEST_MESSAGE
    ).getDialogJson()
  );
  return true;
}

/**
 * Disable the form to start the process
 * Closes the loading MatDialog
 * Returns a false to be used as a flag for proccessing
 * @param formGroup
 * @param dialog
 * @returns
 */
export function endProcessing(
  formGroup: FormGroup | undefined,
  dialog: MatDialog
): boolean {
  if (formGroup) {
    formGroup.enable();
  }
  dialog.closeAll();
  return false;
}

/**
 * Reset the form iterating the controls of the form.
 * @param formGroup
 */
export function resetFormGroup(formGroup: FormGroup): void {
  formGroup.markAsPending();
  formGroup.markAsPristine();
  formGroup.reset();
}
