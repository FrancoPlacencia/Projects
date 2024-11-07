
import { CommonResponse } from '../common/model/common-response.dto';
import { DialogMessageTypes } from '../common/model/dialog-message-types';

export function successResponse(element: string, action: string): CommonResponse {
  return {
    responseType: DialogMessageTypes.SUCCESS,
    responseTitle: action,
    responseMessage: `${element} ${element.toLowerCase()} exitosamente.`
  };

}
