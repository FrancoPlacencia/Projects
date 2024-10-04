import { Component } from '@angular/core';

@Component({
  selector: 'app-test',
  standalone: true,
  imports: [],
  template: `
    <div ngFor="let element of elements;
    index as i;
    first as f;
    last as l">
    	<h2>index {{i}} first{{f}} last {{l}} element {{element}}</h2>
  </div>
  `,
  styleUrl: './test.component.css'
})
export class TestComponent {
	public elements =["Elem 1", "Elem 2", "Elem N"];
}
