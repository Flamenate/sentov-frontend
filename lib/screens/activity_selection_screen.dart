import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sento_staff/widgets/activity_menu.dart';
import 'package:sento_staff/widgets/submit_button.dart';

final menuKey = GlobalKey<ActivityMenuState>();

class ActivitySelectionScreen extends StatelessWidget {
  const ActivitySelectionScreen(
      {super.key, required this.type, required this.route});

  final String type;
  final String route;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
            padding: EdgeInsets.all(10.0),
            child: ActivityMenu(key: menuKey, type: type)),
        SubmitButton(onPressed: (() {
          final int id = menuKey.currentState?.selectedActivityId as int;
          context.push(
              "$route/$id?title=${menuKey.currentState?.activities[id].title}");
        }))
      ],
    );
  }
}
