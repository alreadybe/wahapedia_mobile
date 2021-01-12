import 'package:equatable/equatable.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();
}

class DatasheetsRequested extends AppEvent {
  final String faction;
  final String id;

  const DatasheetsRequested({this.id, this.faction});

  @override
  List<Object> get props => [id, faction];
}
