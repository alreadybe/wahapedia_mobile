import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wahapedia_mobile/models/datasheet.dart';

class ApiClient {
  static const baseUrl = 'http://192.168.0.107:3001';
  final http.Client httpClient = http.Client();

  Future getAllFactions() async {
    try {
      final factionsUrl = '$baseUrl/api/factions';
      final factionRepsonse = await this.httpClient.get(factionsUrl);

      final factionsJson = jsonDecode(factionRepsonse.body) as List;
      return factionsJson;
    } catch (_) {
      print(_);
    }
  }

  Future getRosters() async {
    try {
      final rostersUrl = '$baseUrl/api/rosters';
      final rostersRepsonse = await this.httpClient.get(rostersUrl);

      final rostersJson = jsonDecode(rostersRepsonse.body) as List;
      return rostersJson;
    } catch (_) {
      print(_);
    }
  }

  Future setRosters(Map<String, dynamic> roster) async {
    try {
      final rostersUrl = '$baseUrl/api/rosters';
      final rostersResponce =
          await this.httpClient.post(rostersUrl, body: roster);

      return rostersResponce;
    } catch (_) {
      print(_);
    }
  }

  Future getAllDatasheets() async {
    try {
      final datasheetsUrl = '$baseUrl/api/datasheets';
      final datasheetsResponse = await this.httpClient.get(datasheetsUrl);

      final datasheetsJson = jsonDecode(datasheetsResponse.body) as List;
      return datasheetsJson;
    } catch (_) {
      print(_);
    }
  }

  Future<dynamic> getDatasheetsByFaction(String factionId) async {
    try {
      final datasheetsUrl = '$baseUrl/api/datasheets?factionId=$factionId';
      final datasheetsResponse = await this.httpClient.get(datasheetsUrl);

      final datasheetsJson = jsonDecode(datasheetsResponse.body) as List;
      return datasheetsJson;
    } catch (_) {
      print(_);
    }
  }

  Future<dynamic> getDatasheetsById(String id) async {
    try {
      final datasheetsUrl = '$baseUrl/api/datasheets?id=$id';
      final datasheetsResponse = await this.httpClient.get(datasheetsUrl);

      final datasheetsJson = jsonDecode(datasheetsResponse.body) as List;
      return Datasheet.fromJson(datasheetsJson);
    } catch (_) {
      print(_);
    }
  }
}
