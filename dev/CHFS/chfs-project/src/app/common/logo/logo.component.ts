import { Component, Input } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-logo',
  standalone: true,
  imports: [],
  templateUrl: './logo.component.html',
  styleUrl: './logo.component.scss'
})
export class LogoComponent {

  @Input() public type!: string;

  constructor(private router: Router) { }

  public authRoot() {
    this.router.navigateByUrl('/')
  }

  public homeRoot() {
    this.router.navigateByUrl('/app')
  }
}
