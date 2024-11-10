import 'package:flutter/material.dart';

class OffstageExample extends StatefulWidget {
  const OffstageExample({super.key});

  @override
  State<OffstageExample> createState() => _OffstageExampleState();
}

class _OffstageExampleState extends State<OffstageExample> {
  final GlobalKey _key = GlobalKey();
  bool _offstage = true;

  Size _getFlutterLogoSize() {
    final RenderBox renderLogo =
        _key.currentContext!.findRenderObject()! as RenderBox;
    return renderLogo.size;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('$_offstage'),
        Offstage(
          offstage: _offstage,
          child: Container(
            key: _key,
            width: 100,
            height: 100,
            color: Colors.yellow,
            child: const OverflowBox(
                maxHeight: 250,
                maxWidth: 250,
                child: FlutterLogo(
                  size: 300,
                )),
          ),
        ),
        ColoredBox(
          color: Colors.deepPurpleAccent,
          child: SizedOverflowBox(
            size: const Size(100, 100),
            child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _offstage = !_offstage;
                  });
                },
                child: const Text('toggle offstage')),
          ),
        ),
        if (_offstage)
          ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content:
                        Text('yellow box size is ${_getFlutterLogoSize()}'),
                  ),
                );
              },
              child: const Text('get size'))
      ],
    );
  }
}
