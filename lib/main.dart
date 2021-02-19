import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:wahapedia_mobile/blocs/cubit.dart';
import 'package:wahapedia_mobile/repositories/app_repository.dart';
import 'package:wahapedia_mobile/widgets/homePage.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  final AppRepository appRepository = AppRepository();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Army Builder',
      home: BlocProvider(
        create: (_) => AppCubit(appRepository: appRepository),
        child: HomePage(),
      ),
    );
  }
}
