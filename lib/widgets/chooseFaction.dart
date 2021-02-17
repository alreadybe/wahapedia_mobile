import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wahapedia_mobile/blocs/blocs.dart';

class ChooseFaction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Container(
        child: BlocBuilder<AppBloc, AppState>(builder: (context, state) {
      if (state is LoadRosterSuccess) {
        return Center(child: Text('Please wait...'));
      }
      if (state is LoadingFactionsSuccess) {
        final factions = state.factions;
        return ListView.builder(
            itemCount: factions.length,
            itemBuilder: (context, int index) => Text(factions[index].name));
      }
      return Text('something went wrong');
    })));
  }
}
