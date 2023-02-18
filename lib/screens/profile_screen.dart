import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:sento_staff/models/player.dart';
import 'package:sento_staff/services/player_service.dart';
import 'package:sento_staff/widgets/default_app_bar.dart';
import 'package:sento_staff/widgets/player_id_form_field.dart';
import 'package:sento_staff/widgets/submit_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key, this.id});
  final int? id;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _idController = TextEditingController();
  final TextStyle _subtitleStyle = TextStyle(
      fontFamily: "Unbounded",
      fontSize: 20.0,
      color: Color.fromARGB(255, 90, 38, 107));
  final TextStyle _contentStyle =
      TextStyle(fontSize: 18.0, color: Colors.black);
  final TextStyle _subcontentStyle =
      TextStyle(color: Colors.black54, fontSize: 13.0);
  Player _player = Player.placeholder();

  @override
  void initState() {
    super.initState();
    if (widget.id != null) {
      PlayerService().getPlayerById(widget.id!).then(((player) {
        setState(() {
          _player = player;
        });
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget body;
    if (_player.id == -1) {
      body = Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 1.5,
              child: Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: PlayerIdFormField(controller: _idController)),
            ),
          ),
          SubmitButton(onPressed: () {
            if (!_formKey.currentState!.validate()) {
              return;
            }
            context.go("/profile/${_idController.text}");
          })
        ],
      );
    } else {
      body = Column(
        children: [
          SizedBox(
              height: MediaQuery.of(context).size.height / 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                        _player.name.isNotEmpty ? _player.name : "UNNAMED",
                        style: TextStyle(
                            fontFamily: "Unbounded",
                            fontSize: 25.0,
                            color: Color.fromARGB(255, 90, 38, 107))),
                  ),
                  Text("ID: ${_player.id}", style: _subcontentStyle),
                ],
              )),
          Column(
            children: [
              Text("Level:", style: _subtitleStyle),
              Text(_player.level.toString(), style: _contentStyle),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.25,
                      child: LinearProgressIndicator(
                        value: 0.4,
                        valueColor:
                            AlwaysStoppedAnimation<Color>(Colors.red.shade900),
                        backgroundColor: Color.fromARGB(255, 90, 38, 107),
                      ),
                    ),
                    Text("XP: ${_player.xp} / 70,000", style: _subcontentStyle)
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Balance:", style: _subtitleStyle),
                Text(
                    "\$${NumberFormat.currency(symbol: '', decimalDigits: 0).format(_player.balance)}",
                    style: _contentStyle),
              ],
            ),
          ),
        ],
      );
    }
    return Scaffold(
        appBar: defaultAppBar(context, title: "View Player Profile"),
        body: body);
  }
}
