import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wahapedia_mobile/blocs/blocs.dart';
import 'package:wahapedia_mobile/models/models.dart';

class HomePage extends StatelessWidget {
  final List<Roster> rosters;
  HomePage({this.rosters});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'ARMY BUILDER',
          style: TextStyle(fontSize: 16, color: Color(0xFF18ABCC)),
        ),
      ),
      body: Center(
          child: BlocBuilder<AppBloc, AppState>(builder: (context, state) {
        return Container(
          child: Text(
            'Start build your army!',
            style: TextStyle(color: Colors.grey),
          ),
        );
      })),
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
