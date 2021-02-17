import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:wahapedia_mobile/models/datasheet.dart';

class ApiClient {
  static const baseUrl = 'http://67e9d3e61434.ngrok.io';
  final http.Client httpClient;

  ApiClient({@required this.httpClient}) : assert(httpClient != null);

  Future getAllFactions() async {
    final factionsUrl = '$baseUrl/api/factions';
    final factionRepsonse = await this.httpClient.get(factionsUrl);

    if (factionRepsonse.statusCode != 200)
      throw Exception('Error getting factions');

    final factionsJson = jsonDecode(factionRepsonse.body) as List;
    return factionsJson;
  }

  Future getAllDatasheets() async {
    final datasheetsUrl = '$baseUrl/api/datasheets';
    final datasheetsResponse = await this.httpClient.get(datasheetsUrl);

    if (datasheetsResponse.statusCode != 200)
      throw Exception('error getting datasheets');

    final datasheetsJson = jsonDecode(datasheetsResponse.body) as List;
    return datasheetsJson;
  }

  Future<dynamic> getDatasheetsByFaction(String factionId) async {
    final datasheetsUrl = '$baseUrl/api/datasheets?factionId=$factionId';
    final datasheetsResponse = await this.httpClient.get(datasheetsUrl);

    print(datasheetsResponse.statusCode);

    if (datasheetsResponse.statusCode != 200)
      throw Exception('error getting datasheets');

    final datasheetsJson = jsonDecode(datasheetsResponse.body) as List;
    return datasheetsJson;
  }

  Future<dynamic> getDatasheetsById(String id) async {
    final datasheetsUrl = '$baseUrl/api/datasheets?id=$id';
    final datasheetsResponse = await this.httpClient.get(datasheetsUrl);

    if (datasheetsResponse.statusCode != 200)
      throw Exception('error getting datasheets');

    final datasheetsJson = jsonDecode(datasheetsResponse.body) as List;
    return Datasheet.fromJson(datasheetsJson);
  }
}
