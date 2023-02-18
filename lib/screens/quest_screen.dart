import 'package:flutter/material.dart';
import 'package:sento_staff/models/player.dart';
import 'package:sento_staff/models/session.dart';
import 'package:sento_staff/widgets/default_app_bar.dart';
import 'package:sento_staff/widgets/quest_session_form.dart.dart';
import 'package:sento_staff/widgets/session_result.dart';
import 'package:sento_staff/screens/activity_selection_screen.dart';

class QuestScreen extends StatefulWidget {
  const QuestScreen({super.key, this.questId, this.questTitle});

  final int? questId;
  final String? questTitle;

  @override
  State<QuestScreen> createState() => QuestScreenState();
}

class QuestScreenState extends State<QuestScreen> {
  Session currentSession = Session.placeholder();
  Player currentPlayer = Player.placeholder();

  @override
  Widget build(BuildContext context) {
    Widget body;
    if (widget.questId == null) {
      body = ActivitySelectionScreen(type: "quest", route: "/quest");
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
                widget.questTitle!,
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Unbounded"),
              ),
            ),
          ),
          QuestSessionForm(
              questId: widget.questId!,
              updateParentState: (Session newSession, Player newPlayer) {
                setState(() {
                  currentSession = newSession;
                  currentPlayer = newPlayer;
                });
              }),
          SessionResult(session: currentSession, player: currentPlayer),
        ],
      );
    }
    return Scaffold(
        appBar: defaultAppBar(context, title: "Register Quest Completion"),
        body: body);
  }
}
