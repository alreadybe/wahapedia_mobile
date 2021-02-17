import 'dart:async';

import 'package:meta/meta.dart';
import 'package:wahapedia_mobile/models/faction.dart';

import 'api_client.dart';

class AppRepository {
  final ApiClient apiClient;

  AppRepository({@required this.apiClient}) : assert(apiClient != null);

  Future<dynamic> getRosters() async {
    return null;
  }

  Future<dynamic> getFactions() async {
    List<dynamic> rawFactions = await apiClient.getAllFactions();
    List<Faction> factions =
        rawFactions.map((e) => Faction.fromJson(e)).toList();
    return factions;
  }
}
