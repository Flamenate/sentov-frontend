import 'package:flutter/material.dart';
import 'package:sento_staff/models/player.dart';
import 'package:sento_staff/models/session.dart';
import 'package:sento_staff/services/player_service.dart';
import 'package:sento_staff/services/session_service.dart';
import 'package:sento_staff/widgets/player_id_form_field.dart';

class GameSessionForm extends StatefulWidget {
  const GameSessionForm(
      {super.key, required this.gameId, required this.updateParentState});

  final int gameId;
  final void Function(Session, Player) updateParentState;

  @override
  State<GameSessionForm> createState() => GameSessionFormState();
}

class GameSessionFormState extends State<GameSessionForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / 1.5,
            child: PlayerIdFormField(controller: _controller),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () => {
                          if (_formKey.currentState!.validate())
                            {_submitForm(context, 1)}
                        },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      minimumSize:
                          Size(MediaQuery.of(context).size.width / 4, 40),
                    ),
                    child: Text("Win", style: TextStyle(color: Colors.white))),
                ElevatedButton(
                    onPressed: () => {
                          if (_formKey.currentState!.validate())
                            {_submitForm(context, 2)}
                        },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow.shade500,
                      shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      minimumSize:
                          Size(MediaQuery.of(context).size.width / 4, 40),
                    ),
                    child: Text("Draw", style: TextStyle(color: Colors.black))),
                ElevatedButton(
                    onPressed: () => {
                          if (_formKey.currentState!.validate())
                            {_submitForm(context, 0)}
                        },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red.shade700,
                      shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      minimumSize:
                          Size(MediaQuery.of(context).size.width / 4, 40),
                    ),
                    child: Text("Loss", style: TextStyle(color: Colors.black))),
              ],
            ),
          )
        ]));
  }

  void _submitForm(BuildContext context, int result) {
    ScaffoldMessengerState scaffoldMessenger = ScaffoldMessenger.of(context);
    final int playerId = int.parse(_controller.text);
    _controller.clear();
    scaffoldMessenger.showSnackBar(
      const SnackBar(content: Text('Processing Session...')),
    );
    SessionService()
        .postSession(playerId, widget.gameId, result)
        .then((Session newSession) => setState(() {
              PlayerService()
                  .getPlayerById(newSession.playerId)
                  .then((Player newPlayer) {
                widget.updateParentState(newSession, newPlayer);
                scaffoldMessenger.clearSnackBars();
              });
            }));
  }
}
