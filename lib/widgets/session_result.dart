import 'package:flutter/material.dart';
import 'package:sento_staff/models/player.dart';
import 'package:sento_staff/models/session.dart';
import 'package:sento_staff/widgets/player_table.dart';

class SessionResult extends StatelessWidget {
  const SessionResult({super.key, required this.session, required this.player});

  final Session session;
  final Player player;

  @override
  Widget build(BuildContext context) {
    TextStyle titleRowStyle = TextStyle(
        color: Colors.white,
        fontFamily: "Montserrat",
        fontWeight: FontWeight.w500,
        fontSize: 16.0);
    return Column(
      children: [
        Column(
          children: [
            Text("Last Registered Session", style: TextStyle(fontSize: 20.0)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Table(
                  border:
                      TableBorder.all(borderRadius: BorderRadius.circular(5.0)),
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  defaultColumnWidth: FlexColumnWidth(),
                  columnWidths: {
                    0: FlexColumnWidth(1),
                    3: FlexColumnWidth(1.5),
                  },
                  children: [
                    TableRow(
                        children: [
                          Center(
                              child: Text(
                            "Time",
                            style: titleRowStyle,
                          )),
                          Center(
                              child: Text(
                            "Session ID",
                            style: titleRowStyle,
                          )),
                          Center(
                              child: Text(
                            "Player ID",
                            style: titleRowStyle,
                          )),
                          Center(
                              child: Text(
                            "Result",
                            style: titleRowStyle,
                          )),
                        ],
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 90, 38, 107))),
                    TableRow(
                        decoration: BoxDecoration(color: Colors.white54),
                        children: [
                          Center(
                              child: Text(
                                  "${session.timestamp.hour}:${session.timestamp.minute}:${session.timestamp.second}")),
                          Center(child: Text(session.id.toString())),
                          Center(child: Text(session.playerId.toString())),
                          Center(child: Text(session.result.toString())),
                        ])
                  ]),
            ),
          ],
        ),
        Text("Related Player", style: TextStyle(fontSize: 20.0)),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: PlayerTable(player: player),
        )
      ],
    );
  }
}
