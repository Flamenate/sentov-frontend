import 'package:go_router/go_router.dart';
import 'package:sento_staff/screens/home_screen.dart';
import 'package:sento_staff/screens/profile_screen.dart';
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
                  ))
        ]),
    GoRoute(
      path: '/shop',
      builder: (context, state) => ShopScreen(),
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
  ],
);
