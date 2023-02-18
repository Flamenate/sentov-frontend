class Session {
  final int id;
  final int activityId;
  final int playerId;
  final int result;
  final DateTime timestamp;

  const Session({
    required this.id,
    required this.activityId,
    required this.playerId,
    required this.result,
    required this.timestamp,
  });

  factory Session.fromJson(Map<String, dynamic> json) {
    return Session(
        id: json["id"],
        activityId: json["activityId"],
        playerId: json["playerId"],
        result: json["result"],
        timestamp: DateTime.parse(json["timestamp"]));
  }

  factory Session.placeholder() {
    return Session(
        id: -1,
        activityId: -1,
        playerId: -1,
        result: -1,
        timestamp: DateTime.fromMillisecondsSinceEpoch(0));
  }
}
