import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wahapedia_mobile/blocs/blocs.dart';

import 'widgets.dart';

class InitialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      color: Colors.black,
      child: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          if (state is InitialState) {
            BlocProvider.of<AppBloc>(context).add(DatasheetsRequested());
            return Center(child: Text('Please wait...'));
          }
          if (state is LoadingRoster) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is LoadRosterSuccess) {
            final rosters = state.rosters;

            return HomePage(
              rosters: rosters,
            );
          }
          if (state is LoadRosterFailure) {
            return Text(
              'Something went wrong!',
              style: TextStyle(color: Colors.red),
            );
          }
          return Text('');
        },
      ),
    ));
  }
}
