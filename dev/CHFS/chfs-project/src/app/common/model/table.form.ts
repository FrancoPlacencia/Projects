import { MatTableDataSource } from "@angular/material/table";
import { TableElement } from "./table.element";

export class TableForm {

  dataSource: MatTableDataSource<any> = new MatTableDataSource<any>;
  columnsHeader: string[] = [];
  columnsContent: TableElement[] = [];

  constructor(source: any) {


    if (source) {
      this.dataSource = new MatTableDataSource(source);
      source.forEach((element: {}) => {
        var keys = Object.keys(element);
        keys.forEach(key => {
          console.log(key);
        });
      });

    }

  }

  setHeaders(headers: string[]): void {
    this.columnsHeader = headers;
  }

  setContent(content: TableElement[]): void {
    this.columnsContent = content;
  }

}
