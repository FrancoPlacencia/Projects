import { Component } from '@angular/core';
import { MatCardModule } from '@angular/material/card';
import { MatDividerModule } from '@angular/material/divider';
import { LogoComponent } from '../logo/logo.component';

@Component({
    selector: 'app-not-found',
    imports: [
        MatCardModule,
        MatDividerModule,
        LogoComponent
    ],
    templateUrl: './not-found.component.html',
    styleUrl: './not-found.component.scss'
})
export class NotFoundComponent {

}
