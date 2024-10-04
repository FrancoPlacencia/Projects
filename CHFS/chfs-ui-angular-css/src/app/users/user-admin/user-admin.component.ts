import { CommonModule } from '@angular/common';
import { Component, OnInit } from '@angular/core';
import { UserAdmin } from './user-admin.model';
import { UserService } from '../user-service/user.service';

@Component({
    selector: 'app-user-admin',
    standalone: true,
    imports: [
        CommonModule
    ],
    templateUrl: './user-admin.component.html',
    styleUrl: './user-admin.component.css'
})
export class UserAdminComponent implements OnInit {

    public users: UserAdmin[] = [];

    constructor(public userService: UserService) {

    }

    ngOnInit(): void {
        this.getUsers();
    }



    private getUsers(): void {
        this.userService.getUsers().subscribe(users => this.users = users);
    }

    // this.heroService.getHeroes().subscribe(heroes => this.heroes = heroes);

}
