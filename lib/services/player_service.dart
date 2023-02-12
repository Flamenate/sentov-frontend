import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../http_client.dart';
import '../models/player.dart';

class PlayerService {
  static final PlayerService _instance = PlayerService._internal();

  factory PlayerService() {
    return _instance;
  }

  PlayerService._internal();

  Future<List<Player>> getAllPlayers(String? sortBy) async {
    final http.Response players = await httpClient
        .get(Uri.parse("${dotenv.env['BACKEND_URL']}/players?sort_by=$sortBy"));
    return jsonDecode(players.body)
        .map<Player>((playerData) => Player.fromJson(playerData))
        .toList();
  }

  Future<Player> getPlayerById(int id) async {
    final http.Response response = await httpClient
        .get(Uri.parse("${dotenv.env['BACKEND_URL']}/player/$id"));
    final json = jsonDecode(response.body);
    if (json.error) return Player.placeholder();
    return Player.fromJson(json);
  }

  Future<Player> patchPlayerName(int id, String name) async {
    final http.Response player = await httpClient.patch(
        Uri.parse("${dotenv.env['BACKEND_URL']}/players/$id"),
        body: jsonEncode({name: name}),
        encoding: Encoding.getByName("UTF-8"));
    return Player.fromJson(jsonDecode(player.body));
  }
}
