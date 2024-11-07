import { TournamentComponent } from './admin/components/tournament/tournament.component';
import { Routes } from '@angular/router';
import { NotFoundComponent } from './common/not-found/not-found.component';
import { HomeComponent } from './home/home.component';

export const routes: Routes = [
  { path: '', redirectTo: 'app', pathMatch: 'full'},

  {
    path: 'admin', component: HomeComponent,
    children: [
      {path: 'tournament', component: TournamentComponent}
    ]
  },

  // Not found
  { path: '**', component: NotFoundComponent}
];
