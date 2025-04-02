import { Component, inject, OnInit } from '@angular/core';
import {
  FormArray,
  FormBuilder,
  FormControl,
  ReactiveFormsModule,
  Validators,
} from '@angular/forms';
import { RouterOutlet } from '@angular/router';

interface TestForm {
  firstName: string;
  lastName: string;
  aliases: string[];
}

@Component({
  selector: 'app-root',
  imports: [RouterOutlet, ReactiveFormsModule],
  templateUrl: './app.component.html',
  styleUrl: './app.component.scss',
})
export class AppComponent implements OnInit {
  private formBuilder = inject(FormBuilder);

  profileForm = this.formBuilder.group({
    firstName: [''],
    lastName: [''],
    aliases: this.formBuilder.array([]),
  });

  public testForm: TestForm = {
    firstName: '',
    lastName: '',
    aliases: [],
  };

  constructor() {
    this.profileForm
      .get('firstName')!
      .valueChanges.subscribe((selectedValue: any) => {
        this.testForm.firstName = selectedValue;
      });
    this.profileForm
      .get('lastName')!
      .valueChanges.subscribe((selectedValue: any) => {
        this.testForm.lastName = selectedValue;
      });
    this.profileForm
      .get('aliases')!
      .valueChanges.subscribe((selectedValue: any) => {
        this.testForm.aliases = selectedValue;
        console.log(this.profileForm.get('aliases'));
      });
  }

  ngOnInit(): void {}

  get aliases() {
    return this.profileForm.get('aliases') as FormArray;
  }

  addAlias() {
    let aliasesArray = this.profileForm.get('aliases') as FormArray;
    aliasesArray.push(this.formBuilder.control(''));
  }
}
