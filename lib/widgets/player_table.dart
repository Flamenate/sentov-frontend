import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sento_staff/models/player.dart';

class PlayerTable extends StatelessWidget {
  const PlayerTable({super.key, required this.player});

  final Player player;

  @override
  Widget build(BuildContext context) {
    TextStyle titleRowStyle = TextStyle(
        color: Colors.white,
        fontFamily: "Montserrat",
        fontWeight: FontWeight.w500,
        fontSize: 16.0);
    return Table(
        border: TableBorder.all(borderRadius: BorderRadius.circular(5.0)),
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        defaultColumnWidth: FlexColumnWidth(),
        columnWidths: {
          0: FlexColumnWidth(1),
          1: FlexColumnWidth(3.75),
          2: FlexColumnWidth(1.3),
          3: FlexColumnWidth(1.1),
          4: FlexColumnWidth(2),
        },
        children: [
          TableRow(
              children: [
                Center(child: Text("ID", style: titleRowStyle)),
                Center(child: Text("Name", style: titleRowStyle)),
                Center(child: Text("XP", style: titleRowStyle)),
                Center(child: Text("Level", style: titleRowStyle)),
                Center(child: Text("Balance", style: titleRowStyle)),
              ],
              decoration:
                  BoxDecoration(color: Color.fromARGB(255, 90, 38, 107))),
          TableRow(decoration: BoxDecoration(color: Colors.white54), children: [
            Center(child: Text(player.id.toString())),
            Center(child: Text(player.name.isNotEmpty ? player.name : "?")),
            Center(child: Text(player.xp.toString())),
            Center(child: Text(player.level.toString())),
            Center(
                child: Text(
                    "金 ${NumberFormat.currency(symbol: '', decimalDigits: 0).format(player.balance)}"))
          ])
        ]);
  }
}
