import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:wahapedia_mobile/blocs/state.dart';
import 'package:wahapedia_mobile/models/faction.dart';
import 'package:wahapedia_mobile/models/roster.dart';

import 'package:wahapedia_mobile/repositories/app_repository.dart';

class AppCubit extends Cubit<AppState> {
  final AppRepository appRepository;

  AppCubit({@required this.appRepository})
      : assert(appRepository != null),
        super(InitialState());

  Future<void> getRosters() async {
    try {
      emit(LoadingRoster());

      final List<Roster> rosters = await appRepository.getRosters();

      emit(LoadRosterSuccess(rosters: rosters));
    } catch (_) {
      LoadRosterFailure();
    }
  }

  Future<void> getFactions() async {
    try {
      emit(LoadingFactions());

      final List<Faction> factions = await appRepository.getFactions();

      emit(LoadFactionsSuccess(factions: factions));
    } catch (_) {
      LoadFactionsFailure();
    }
  }
}
