import 'package:flutter/material.dart';
import 'package:sento_staff/widgets/player_id_form_field.dart';

class SessionForm extends StatefulWidget {
  const SessionForm({super.key, required this.onSubmit});

  final void Function(BuildContext context) onSubmit;

  @override
  State<SessionForm> createState() => _SessionFormState();
}

class _SessionFormState extends State<SessionForm> {
  final TextEditingController _idFieldController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _idFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / 1.5,
            child: PlayerIdFormField(controller: _idFieldController),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () => {
                          if (_formKey.currentState!.validate())
                            {widget.onSubmit(context)}
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
                            {widget.onSubmit(context)}
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
                            {widget.onSubmit(context)}
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
}
