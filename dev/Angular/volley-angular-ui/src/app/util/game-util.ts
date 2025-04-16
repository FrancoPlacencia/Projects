import { Game } from '../model/game.model';
import { Team } from '../model/team.model';

const daysOfWeek: string[] = [
  'DOMINGO',
  'LUNES',
  'MARTES',
  'MIERCOLES',
  'JUEVES',
  'VIERNES',
  'SABADO',
];

const months: string[] = [
  'ENERO',
  'FEBRERO',
  'MARZO',
  'ABRIL',
  'MAYO',
  'JUNIO',
  'JULIO',
  'AGOSTO',
  'SEPTIEMBRE',
  'OCTUBRE',
  'NOVIEMBRE',
  'DICIEMBRE',
];

export function generateGameWeeks(
  games: Game[],
): Map<number, Map<string, Game[]>> {
  // Add all games in a map with the week as key
  let weeksMap: Map<number, Game[]> = new Map<number, Game[]>();
  games.forEach((game: Game) => {
    if (weeksMap.has(game.weekNumber)) {
      weeksMap.get(game.weekNumber)?.push(game);
    } else {
      weeksMap.set(game.weekNumber, [game]);
    }
  });

  // Iterates the map to generate a new map inside
  let weeksDayMap: Map<number, Map<string, Game[]>> = new Map<
    number,
    Map<string, Game[]>
  >();
  for (let [key, value] of weeksMap) {
    weeksDayMap.set(key, generateGameWeekDay(value));
  }
  return weeksDayMap;
}

export function generateGameWeekDay(games: Game[]): Map<string, Game[]> {
  let weekDayMap: Map<string, Game[]> = new Map<string, Game[]>();
  games.forEach((game: Game) => {
    let dayName = daysOfWeek[new Date(game.gameDate).getDay()];
    let day = new Date(game.gameDate).getDate();
    let month = months[new Date(game.gameDate).getMonth()];
    let key = dayName + ' ' + day + ' ' + month;
    if (weekDayMap.has(key)) {
      weekDayMap.get(key)?.push(game);
    } else {
      weekDayMap.set(key, [game]);
    }
  });
  return weekDayMap;
}

export function generateTeamMap(teams: Team[]) {
  let teamMap: Map<string, Team[]> = new Map<string, Team[]>();
  teams.forEach((team: Team) => {
    team.players.sort((a, b) => b.gamesPercentage - a.gamesPercentage);
    if (teamMap.has(team.category)) {
      teamMap.get(team.category)?.push(team);
    } else {
      teamMap.set(team.category, [team]);
    }
  });
  return teamMap;
}
