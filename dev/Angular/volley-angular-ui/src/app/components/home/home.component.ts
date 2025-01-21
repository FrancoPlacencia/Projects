import { TournamentService } from './../../services/tournament.service';
import { Component } from '@angular/core';

import { ActivatedRoute, Router, RouterOutlet } from '@angular/router';

import { MatIconModule } from '@angular/material/icon';
import { MatToolbarModule } from '@angular/material/toolbar';
import { MatButtonModule } from '@angular/material/button';
import { Tournament } from '../../model/tournament.model';
@Component({
  selector: 'app-home',
  imports: [RouterOutlet, MatIconModule, MatToolbarModule, MatButtonModule],
  templateUrl: './home.component.html',
  styleUrl: './home.component.scss',
})
export class HomeComponent {
  private tournamentId: number = 0;

  constructor(
    private tournamentService: TournamentService,
    private router: Router,
    private route: ActivatedRoute,
  ) {}

  public home(): void {
    this.router.navigate(['/app'], {
      relativeTo: this.route,
      queryParams: {},
    });
  }

  public category(): void {
    this.router.navigate(['../category'], {
      relativeTo: this.route,
      queryParams: {},
    });
  }

  public team(): void {}
  public game(): void {}
  public playoff(): void {}
}
