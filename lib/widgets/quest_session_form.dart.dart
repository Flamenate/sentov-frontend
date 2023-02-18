import 'package:flutter/material.dart';
import 'package:sento_staff/models/player.dart';
import 'package:sento_staff/models/session.dart';
import 'package:sento_staff/services/player_service.dart';
import 'package:sento_staff/services/session_service.dart';
import 'package:sento_staff/widgets/player_id_form_field.dart';
import 'package:sento_staff/widgets/submit_button.dart';

class QuestSessionForm extends StatefulWidget {
  const QuestSessionForm(
      {super.key, required this.questId, required this.updateParentState});

  final int questId;
  final void Function(Session, Player) updateParentState;

  @override
  State<QuestSessionForm> createState() => QuestSessionFormState();
}

class QuestSessionFormState extends State<QuestSessionForm> {
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
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(children: [
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 1.5,
              child: PlayerIdFormField(controller: _controller),
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: SubmitButton(onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _submitForm(context);
                }
              }))
        ]));
  }

  void _submitForm(BuildContext context) {
    ScaffoldMessengerState scaffoldMessenger = ScaffoldMessenger.of(context);
    scaffoldMessenger.showSnackBar(
      const SnackBar(content: Text('Processing Session...')),
    );
    SessionService()
        .postSession(int.parse(_controller.text), widget.questId, 1)
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
