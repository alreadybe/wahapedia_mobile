class Roster {
  final String name;

  Roster({this.name});

  static Roster fromJson(dynamic json) {
    return Roster(
      name: json['name'],
    );
  }
}
