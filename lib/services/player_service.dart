import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:sento_staff/http_client.dart';
import 'package:sento_staff/models/player.dart';

class PlayerService {
  static final PlayerService _instance = PlayerService._internal();

  factory PlayerService() {
    return _instance;
  }

  PlayerService._internal();

  Future<List<Player>> getAllPlayers(String sortBy, int page) async {
    final http.Response players = await httpClient.get(Uri.parse(
        "${dotenv.env['BACKEND_URL']}/players?orderby=$sortBy&page=$page"));
    return jsonDecode(players.body)
        .map<Player>((playerData) => Player.fromJson(playerData))
        .toList();
  }

  Future<Player> getPlayerById(int id) async {
    final http.Response response = await httpClient
        .get(Uri.parse("${dotenv.env['BACKEND_URL']}/players/$id"));
    if (response.statusCode >= 400) return Player.placeholder();
    return Player.fromJson(jsonDecode(response.body));
  }

  Future<Player> putPlayer(Player player) async {
    final http.Response response = await httpClient.put(
        Uri.parse("${dotenv.env['BACKEND_URL']}/players"),
        body: player.toJson(),
        encoding: Encoding.getByName("UTF-8"));
    if (response.statusCode >= 400) return Player.placeholder();
    return player;
  }

  Future<List<String>> getAllQuests(int id) async {
    final http.Response response = await httpClient
        .get(Uri.parse("${dotenv.env['BACKEND_URL']}/players/$id/getquests"));
    if (response.statusCode >= 400) return ["No quests yet."];
    return jsonDecode(response.body)
        .map<String>((questData) => questData["title"] as String)
        .toList();
  }

  Future<List<String>> getAllItems(int id) async {
    final http.Response response = await httpClient
        .get(Uri.parse("${dotenv.env['BACKEND_URL']}/players/$id/getitems"));
    if (response.statusCode >= 400) return ["No items bought."];
    return jsonDecode(response.body)
        .map<String>((itemData) => itemData["name"] as String)
        .toList();
  }
}
