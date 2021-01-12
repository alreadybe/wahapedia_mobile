import 'dart:async';

import 'package:meta/meta.dart';

import 'api_client.dart';

class AppRepository {
  final ApiClient apiClient;

  AppRepository({@required this.apiClient}) : assert(apiClient != null);

  Future<dynamic> getRosters() async {
    return null;
  }
}
