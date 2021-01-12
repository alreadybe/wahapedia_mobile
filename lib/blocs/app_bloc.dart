import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:wahapedia_mobile/models/models.dart';

import 'package:wahapedia_mobile/repositories/repositories.dart';
import 'package:wahapedia_mobile/blocs/blocs.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final AppRepository appRepository;

  AppBloc({@required this.appRepository})
      : assert(appRepository != null),
        super(InitialState());

  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {
    if (event is DatasheetsRequested) {
      yield LoadingRoster();

      try {
        final List<Roster> rosters = await appRepository.getRosters();
        yield LoadRosterSuccess(rosters: rosters);
      } catch (_) {
        yield LoadRosterFailure();
      }
    }
  }
}
