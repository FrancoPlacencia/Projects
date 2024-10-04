import { HttpClientModule } from '@angular/common/http';
import { Component } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { RouterOutlet } from '@angular/router';
import { FaIconLibrary, FontAwesomeModule } from '@fortawesome/angular-fontawesome';
import { faSpinner } from '@fortawesome/free-solid-svg-icons';

@Component({
    selector: 'app-root',
    standalone: true,
    imports: [
        RouterOutlet,
        FormsModule,
        HttpClientModule,
        FontAwesomeModule
    ],
    providers: [
        HttpClientModule
    ],
    templateUrl: './app.component.html',
    styleUrl: './app.component.scss'
})
export class AppComponent {
    title = 'chfs-project';

    constructor(library: FaIconLibrary) {
        library.addIcons(faSpinner);
    }
}
