import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wahapedia_mobile/bloc_observer.dart';
import 'package:wahapedia_mobile/blocs/blocs.dart';
import 'package:wahapedia_mobile/repositories/repositories.dart';

import 'package:http/http.dart' as http;
import 'package:wahapedia_mobile/widgets/chooseFaction.dart';
import 'package:wahapedia_mobile/widgets/initialPage.dart';

void main() {
  Bloc.observer = CustomBlocObserver();

  final AppRepository appRepository =
      AppRepository(apiClient: ApiClient(httpClient: http.Client()));
  runApp(App(appRepository: appRepository));
}

class App extends StatelessWidget {
  final AppRepository appRepository;

  App({Key key, @required this.appRepository})
      : assert(appRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Army Builder',
      routes: {
        'ChooseFaction': (context) => ChooseFaction(),
      },
      home: BlocProvider(
        create: (context) => AppBloc(appRepository: appRepository),
        child: InitialPage(),
      ),
    );
  }
}
