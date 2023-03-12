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
            padding: const EdgeInsets.symmetric(vertical: 8.0),
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
                RouteButton(
                    route: "/quest",
                    iconData: Icons.bookmarks_sharp,
                    text: "Register Quest"),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RouteButton(
                  route: "/shop",
                  iconData: Icons.shop_2_rounded,
                  text: "Register Shop Purchase"),
              RouteButton(
                  route: "/profile",
                  iconData: Icons.person,
                  text: "View Player Profile"),
            ],
          ),
          Expanded(
            child: Image.asset("assets/images/logo_big.png",
                width: MediaQuery.of(context).size.height / 4,
                height: MediaQuery.of(context).size.height / 4),
          )
        ],
      ),
    );
  }
}
