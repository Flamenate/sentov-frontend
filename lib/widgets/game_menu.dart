import 'package:flutter/material.dart';
import 'package:sento_staff/models/game.dart';
import 'package:sento_staff/services/game_service.dart';

class GameMenu extends StatefulWidget {
  const GameMenu({super.key});

  @override
  State<GameMenu> createState() => GameMenuState();
}

class GameMenuState extends State<GameMenu> {
  int selectedGameId = -1;
  List<Game> games = [
    Game.placeholder(),
  ];

  @override
  void initState() {
    super.initState();
    GameService().getAllGames().then(
      (retrievedGames) {
        setState(() {
          games.addAll(retrievedGames);
        });
      },
    );
  }

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
          items: games
              .map(((g) => DropdownMenuItem(value: g.id, child: Text(g.title))))
              .toList(),
          onChanged: (int? value) {
            setState(() {
              selectedGameId = value!;
            });
          }),
    );
  }
}
