import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: NavigationBar(destinations: [
      //   NavigationDestination(icon: Icon(Icons.iso), label: 'label'),
      //   NavigationDestination(icon: Icon(Icons.iso), label: 'label'),
      // ]),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10.0,
        child: Row(
          children: <Widget>[
            FilledButton(
              child: const Icon(Icons.search),
              onPressed: () {},
            ),
            const Spacer(),
            TextButton(onPressed: () {}, child: const Text('?!')),
            OutlinedButton(
              child: const Icon(Icons.favorite),
              onPressed: () {},
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go('/'),
        child: const Icon(Icons.home),
      ),
    );
  }
}
