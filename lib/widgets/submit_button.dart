import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({super.key, required this.onPressed});

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 240, 250, 255)),
        child: Text("Submit"));
  }
}
