import 'package:flutter/material.dart';

class GameMenu extends StatefulWidget {
  const GameMenu({super.key});

  @override
  State<GameMenu> createState() => GameMenuState();
}

class GameMenuState extends State<GameMenu> {
  int selectedGameId = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), color: Colors.white54),
      child: DropdownButton<int>(
          elevation: 15,
          value: selectedGameId,
          dropdownColor: Color.fromARGB(255, 233, 233, 233),
          borderRadius: BorderRadius.circular(10.0),
          iconSize: 25.0,
          underline: SizedBox(),
          isExpanded: true,
          items: _buildGameList(),
          onChanged: (int? value) {
            setState(() {
              selectedGameId = value!;
            });
          }),
    );
  }
}

List<DropdownMenuItem<int>> _buildGameList() {
  return [
    DropdownMenuItem(value: 0, child: Text("Rocket League")),
    DropdownMenuItem(value: 1, child: Text("ZEBI GAME")),
    DropdownMenuItem(value: 2, child: Text("KTYB")),
    DropdownMenuItem(value: 3, child: Text("3ASBA"))
  ];
}
