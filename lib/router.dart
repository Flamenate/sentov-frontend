import 'package:go_router/go_router.dart';
import 'package:sento_staff/screens/home_screen.dart';
import 'package:sento_staff/screens/leaderboard_screen.dart';
import 'package:sento_staff/screens/profile_screen.dart';
import 'package:sento_staff/screens/quest_screen.dart';
import 'package:sento_staff/screens/register_screen.dart';
import 'package:sento_staff/screens/session_screen.dart';
import 'package:sento_staff/screens/shop_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => RegisterScreen(),
    ),
    GoRoute(
        path: '/session',
        builder: (context, state) => SessionScreen(),
        routes: [
          GoRoute(
              path: ":id",
              builder: (context, state) => SessionScreen(
                    gameId: int.tryParse(state.params["id"] ?? "x"),
                    gameTitle: state.queryParams["title"],
                  ))
        ]),
    GoRoute(
      path: '/shop',
      builder: (context, state) => ShopScreen(),
    ),
    GoRoute(
      path: '/leaderboard',
      builder: (context, state) => LeaderboardScreen(),
    ),
    GoRoute(
        path: '/profile',
        builder: (context, state) => ProfileScreen(),
        routes: [
          GoRoute(
            path: ':id',
            builder: (context, state) =>
                ProfileScreen(id: int.tryParse(state.params["id"] ?? "x")),
          ),
        ]),
    GoRoute(
        path: '/quest',
        builder: (context, state) => QuestScreen(),
        routes: [
          GoRoute(
              path: ":id",
              builder: (context, state) => QuestScreen(
                    questId: int.tryParse(state.params["id"] ?? "x"),
                    questTitle: state.queryParams["title"],
                  ))
        ]),
  ],
);
