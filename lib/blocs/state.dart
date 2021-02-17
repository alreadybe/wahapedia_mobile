import 'package:equatable/equatable.dart';
import 'package:wahapedia_mobile/models/faction.dart';
import 'package:wahapedia_mobile/models/models.dart';

abstract class AppState extends Equatable {
  const AppState();

  @override
  List<Object> get props => [];
}

class InitialState extends AppState {}

class LoadingFactions extends AppState {}

class LoadingFactionsSuccess extends AppState {
  final List<Faction> factions;

  const LoadingFactionsSuccess({this.factions});

  @override
  List<Object> get props => [factions];
}

class LoadingFactionFailure extends AppState {}

class LoadingRoster extends AppState {}

class LoadRosterSuccess extends AppState {
  final List<Roster> rosters;

  const LoadRosterSuccess({this.rosters});

  @override
  List<Object> get props => [rosters];
}

class LoadRosterFailure extends AppState {}
