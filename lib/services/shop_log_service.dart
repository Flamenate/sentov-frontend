import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:sento_staff/http_client.dart';

class ShopLogService {
  static final ShopLogService _instance = ShopLogService._internal();

  factory ShopLogService() {
    return _instance;
  }

  ShopLogService._internal();

  Future<String> postLog(int playerId, int itemId) async {
    final response = await httpClient.post(
        Uri.parse("${dotenv.env['BACKEND_URL']}/shoplogs"),
        body: json.encode({"playerId": playerId, "itemId": itemId}));
    if (response.statusCode >= 400) {
      return response.body;
    }
    return "";
  }
}
