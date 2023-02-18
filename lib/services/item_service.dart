import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:sento_staff/http_client.dart';
import 'package:sento_staff/models/item.dart';

class ItemService {
  static final ItemService _instance = ItemService._internal();

  factory ItemService() {
    return _instance;
  }

  ItemService._internal();

  Future<List<Item>> getAll() async {
    final http.Response response =
        await httpClient.get(Uri.parse("${dotenv.env['BACKEND_URL']}/items"));
    return jsonDecode(response.body)
        .map<Item>((itemData) => Item.fromJson(itemData))
        .toList();
  }
}
