import { Component } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { FormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';
import { FaIconLibrary, FontAwesomeModule } from '@fortawesome/angular-fontawesome';
import { faSpinner } from '@fortawesome/free-solid-svg-icons';

@Component({
    selector: 'app-root',
    standalone: true,
    imports: [
        RouterOutlet, FormsModule, HttpClientModule, FontAwesomeModule
    ],
    providers: [
        HttpClientModule
    ],
    templateUrl: './app.component.html',
    styleUrl: './app.component.css'
})
export class AppComponent {
    constructor(library: FaIconLibrary) {
        library.addIcons(faSpinner);
    }

}
