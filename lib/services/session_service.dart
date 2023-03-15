import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:sento_staff/http_client.dart';
import 'package:sento_staff/models/session.dart';

class SessionService {
  static final SessionService _instance = SessionService._internal();

  factory SessionService() {
    return _instance;
  }

  SessionService._internal();

  Future<Session> postSession(int playerId, int activityId, int result) async {
    final http.Response session = await httpClient.post(
        Uri.parse("${dotenv.env['BACKEND_URL']}/sessions"),
        body: json.encode({
          "playerId": playerId,
          "activityId": activityId,
          "result": result,
          "timestamp": DateTime.now().toUtc().toIso8601String()
        }));
    try {
      return Session.fromJson(jsonDecode(session.body));
    } catch (e) {
      return Session.placeholder();
    }
  }
}
