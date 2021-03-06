class Faction {
  final String id;
  final String name;
  final String link;

  Faction({this.id, this.name, this.link});

  static Faction fromJson(dynamic json) {
    return Faction(
      id: json['id'],
      name: json['name'],
      link: json['link'],
    );
  }
}
