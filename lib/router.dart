import 'package:go_router/go_router.dart';
import 'package:sento_staff/screens/home_screen.dart';
import 'package:sento_staff/screens/session_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
        path: '/session',
        builder: (context, state) => SessionScreen(),
        routes: [
          GoRoute(
            path: ':game',
            builder: (context, state) =>
                SessionScreen(game: state.params["game"]),
          ),
        ]),
    GoRoute(
      path: '/shop',
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
        path: '/profile',
        builder: (context, state) => HomeScreen(),
        routes: [
          GoRoute(
            path: ':id',
            builder: (context, state) => HomeScreen(),
            //id: state.params['id']
          ),
        ]),
  ],
);
