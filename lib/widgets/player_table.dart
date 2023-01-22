import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sento_staff/models/player.dart';

class PlayerTable extends StatelessWidget {
  const PlayerTable({super.key, required this.player});

  final Player player;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Table(
          border: TableBorder.all(borderRadius: BorderRadius.circular(5.0)),
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          defaultColumnWidth: FlexColumnWidth(),
          columnWidths: {
            0: FlexColumnWidth(0.5),
            1: FlexColumnWidth(4),
            2: FlexColumnWidth(1.3),
            3: FlexColumnWidth(1),
            4: FlexColumnWidth(2),
          },
          children: [
            TableRow(children: [
              Center(child: Text("ID")),
              Center(child: Text("Name")),
              Center(child: Text("XP")),
              Center(child: Text("Level")),
              Center(child: Text("Balance")),
            ], decoration: BoxDecoration(color: Colors.blue.shade100)),
            TableRow(children: [
              Center(child: Text(player.id.toString())),
              Center(child: Text(player.name.isNotEmpty ? player.name : "?")),
              Center(child: Text(player.xp.toString())),
              Center(child: Text(player.level.toString())),
              Center(
                  child: Text(
                      "\$${NumberFormat.currency(symbol: '', decimalDigits: 0).format(player.balance)}"))
            ])
          ]),
    );
  }
}
