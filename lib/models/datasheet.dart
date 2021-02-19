class Datasheet {
  final String id;
  final String name;
  final String factionId;
  final String role;
  final String cost;

  Datasheet({this.id, this.name, this.factionId, this.role, this.cost});

  static Datasheet fromJson(dynamic json) {
    return Datasheet(
      id: json['id'],
      name: json['name'],
      factionId: json['faction_id'],
      role: json['role'],
      cost: json['cost'],
    );
  }
}
