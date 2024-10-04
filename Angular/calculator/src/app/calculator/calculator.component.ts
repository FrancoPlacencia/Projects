import { Component } from '@angular/core';

@Component({
    selector: 'app-calculator',
    standalone: true,
    imports: [],
    templateUrl: './calculator.component.html',
    styleUrl: './calculator.component.css'
})
export class CalculatorComponent {
    public numberBtnClass = "btn w-100 btn-secondary btn-lg";
    public operationBtnClass = "btn w-100 btn-danger btn-lg";
    public equalsBtnClass = "btn w-100 btn-primary btn-lg";
    public clearBtnClass = "btn w-100 btn-warning btn-lg";


    public equationHistory = "";


    public equation = "";


    // a operation b =>
    public operation = "";

    public aValue = "";
    public bValue = "";

    public aNumber = 0;
    public bNumber = 0;

    btnNumber(number: any) {
        if (this.operation === "") {
            this.aValue += number;
        } else {
            this.bValue += number;
        }
        this.validateNumbers();
        this.updateDisplayEquation();
    }

    btnOperation(operation: string) {
        if (this.operation === "") {
            this.operation = operation;
        } else {
            this.makeOperation();
            this.operation = operation;
        }
        this.updateDisplayEquation();
    }


    btnClear() {
        this.aValue = "";
        this.operation = "";
        this.bValue = "";
        this.equation = "";
        this.equationHistory = "";
    }

    btnDelete() {
        if (this.bValue !== "") {
            console.log("bVal del");
            this.bValue = this.bValue.slice(0, -1);
        } else {
            if (this.operation !== "") {
                console.log("ope del");
                this.operation = "";
            } else {
                console.log("aVal del");
                this.aValue = this.aValue.slice(0, -1);
            }
        }
        this.updateDisplayEquation();
    }

    btnEquals() {
        this.makeOperation();
        this.updateDisplayEquation();
    }

    validateNumbers() {

        return true;
    }

    updateDisplayEquation() {
        this.equation = this.aValue + this.operation + this.bValue;
    }

    makeOperation() {
        if (this.validateNumbers()) {
            this.equationHistory = this.aValue + this.operation + this.bValue;
            switch (this.operation) {
                case "+":
                    this.aValue = (Number(this.aValue) + Number(this.bValue)).toString();
                    this.operation = "";
                    this.bValue = "";
                    break;
                case "-":
                    this.aValue = (Number(this.aValue) - Number(this.bValue)).toString();
                    this.operation = "";
                    this.bValue = "";
                    break;
                case "x":
                    this.aValue = (Number(this.aValue) * Number(this.bValue)).toString();
                    this.operation = "";
                    this.bValue = "";
                    break;
                case "/":
                    this.aValue = (Number(this.aValue) / Number(this.bValue)).toString();
                    this.operation = "";
                    this.bValue = "";
                    break;
                case "%":
                    this.aValue = (Number(this.aValue) % Number(this.bValue)).toString();
                    this.operation = "";
                    this.bValue = "";
                    break;
            }
        } else {
            this.equation = "ERROR";
        }
    }


}
