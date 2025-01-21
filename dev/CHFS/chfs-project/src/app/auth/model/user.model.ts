import { Church } from "../../admin/model/church.model";
import { CommonResponse } from "../../common/model/dto/common-response.dto";
import { PasswordValidator } from "./password-validator.model";

/**
 * User information
  */
export interface User extends CommonResponse {

  // ID
  userId?: number;

  // Auth Info
  email: string;
  password?: string;
  rePassword?: string;
  role?: string;

  // Basic Info
  firstName?: string;
  lastName?: string;
  address?: string;
  phone?: string;
  title?: string;
  bio?: string;


  // Special Info  
  token?: string;
  passwordValidator?: PasswordValidator;

  // Admin Info
  isActive?: boolean;
  createdOn?: string;
  isLocked?: boolean;

  churches?: Church[];

}
