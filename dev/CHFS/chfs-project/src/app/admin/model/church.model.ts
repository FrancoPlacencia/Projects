import { Category } from "./category.model";

export interface Church {
  churchId?: number;
  name: string;
  denomination: string;

  address: string;
  registration: string;

  createdOn?: string;
  createdBy?: string;


  updatedOn?: string;
  updatedBy?: string;

  categories: Category[];

}