import 'package:flutter/material.dart';
import 'package:sento_staff/widgets/submit_button.dart';

import '../widgets/appbar.dart';
import '../widgets/player_registration_form.dart';

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
            //TODO: PATCH player
          })
        ]));
  }
}
