import 'package:wahapedia_mobile/models/faction.dart';
import 'package:wahapedia_mobile/models/roster.dart';

abstract class AppState {
  const AppState();
}

class InitialState extends AppState {}

class LoadingFactions extends AppState {}

class LoadFactionsSuccess extends AppState {
  final List<Faction> factions;

  const LoadFactionsSuccess({this.factions});
}

class LoadFactionsFailure extends AppState {}

class LoadingRoster extends AppState {}

class LoadRosterSuccess extends AppState {
  final List<Roster> rosters;

  const LoadRosterSuccess({this.rosters});
}

class LoadRosterFailure extends AppState {}
