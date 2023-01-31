class Game {
  final int id;
  final String title;
  final String description;
  final int xpReward;
  final int balanceReward;

  const Game({
    required this.id,
    required this.title,
    required this.description,
    required this.xpReward,
    required this.balanceReward,
  });

  factory Game.fromJson(Map<String, dynamic> json) {
    return Game(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        xpReward: json["xpReward"],
        balanceReward: json["balanceReward"]);
  }
}
