import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sento_staff/router.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
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
