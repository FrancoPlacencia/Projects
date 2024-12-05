import { Routes } from '@angular/router';
import { HomeComponent } from './home/home.component';
import { TournamentComponent } from './admin/components/tournament/tournament.component';
import { TeamComponent } from './admin/components/team/team.component';
import { GameComponent } from './admin/components/game/game.component';
import { PlayerComponent } from './admin/components/player/player.component';
import { NotFoundComponent } from './not-found/not-found.component';

export const routes: Routes = [
  { path: '', redirectTo: 'app', pathMatch: 'full' },

  { path: 'app', component: HomeComponent },

  {
    path: 'admin',
    component: HomeComponent,
    children: [
      { path: 'tournament', component: TournamentComponent },
      { path: 'team', component: TeamComponent },
      { path: 'game', component: GameComponent },
      { path: 'player', component: PlayerComponent },
    ],
  },

  // Not found
  { path: '**', component: NotFoundComponent },
];
