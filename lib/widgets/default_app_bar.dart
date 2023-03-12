import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

AppBar defaultAppBar(BuildContext context, {required String title}) {
  return AppBar(
    leading: BackButton(
        onPressed: () => context.push("/"),
        color: Color.fromARGB(255, 253, 192, 107)),
    title: Text(title,
        style: TextStyle(
            color: Color.fromARGB(255, 253, 192, 107),
            fontFamily: "Unbounded",
            fontSize: 20.0)),
    centerTitle: true,
    backgroundColor: Color.fromARGB(255, 90, 38, 107),
  );
}
