import { Component } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { UserService } from '../user/user.service';
import { LoginUser } from './LoginUser';

@Component({
    selector: 'app-login',
    standalone: true,
    imports: [FormsModule],
    templateUrl: './login.component.html',
    styleUrl: './login.component.css'
})
export class LoginComponent {
    public email: string = "";
    public password: string = "";

    constructor(public userService: UserService) { }

    login() {
        console.log('email: %s, password: %s', this.email, this.password)
        let iLoginUser: LoginUser = {
            email: this.email,
            password: this.password
        };

        this.userService.login(iLoginUser).subscribe(
            data => console.log(data),
            error => console.log(error)
        );
    }
}
