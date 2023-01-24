import 'package:flutter/material.dart';
import 'package:sento_staff/widgets/route_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Image.asset(
            "assets/images/logo_stripped.png",
            fit: BoxFit.contain,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 90, 38, 107),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RouteButton(
                    route: "/register",
                    iconData: Icons.post_add_rounded,
                    text: "Register Player Name"),
                RouteButton(
                    route: "/session",
                    iconData: Icons.gamepad_rounded,
                    text: "Register Game Session"),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RouteButton(
                  route: "/profile",
                  iconData: Icons.person,
                  text: "View Player Profile"),
              RouteButton(
                  route: "/shop",
                  iconData: Icons.shop_2_rounded,
                  text: "Register Shop Purchase"),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height / 16),
            child: SizedBox.square(
                dimension: MediaQuery.of(context).size.height / 4,
                child: Image.asset("assets/images/logo_big.png")),
          )
        ],
      ),
    );
  }
}
