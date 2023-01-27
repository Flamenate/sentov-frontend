import 'package:flutter/material.dart';

class PlayerIdFormField extends StatelessWidget {
  const PlayerIdFormField({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      maxLength: 4,
      controller: controller,
      validator: (String? value) {
        if (value == null ||
            value.isEmpty ||
            (int.tryParse(value) ?? 1001) > 1000) {
          return "ID must be 1000 or less.";
        }
        return null;
      },
      autocorrect: false,
      enableSuggestions: false,
      autofocus: false,
      style: TextStyle(fontSize: 20.0),
      decoration: InputDecoration(
        filled: true,
        fillColor: Color.fromARGB(132, 255, 255, 255),
        counterText: "",
        hintText: "Player ID",
        labelText: "ID",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
      ),
    );
  }
}
