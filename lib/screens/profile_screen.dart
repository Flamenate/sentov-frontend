import 'dart:math';

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
      fontSize: 22.0,
      color: Color.fromARGB(255, 90, 38, 107));
  final TextStyle _contentStyle =
      TextStyle(fontSize: 20.0, color: Colors.black);
  final TextStyle _subcontentStyle =
      TextStyle(color: Colors.black54, fontSize: 15.0);
  Player _player = Player.placeholder();
  List<String> _quests = ["No quests yet."];

  @override
  void initState() {
    super.initState();
    if (widget.id != null) {
      PlayerService().getPlayerById(widget.id!).then((Player player) {
        if (player.id == -1) {
          return ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("No player was found with that id.")),
          );
        }
        setState(() {
          _player = player;
          PlayerService().getAllQuests(player.id).then((List<String> quests) {
            setState(() {
              _quests = quests;
            });
          });
        });
      });
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
            context.push("/profile/${_idController.text}");
          })
        ],
      );
    } else {
      final xpLimit = nextLevel(_player.level! + 1);
      body = Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Center(
                child: Text(_player.name.isNotEmpty ? _player.name : "UNNAMED",
                    style: TextStyle(
                        fontFamily: "Unbounded",
                        fontSize: 32.0,
                        color: Color.fromARGB(255, 90, 38, 107))),
              ),
              Text("ID: ${_player.id}", style: _subcontentStyle),
            ],
          ),
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
                        value: _player.xp / xpLimit,
                        valueColor:
                            AlwaysStoppedAnimation<Color>(Colors.red.shade900),
                        backgroundColor: Color.fromARGB(255, 90, 38, 107),
                      ),
                    ),
                    Text("XP: ${_player.xp} / $xpLimit",
                        style: _subcontentStyle)
                  ],
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Balance:", style: _subtitleStyle),
              Text(
                  "金 ${NumberFormat.currency(symbol: '', decimalDigits: 0).format(_player.balance)}",
                  style: _contentStyle),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Last Played Quest", style: _subtitleStyle),
              Text(
                _player.lastQuest ?? "Has not played any quests yet.",
                style: _contentStyle,
              ),
              Text("Last Played Game", style: _subtitleStyle),
              Text(
                _player.lastGame ?? "Has not played any games yet.",
                style: _contentStyle,
              ),
            ],
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Played Quests",
                  style: _subtitleStyle,
                ),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: _quests.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                          leading: Icon(Icons.balance_outlined),
                          title: Text(_quests[index]));
                    },
                  ),
                )
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

  nextLevel(currentLevel) {
    const baseXP = 1000;
    const exponent = 1.5;

    return (baseXP * (pow(currentLevel, exponent))).floor();
  }
}
