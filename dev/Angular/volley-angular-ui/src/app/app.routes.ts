import { Routes } from '@angular/router';
import { HomeComponent } from './components/home/home.component';
import { TournamentComponent } from './components/tournament/tournament.component';
import { TeamComponent } from './components/team/team.component';
import { GameComponent } from './components/game/game.component';
import { PlayerComponent } from './components/player/player.component';
import { NotFoundComponent } from './common/not-found/not-found.component';
import { AdminGameComponent } from './admin/admin-game/admin-game.component';
import { AdminTournamentComponent } from './admin/admin-tournament/admin-tournament.component';
import { AdminTeamComponent } from './admin/admin-team/admin-team.component';
import { AdminPlayerComponent } from './admin/admin-player/admin-player.component';
import { LandingComponent } from './components/landing/landing.component';
import { AdminPlayoffComponent } from './admin/admin-playoff/admin-playoff.component';

export const routes: Routes = [
  { path: '', redirectTo: 'app/landing', pathMatch: 'full' },

  {
    path: 'app',
    component: HomeComponent,
    children: [
      { path: '', redirectTo: 'landing', pathMatch: 'full' },
      { path: 'landing', component: LandingComponent },
      { path: 'tournament', component: TournamentComponent },
      { path: 'team', component: TeamComponent },
      { path: 'game', component: GameComponent },
      { path: 'player', component: PlayerComponent },
    ],
  },

  {
    path: 'admin',
    component: HomeComponent,
    children: [
      { path: 'tournament', component: AdminTournamentComponent },
      { path: 'team', component: AdminTeamComponent },
      { path: 'game', component: AdminGameComponent },
      { path: 'player', component: AdminPlayerComponent },
      { path: 'playoff', component: AdminPlayoffComponent },
    ],
  },

  // Not found
  { path: '**', component: NotFoundComponent },
];
