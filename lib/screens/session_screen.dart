import 'package:flutter/material.dart';
import 'package:sento_staff/models/session.dart';
import 'package:sento_staff/widgets/default_app_bar.dart';

import '../widgets/session_form.dart';
import '../widgets/session_result.dart';
import 'game_selection_screen.dart';

class SessionScreen extends StatefulWidget {
  const SessionScreen({super.key, this.gameId, this.gameTitle});

  final int? gameId;
  final String? gameTitle;

  @override
  State<SessionScreen> createState() => SessionScreenState();
}

class SessionScreenState extends State<SessionScreen> {
  Session currentSession = Session.placeholder();

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
                widget.gameTitle!,
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Unbounded"),
              ),
            ),
          ),
          SessionForm(
              activityId: widget.gameId!,
              updateParentState: (Session newSession) {
                setState(() {
                  currentSession = newSession;
                });
              }),
          SessionResult(session: currentSession),
        ],
      );
    }
    return Scaffold(
        appBar: defaultAppBar(context, title: "Register Game Session"),
        body: body);
  }
}
