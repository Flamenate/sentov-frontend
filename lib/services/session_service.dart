import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../http_client.dart';
import '../models/session.dart';

class SessionService {
  static final SessionService _instance = SessionService._internal();

  factory SessionService() {
    return _instance;
  }

  SessionService._internal();

  Future<Session> getSessionById(int id) async {
    final http.Response session = await httpClient
        .get(Uri.parse("${dotenv.env['BACKEND_URL']}/session/$id"));
    return Session.fromJson(jsonDecode(session.body));
  }

  Future<Session> postSession(int playerId, int activityId, int result) async {
    final http.Response session =
        await httpClient.post(Uri.parse("${dotenv.env['BACKEND_URL']}/session"),
            body: json.encode({
              "playerId": playerId,
              "activityId": activityId,
              "result": result,
              "timestamp": DateTime.now().toUtc().toIso8601String()
            }));
    return Session.fromJson(jsonDecode(session.body));
  }
}
