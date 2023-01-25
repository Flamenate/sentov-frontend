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
      children: [
        GameMenu(key: menuKey),
        SubmitButton(
            onPressed: () =>
                context.go("/session/${menuKey.currentState?.selectedGameId}"))
      ],
    );
  }
}
