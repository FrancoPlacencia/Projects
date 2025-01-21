import { Component } from '@angular/core';
import { UserAdminComponent } from '../users/user-admin/user-admin.component';

@Component({
    selector: 'app-home',
    standalone: true,
    imports: [UserAdminComponent],
    templateUrl: './home.component.html',
    styleUrl: './home.component.css'
})
export class HomeComponent {

}
