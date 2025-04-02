import { ActivatedRoute, Router } from '@angular/router';

export function navigateToTournament(router: Router, route: ActivatedRoute) {
  router.navigate(['../tournament'], {
    relativeTo: route,
  });
}

export function navigateToTeam(
  tournamentId: number,
  category: string,
  router: Router,
  route: ActivatedRoute,
) {
  console.log('navigate', tournamentId, category);
  router.navigate(['../team'], {
    relativeTo: route,
    queryParams: {
      id: tournamentId,
      category: category,
    },
  });
}

export function navigateToWeek(
  tournamentId: number,
  week: number,
  router: Router,
  route: ActivatedRoute,
) {
  router.navigate(['../game'], {
    relativeTo: route,
    queryParams: {
      id: tournamentId,
      weekNumber: week,
    },
  });
}

export function navigateEliminations(
  tournamentId: number,
  stage: string,
  router: Router,
  route: ActivatedRoute,
) {
  router.navigate(['../game'], {
    relativeTo: route,
    queryParams: {
      id: tournamentId,
      stage: stage,
    },
  });
}

export function navigateToPlayer(
  tournamentId: number,
  category: string,
  teamId: number,
  router: Router,
  route: ActivatedRoute,
) {
  router.navigate(['../player'], {
    relativeTo: route,
    queryParams: {
      id: teamId,
      tournament: tournamentId,
      category: category,
    },
  });
}
