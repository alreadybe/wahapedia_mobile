import 'package:equatable/equatable.dart';

class Faction extends Equatable {
  final String id;
  final String name;
  final String link;

  Faction({this.id, this.name, this.link});

  @override
  List<Object> get props => [id, name, link];

  static Faction fromJson(dynamic json) {
    return Faction(
      id: json['id'],
      name: json['name'],
      link: json['link'],
    );
  }
}
