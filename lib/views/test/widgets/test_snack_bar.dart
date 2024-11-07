import 'package:flutter/material.dart';

class SnackBarExample extends StatefulWidget {
  const SnackBarExample({super.key});

  @override
  State<SnackBarExample> createState() => _SnackBarExampleState();
}

class _SnackBarExampleState extends State<SnackBarExample> {
  bool floating = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          child: const Text('Show SnackBar'),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                action: SnackBarAction(
                  label: 'Action',
                  onPressed: () {
                    // Code to execute.
                  },
                ),
                content: const Text('Awesome SnackBar!'),
                duration: const Duration(milliseconds: 1500),
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0, // Inner padding for SnackBar content.
                ),
                behavior: floating ? SnackBarBehavior.floating : null,
                width: floating ? 280.0 : null, // Width of the SnackBar.
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            );
          },
        ),
        Row(
          children: [
            Checkbox(
                value: floating,
                onChanged: (_) {
                  setState(() {
                    floating = !floating;
                  });
                }),
            const Text('Floating')
          ],
        )
      ],
    );
  }
}
