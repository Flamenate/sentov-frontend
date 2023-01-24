import 'package:flutter/material.dart';
import 'package:sento_staff/router.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: "Montserrat",
        scaffoldBackgroundColor: Color.fromARGB(255, 233, 219, 185),
      ),
    );
  }
}
