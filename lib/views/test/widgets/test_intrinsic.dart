import 'package:flutter/material.dart';

/// Use when you want vertically aligned widgets to have
/// the same height, based on the tallest widget.
///
/// IntrinsicHeight makes both Containers match the height of
/// the taller child (Text in the red container).
///
/// Without IntrinsicHeight, each container would only be
/// as tall as its content.
class IntrinsicHeightExample extends StatelessWidget {
  const IntrinsicHeightExample({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: 100,
            color: Colors.blue,
            child: const Text(
              'Short text',
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            width: 100,
            color: Colors.red,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Longer text that requires more height hey hey hey',
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Use when you want horizontally aligned widgets to have a combined
/// width based on their content, without stretching.
///
/// IntrinsicWidth makes the Row take up only the required width to
/// fit the content of both Containers, rather than stretching
/// across the available space.
///
/// This is useful if you want widgets to only occupy the space
/// they need, aligning closely with their content's width.
class IntrinsicWidthExample extends StatelessWidget {
  const IntrinsicWidthExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12,
      child: IntrinsicWidth(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 50,
              color: Colors.blue,
              child: const Text(
                'Button',
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              height: 50,
              color: Colors.red,
              child: const Text(
                'Wider Button Text',
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
