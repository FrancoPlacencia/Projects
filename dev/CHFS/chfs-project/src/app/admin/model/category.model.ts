import { Church } from "./church.model";
import { ChurchOption } from "./dto/church-option.dto";
import { FundOption } from "./dto/fund-option.dto";
import { Fund } from "./fund.model";

export interface Category {
  id?: number,
  name: string,
  description: string,

  createdBy?: string,
  createdOn?: string,

  updatedBy?: string,
  updatedOn?: string,

  church?: Church | ChurchOption,
  fund?: Fund | FundOption,

}
