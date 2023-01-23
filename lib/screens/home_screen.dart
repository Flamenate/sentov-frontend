import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: FittedBox(
              fit: BoxFit.cover,
              child: Image.asset(
                'assets/logo_big.png',
                opacity: AlwaysStoppedAnimation<double>(0.4),
              ),
            ),
          ),
          SizedBox.expand(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => {context.go("/register")},
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(200, 50),
                      fixedSize: Size(300, 75),
                      maximumSize: Size(400, 100),
                      shape: StadiumBorder(),
                      elevation: 20,
                      backgroundColor: Colors.blue.shade800),
                  child: Text("Register Player Name",
                      style:
                          const TextStyle(fontSize: 20, color: Colors.white)),
                ),
                ElevatedButton(
                  onPressed: () => {context.go("/session")},
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(200, 50),
                      fixedSize: Size(300, 75),
                      maximumSize: Size(400, 100),
                      shape: StadiumBorder(),
                      elevation: 20,
                      backgroundColor: Colors.cyan.shade900),
                  child: Text("Register Game Session",
                      style:
                          const TextStyle(fontSize: 20, color: Colors.white)),
                ),
                ElevatedButton(
                  onPressed: () => {context.go("/profile")},
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(200, 50),
                      fixedSize: Size(300, 75),
                      maximumSize: Size(400, 100),
                      shape: StadiumBorder(),
                      elevation: 20,
                      backgroundColor: Colors.purple.shade700),
                  child: Text("View Player Profile",
                      style:
                          const TextStyle(fontSize: 20, color: Colors.white)),
                ),
                ElevatedButton(
                  onPressed: () => {context.go("/shop")},
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(200, 50),
                      fixedSize: Size(300, 75),
                      maximumSize: Size(400, 100),
                      shape: StadiumBorder(),
                      elevation: 20,
                      backgroundColor: Colors.purple.shade900),
                  child: Text("Register Shop Purchase",
                      style:
                          const TextStyle(fontSize: 20, color: Colors.white)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
