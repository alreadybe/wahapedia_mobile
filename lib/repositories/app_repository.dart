import 'dart:async';

import 'package:wahapedia_mobile/models/faction.dart';
import 'package:wahapedia_mobile/models/roster.dart';

import 'api_client.dart';

class AppRepository {
  final ApiClient apiClient = ApiClient();

  Future<dynamic> getRosters() async {
    List<dynamic> rawRosters = await apiClient.getRosters();
    List<Roster> rosters = rawRosters.map((e) => Roster.fromJson(e)).toList();
    return rosters;
  }

  Future<dynamic> getFactions() async {
    List<dynamic> rawFactions = await apiClient.getAllFactions();
    List<Faction> factions =
        rawFactions.map((e) => Faction.fromJson(e)).toList();
    return factions;
  }
}
