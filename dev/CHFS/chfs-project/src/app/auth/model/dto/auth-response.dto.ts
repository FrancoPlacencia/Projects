import { CommonResponse } from "../../../common/model/dto/common-response.dto";

export interface AuthResponse extends CommonResponse {
  token: string;
}
