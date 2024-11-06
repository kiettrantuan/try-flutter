import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      onDestinationSelected: (desIdx) {
        context.go(destinations[desIdx].link);
      },
      selectedIndex: 0,
      children: [
        const DrawerHeader(
          child: Text('Header'),
        ),
        ...destinations.map((des) => NavigationDrawerDestination(
              label: Text(des.label),
              icon: des.icon,
              selectedIcon: des.selectedIcon,
            )),

        // ListTile(
        //   title: const Text('Home with Sliver'),
        //   onTap: () {
        //     context.go('/home-with-sliver');
        //   },
        // ),
        // ListTile(
        //   title: const Text('Login'),
        //   onTap: () {
        //     context.go('/login');
        //   },
        // ),
      ],
    );
  }
}

class DrawerDestination {
  const DrawerDestination(this.label, this.icon, this.selectedIcon, this.link);

  final String label;
  final Widget icon;
  final Widget selectedIcon;

  // TODO: test purpose only
  final String link;
}

const List<DrawerDestination> destinations = <DrawerDestination>[
  DrawerDestination('Home', Icon(Icons.home_outlined), Icon(Icons.home), '/'),
  DrawerDestination('Home with Sliver', Icon(Icons.other_houses_outlined),
      Icon(Icons.other_houses), '/home-with-sliver'),
  DrawerDestination(
      'Test', Icon(Icons.logo_dev_outlined), Icon(Icons.logo_dev), '/test'),
  DrawerDestination(
      'Login', Icon(Icons.login_outlined), Icon(Icons.login), '/login'),
];
