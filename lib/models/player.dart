import 'dart:convert';

class Player {
  final int id;
  final String name;
  final int xp;
  final int? level;
  final int balance;
  final String? lastQuest;
  final String? lastGame;

  const Player({
    required this.id,
    required this.name,
    required this.xp,
    required this.balance,
    this.level,
    this.lastQuest,
    this.lastGame,
  });

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
        id: json["id"],
        name: json["name"],
        xp: json["xp"],
        level: json["level"],
        balance: json["balance"],
        lastQuest: json["lastPlayedQuest"],
        lastGame: json["lastPlayedGame"]);
  }

  factory Player.placeholder() {
    return Player(
        id: -1, name: "Flen Ben Foulen", xp: -9999, level: -99, balance: -9999);
  }

  String toJson() {
    return jsonEncode({
      "id": id,
      "name": name,
      "xp": xp,
      "balance": balance,
    });
  }
}
