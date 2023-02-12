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
        level: 6,
        balance: json["balance"]);
  }

  factory Player.placeholder() {
    return Player(
        id: -1, name: "Flen Ben Foulen", xp: -1000, level: -1, balance: -5000);
  }
}
