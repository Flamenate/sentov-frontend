class Player {
  final int id;
  final String name;
  final int xp;
  final int level;
  final int balance;

  const Player({
    required this.id,
    required this.name,
    required this.xp,
    required this.level,
    required this.balance,
  });

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
        id: json["id"],
        name: json["name"],
        xp: json["xp"],
        level: json["level"],
        balance: json["balance"]);
  }
}
