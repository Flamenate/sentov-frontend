enum Result { loss, win, draw }

class Session {
  final int id;
  final int gameId;
  final int playerId;
  final Result result;
  final DateTime timestamp;

  const Session({
    required this.id,
    required this.gameId,
    required this.playerId,
    required this.result,
    required this.timestamp,
  });
}
