import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

AppBar defaultAppBar(BuildContext context, {required String title}) {
  return AppBar(
    leading: BackButton(onPressed: () => context.go("/"), color: Colors.white),
    title: Text(title, style: TextStyle(color: Colors.white)),
    centerTitle: true,
    backgroundColor: Color.fromARGB(255, 90, 38, 107),
  );
}
