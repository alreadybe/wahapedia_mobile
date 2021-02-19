import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wahapedia_mobile/blocs/cubit.dart';
import 'package:wahapedia_mobile/blocs/state.dart';

class ChooseFaction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Container(
        child: BlocBuilder<AppCubit, AppState>(builder: (context, state) {
      if (state is LoadingFactions) {
        return Center(child: Text('Please wait...'));
      }
      if (state is LoadFactionsSuccess) {
        final factions = state.factions;
        return ListView.builder(
            itemCount: factions.length,
            itemBuilder: (context, int index) => Text(factions[index].name));
      }
      return Text('something went wrong');
    })));
  }
}
