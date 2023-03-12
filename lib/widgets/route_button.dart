import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RouteButton extends StatelessWidget {
  const RouteButton(
      {super.key,
      required this.route,
      required this.iconData,
      required this.text});

  final String route;
  final IconData iconData;
  final String text;

  @override
  Widget build(BuildContext context) {
    double buttonWidth = MediaQuery.of(context).size.width / 3.1;
    return ElevatedButton(
        onPressed: () => {context.push(route)},
        style: ElevatedButton.styleFrom(
            fixedSize: Size(buttonWidth, buttonWidth),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0)),
            elevation: 10,
            backgroundColor: Color.fromARGB(255, 90, 38, 107),
            surfaceTintColor: Colors.transparent,
            foregroundColor: Colors.red),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              iconData,
              size: 50,
              color: Color.fromARGB(255, 253, 192, 107),
            ),
            Text(text,
                style: TextStyle(
                    color: Color.fromARGB(255, 253, 192, 107),
                    fontFamily: "Unbounded",
                    fontSize: 14))
          ],
        ));
  }
}
