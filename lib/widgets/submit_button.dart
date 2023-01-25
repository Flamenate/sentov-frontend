import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({super.key, required this.onPressed});

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 90, 38, 107)),
        child: Text(
          "Submit",
          style: TextStyle(
              color: Color.fromARGB(255, 253, 192, 107),
              fontFamily: "Unbounded"),
        ));
  }
}
