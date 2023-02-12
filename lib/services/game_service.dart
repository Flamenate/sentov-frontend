import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../http_client.dart';
import '../models/game.dart';

class GameService {
  static final GameService _instance = GameService._internal();

  factory GameService() {
    return _instance;
  }

  GameService._internal();

  Future<List<Game>> getAllGames() async {
    final http.Response games =
        await httpClient.get(Uri.parse("${dotenv.env['BACKEND_URL']}/games"));
    return jsonDecode(games.body)
        .map<Game>((gameData) => Game.fromJson(gameData))
        .toList();
  }

  Future<Game> getGameById(int id) async {
    final http.Response game = await httpClient
        .get(Uri.parse("${dotenv.env['BACKEND_URL']}/game/$id"));
    return Game.fromJson(jsonDecode(game.body));
  }
}
