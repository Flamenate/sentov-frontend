import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sento_staff/models/session.dart';

import '../widgets/session_form.dart';
import '../widgets/session_result.dart';
import 'game_selection_screen.dart';

class SessionScreen extends StatefulWidget {
  const SessionScreen({super.key, this.gameId, this.gameTitle});

  final int? gameId;
  final String? gameTitle;

  @override
  State<SessionScreen> createState() => _SessionScreenState();
}

class _SessionScreenState extends State<SessionScreen> {
  Session session = Session(
      id: -1,
      gameId: -1,
      playerId: -1,
      result: Result.loss,
      timestamp: DateTime.fromMillisecondsSinceEpoch(0));

  @override
  Widget build(BuildContext context) {
    Widget body;
    if (widget.gameId == null) {
      body = GameSelectionScreen();
    } else {
      body = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height / 50),
              child: Text(
                widget.gameTitle ?? "!TEST!",
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Unbounded"),
              ),
            ),
          ),
          SessionForm(
            onSubmit: (context) {
              setState(() {
                session = Session(
                    id: 1500,
                    gameId: 0,
                    playerId: 666,
                    result: Result.loss,
                    timestamp: DateTime.now());
              });
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Processing Data')),
              );
            },
          ),
          SessionResult(session: session),
        ],
      );
    }
    return Scaffold(
        appBar: AppBar(
          leading:
              BackButton(onPressed: () => context.go("/"), color: Colors.white),
          title: Text("Register Game Session",
              style: TextStyle(color: Colors.white)),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 90, 38, 107),
        ),
        body: body);
  }
}
