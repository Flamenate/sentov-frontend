import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sento_staff/widgets/game_menu.dart';
import 'package:sento_staff/widgets/submit_button.dart';

final menuKey = GlobalKey<GameMenuState>();

class GameSelectionScreen extends StatelessWidget {
  const GameSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(padding: EdgeInsets.all(10.0), child: GameMenu(key: menuKey)),
        SubmitButton(onPressed: (() {
          final int id = menuKey.currentState?.selectedGameId as int;
          context.go(
              "/session/$id?title=${menuKey.currentState?.games[id].title}");
        }))
      ],
    );
  }
}
