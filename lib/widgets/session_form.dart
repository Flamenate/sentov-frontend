import 'package:flutter/material.dart';

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
            child: TextFormField(
              keyboardType: TextInputType.number,
              maxLength: 4,
              controller: _idFieldController,
              validator: (String? value) {
                if (value == null ||
                    value.isEmpty ||
                    (int.tryParse(value) ?? 1001) > 1000) {
                  return "ID must be less than 1001";
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
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0)),
              ),
            ),
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
