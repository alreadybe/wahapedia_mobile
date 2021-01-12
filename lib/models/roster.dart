import 'package:equatable/equatable.dart';

class Roster extends Equatable {
  final String name;

  Roster({this.name});

  @override
  List<Object> get props => [name];
}
