import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:sento_staff/http_client.dart';
import 'package:sento_staff/models/activity.dart';

class ActivityService {
  static final ActivityService _instance = ActivityService._internal();

  factory ActivityService() {
    return _instance;
  }

  ActivityService._internal();

  Future<List<Activity>> getAllByType(int type) async {
    final http.Response response = await httpClient
        .get(Uri.parse("${dotenv.env['BACKEND_URL']}/activities?type=$type"));
    return jsonDecode(response.body)
        .map<Activity>((activityData) => Activity.fromJson(activityData))
        .toList();
  }

  Future<Activity> getActivityById(int id) async {
    final http.Response activity = await httpClient
        .get(Uri.parse("${dotenv.env['BACKEND_URL']}/activities/$id"));
    return Activity.fromJson(jsonDecode(activity.body));
  }
}
