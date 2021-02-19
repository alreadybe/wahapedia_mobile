import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wahapedia_mobile/blocs/cubit.dart';
import 'package:wahapedia_mobile/blocs/state.dart';
import 'package:wahapedia_mobile/models/roster.dart';

class HomePage extends StatelessWidget {
  final List<Roster> rosters;
  HomePage({this.rosters});

  @override
  Widget build(BuildContext context) {
    final AppCubit cubit = BlocProvider.of<AppCubit>(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'ARMY BUILDER',
          style: TextStyle(fontSize: 16, color: Color(0xFF18ABCC)),
        ),
      ),
      body: BlocBuilder<AppCubit, AppState>(builder: (context, state) {
        print(state);
        if (state is InitialState) {
          cubit.getRosters();
        }
        if (state is LoadingRoster) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is LoadRosterSuccess) {
          if (state.rosters.isEmpty) {
            return _emptyRosters();
          }
          return Container(child: _emptyRosters());
        }
        if (state is LoadRosterFailure) {
          return Container(
            child: Text('Something went wrong...'),
          );
        }
        return Text('Default');
      }),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
        onPressed: () => Navigator.pushNamed(context, 'ChooseFaction'),
        backgroundColor: Color(0xFF18ABCC),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

Widget _emptyRosters() {
  return Center(
    child: Container(
        child: Text(
      'Start build your army!',
      style: TextStyle(color: Colors.grey),
    )),
  );
}
