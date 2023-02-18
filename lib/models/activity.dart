class Activity {
  final int id;
  final String title;
  final String description;
  final int xpReward;
  final int balanceReward;
  final int replayLimit;
  final int cooldownInMinutes;

  const Activity(
      {required this.id,
      required this.title,
      required this.description,
      required this.xpReward,
      required this.balanceReward,
      required this.replayLimit,
      required this.cooldownInMinutes});

  factory Activity.fromJson(Map<String, dynamic> json) {
    return Activity(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        xpReward: json["xpReward"],
        balanceReward: json["balanceReward"],
        replayLimit: json["replayLimit"],
        cooldownInMinutes: json["cooldownInMinutes"]);
  }

  factory Activity.placeholder() {
    return Activity(
        id: -1,
        title: "Select a game...",
        description: "",
        xpReward: -1,
        balanceReward: -1,
        replayLimit: -1,
        cooldownInMinutes: -1);
  }
}
