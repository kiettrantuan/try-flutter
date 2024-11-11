import 'package:flutter/material.dart';

/// A Simple Cascading Menu example using the [MenuAnchor] Widget.
class MyCascadingMenu extends StatefulWidget {
  const MyCascadingMenu({super.key});

  @override
  State<MyCascadingMenu> createState() => _MyCascadingMenuState();
}

class _MyCascadingMenuState extends State<MyCascadingMenu> {
  final FocusNode _buttonFocusNode = FocusNode(debugLabel: 'Menu Button');

  @override
  void dispose() {
    _buttonFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MenuAnchor(
      childFocusNode: _buttonFocusNode,
      menuChildren: <Widget>[
        MenuItemButton(
          onPressed: () {},
          child: const Text('Revert'),
        ),
        MenuItemButton(
          onPressed: () {},
          child: const Text('Setting'),
        ),
        MenuItemButton(
          onPressed: () {},
          child: const Text('Send Feedback'),
        ),
        SubmenuButton(menuChildren: [
          SubmenuButton(menuChildren: [
            MenuItemButton(
              onPressed: () {},
              child: const Text('Revert'),
            ),
            SubmenuButton(menuChildren: [
              MenuItemButton(
                onPressed: () {},
                child: const Text('Revert'),
              ),
              MenuItemButton(
                onPressed: () {},
                child: const Text('Setting'),
              ),
              MenuItemButton(
                onPressed: () {},
                child: const Text('Send Feedback'),
              )
            ], child: const Text('sub 2'))
          ], child: const Text('sub 3')),
          // MenuItemButton(
          //   onPressed: () {},
          //   child: const Text('Send Feedback'),
          // ),
          SubmenuButton(menuChildren: [
            MenuItemButton(
              onPressed: () {},
              child: const Text('Revert'),
            ),
            MenuItemButton(
              onPressed: () {},
              child: const Text('Setting'),
            ),
            MenuItemButton(
              onPressed: () {},
              child: const Text('Send Feedback'),
            )
          ], child: const Text('sub 2'))
        ], child: const Text('sub'))
      ],
      builder: (_, MenuController controller, Widget? child) {
        return IconButton.filled(
          focusNode: _buttonFocusNode,
          onPressed: () {
            if (controller.isOpen) {
              controller.close();
            } else {
              controller.open();
            }
          },
          icon: const Icon(Icons.more_vert),
        );
      },
    );
  }
}
