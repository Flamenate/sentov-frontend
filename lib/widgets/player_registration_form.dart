import 'package:flutter/material.dart';

import 'player_id_form_field.dart';

class PlayerRegistrationForm extends StatefulWidget {
  const PlayerRegistrationForm(
      {super.key, required this.idController, required this.nameController});

  final TextEditingController idController;
  final TextEditingController nameController;

  @override
  State<PlayerRegistrationForm> createState() => PlayerRegistrationFormState();
}

class PlayerRegistrationFormState extends State<PlayerRegistrationForm> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
              child: PlayerIdFormField(controller: widget.idController),
            ),
          ),
          Expanded(
            flex: 3,
            child: TextFormField(
              focusNode: FocusNode(),
              controller: widget.nameController,
              autocorrect: false,
              enableSuggestions: false,
              autofocus: false,
              style: TextStyle(fontSize: 20.0),
              validator: (String? value) {
                if (value == null || value.trim().isEmpty) {
                  return "Please input a name.";
                }
                return null;
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: Color.fromARGB(132, 255, 255, 255),
                hintText: "Player Name",
                labelText: "Name",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
