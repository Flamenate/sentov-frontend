import 'package:flutter/material.dart';
import 'package:sento_staff/widgets/player_id_form_field.dart';
import 'package:sento_staff/widgets/submit_button.dart';

import '../widgets/default_app_bar.dart';
import '../widgets/item_menu.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  final TextEditingController _idFieldController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _menuKey = GlobalKey<ItemMenuState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: defaultAppBar(context, title: "Register Shop Purchase"),
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / 1.5,
            child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: PlayerIdFormField(
                  controller: _idFieldController,
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: ItemMenu(key: _menuKey),
          ),
          SubmitButton(onPressed: () {
            if (!_formKey.currentState!.validate() ||
                _menuKey.currentState!.selectedItemId < 0) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Your inputs are invalid.")),
              );
              _idFieldController.clear();
            }
            //TODO: POST to shop log
          })
        ]));
  }
}
