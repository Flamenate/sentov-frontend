import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sento_staff/models/player.dart';
import 'package:sento_staff/services/player_service.dart';
import 'package:sento_staff/widgets/submit_button.dart';

import 'package:sento_staff/widgets/default_app_bar.dart';
import 'package:sento_staff/widgets/player_registration_form.dart';

final key = GlobalKey<PlayerRegistrationFormState>();

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController idFieldController = TextEditingController();
  final TextEditingController nameFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: defaultAppBar(context, title: "Register Player Name"),
        body: Column(children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: PlayerRegistrationForm(
                key: key,
                idController: idFieldController,
                nameController: nameFieldController),
          ),
          SubmitButton(onPressed: () {
            if (!key.currentState!.formKey.currentState!.validate()) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Your inputs are invalid.")),
              );
              idFieldController.clear();
              nameFieldController.clear();
              return;
            }

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Updating...")),
            );
            PlayerService()
                .getPlayerById(int.parse(idFieldController.text))
                .then(((Player value) {
              final playerJson = jsonDecode(value.toJson());
              playerJson["name"] = nameFieldController.text;
              final player = Player.fromJson(playerJson);
              ScaffoldMessenger.of(context).clearSnackBars();
              PlayerService().putPlayer(player).then((Player value) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text(
                          "Player (${value.id})'s name was updated to ${value.name}.")),
                );
              });
            }));
            idFieldController.clear();
            nameFieldController.clear();
          })
        ]));
  }
}
