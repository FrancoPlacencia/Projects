import { MatTableDataSource } from "@angular/material/table";

export class TableElement {

  columnDef: string;
  columnTitle: string;
  type: string;


  constructor(content: any, columnDef: string, columnTitle: string, type: string) {
    this.columnDef = columnDef;
    this.columnTitle = columnTitle;
    this.type = type;
  }


  private headerTitle() {
    const text = 'helloThereMister';
    const result = text.replace(/([A-Z])/g, " $1");
    const finalResult = result.charAt(0).toUpperCase() + result.slice(1);
    console.log(finalResult);
  }

}
