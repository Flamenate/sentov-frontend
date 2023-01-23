import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  final double topPadding = 50.0;

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
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                height: (MediaQuery.of(context).size.height - topPadding) / 4,
                child: ElevatedButton(
                  onPressed: () => {context.go("/register")},
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(350, 100),
                      shape: StadiumBorder(),
                      backgroundColor: Colors.blue.shade800),
                  child: Text("Register Player Name",
                      style:
                          const TextStyle(fontSize: 20, color: Colors.white)),
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                height: (MediaQuery.of(context).size.height - topPadding) / 4,
                child: ElevatedButton(
                  onPressed: () => {context.go("/session")},
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(350, 100),
                      shape: StadiumBorder(),
                      backgroundColor: Colors.cyan.shade900),
                  child: Text("Register Game Session",
                      style:
                          const TextStyle(fontSize: 20, color: Colors.white)),
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                height: (MediaQuery.of(context).size.height - topPadding) / 4,
                child: ElevatedButton(
                  onPressed: () => {context.go("/profile")},
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(350, 100),
                      shape: StadiumBorder(),
                      backgroundColor: Colors.purple.shade700),
                  child: Text("View Player Profile",
                      style:
                          const TextStyle(fontSize: 20, color: Colors.white)),
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                height: (MediaQuery.of(context).size.height - topPadding) / 4,
                child: ElevatedButton(
                  onPressed: () => {context.go("/shop")},
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(350, 100),
                      shape: StadiumBorder(),
                      backgroundColor: Colors.purple.shade900),
                  child: Text("Register Shop Purchase",
                      style:
                          const TextStyle(fontSize: 20, color: Colors.white)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
