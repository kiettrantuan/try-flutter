import 'package:f_shop_1/views/home/home_screen.dart';
import 'package:f_shop_1/views/home/home_screen_with_sliver.dart';
import 'package:f_shop_1/views/login/login_screen.dart';
import 'package:f_shop_1/views/test/test_screen.dart';
import 'package:f_shop_1/views/test/test_screen_2.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/login',
      builder: (BuildContext context, GoRouterState state) {
        return const LoginScreen();
      },
    ),
    GoRoute(
      // redirect: (BuildContext context, GoRouterState state) {
      //   if (!AuthState.of(context).isSignedIn) {
      //     return '/login';
      //   } else {
      //     return null;
      //   }
      // },
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'home-with-sliver',
          builder: (BuildContext context, GoRouterState state) {
            return const HomeScreenWithSliver();
          },
        ),
        GoRoute(
            path: 'test',
            builder: (BuildContext context, GoRouterState state) {
              return const TestScreen();
            },
            routes: [
              GoRoute(
                path: 'test2',
                builder: (BuildContext context, GoRouterState state) {
                  return const TestScreen2();
                },
              ),
            ]),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Open Fashion',
      // theme: ThemeData(
      //     useMaterial3: true,
      //     colorScheme: const ColorScheme(
      //       brightness: Brightness.light,
      //       primary: Colors.black,
      //       onPrimary: Colors.white,
      //       secondary: Colors.white,
      //       onSecondary: Colors.black,
      //       error: Colors.red,
      //       onError: Colors.white,
      //       surface: Colors.white,
      //       onSurface: Colors.black,
      //     ),
      //     appBarTheme: const AppBarTheme(backgroundColor: Color(0xFFE7EAEF))),
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFE7EAEF)),
          appBarTheme: const AppBarTheme(backgroundColor: Color(0xFFE7EAEF))),
      routerConfig: _router,
    );
  }
}
