import { User } from "../auth/model/user.model";
import { Church } from "./model/church.model";

import { TableUser } from "./model/dto/table-user.dto";
import { TableChurch } from "./model/dto/table-church.dto";


export function generateTableUser(users: User[]): TableUser[] {
  let listUsers: TableUser[] = [];
  users.forEach(user => {
    let listUser: TableUser = {
      firstName: user.firstName!,
      lastName: user.lastName!,
      email: user.email,
      title: user.title!,
      createdOn: user.createdOn!,
    };
    listUsers.push(listUser);
  });
  return listUsers;
}

export function generateTableChurch(churches: Church[]): TableChurch[] {
  let tableChurch: TableChurch[] = [];
  churches.forEach(church => {
    let listUser: TableChurch = {
      id: church.churchId!,
      name: church.name!,
      denomination: church.denomination!,
      address: church.address!,
      createdOn: church.createdOn!
    };
    tableChurch.push(listUser);
  });
  return tableChurch;
}

