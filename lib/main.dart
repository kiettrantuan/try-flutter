import 'package:f_shop_1/bloc/banner/banner_bloc.dart';
import 'package:f_shop_1/bloc/cart/cart_bloc.dart';
import 'package:f_shop_1/services/api_service.dart';
import 'package:f_shop_1/view_models/cart_view_model.dart';
import 'package:f_shop_1/views/cart/cart_screen.dart';
import 'package:f_shop_1/views/cart/cart_screen_with_bloc.dart';
import 'package:f_shop_1/views/home/home_screen.dart';
import 'package:f_shop_1/views/home/home_screen_with_sliver.dart';
import 'package:f_shop_1/views/login/login_screen.dart';
import 'package:f_shop_1/views/test/test_screen.dart';
import 'package:f_shop_1/views/test/test_screen_2.dart';
import 'package:f_shop_1/views/test/test_screen_3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

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
          path: 'cart',
          builder: (BuildContext context, GoRouterState state) {
            return const CartScreen();
          },
        ),
        GoRoute(
            path: 'home-with-sliver',
            builder: (BuildContext context, GoRouterState state) {
              return HomeScreenWithSliver();
            },
            routes: <RouteBase>[
              GoRoute(
                path: 'cart-with-bloc',
                builder: (BuildContext context, GoRouterState state) {
                  return const CartScreenWithBloc();
                },
              ),
            ]),
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
              GoRoute(
                path: 'test3',
                builder: (BuildContext context, GoRouterState state) {
                  return const TestScreen3();
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
    return MultiBlocProvider(
      providers: [
        BlocProvider<CartBloc>(create: (_) => CartBloc()),
        BlocProvider<BannerBloc>(
            create: (_) =>
                BannerBloc(apiService: ApiService())..add(FetchBanners())),
      ],
      child: MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => CartViewModel())],
        child: MaterialApp.router(
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
              colorScheme:
                  ColorScheme.fromSeed(seedColor: const Color(0xFFE7EAEF)),
              appBarTheme:
                  const AppBarTheme(backgroundColor: Color(0xFFE7EAEF))),
          routerConfig: _router,
        ),
      ),
    );
  }
}
