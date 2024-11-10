import 'package:flutter/material.dart';

class LayoutBuilderExample extends StatefulWidget {
  const LayoutBuilderExample({super.key});

  @override
  State<LayoutBuilderExample> createState() => _LayoutBuilderExampleState();
}

class _LayoutBuilderExampleState extends State<LayoutBuilderExample> {
  bool isWideContainer = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
            onPressed: () {
              setState(() {
                isWideContainer = !isWideContainer;
              });
            },
            child: Text('toggle')),
        Container(
          width: isWideContainer ? 350 : 200,
          color: Colors.black38,
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              if (constraints.maxWidth < 300) {
                return Center(
                  child: Container(
                    height: 100.0,
                    width: 100.0,
                    color: Colors.blueGrey,
                  ),
                );
              } else {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Center(
                      child: Container(
                        height: 100.0,
                        width: 100.0,
                        color: Colors.blueGrey,
                      ),
                    ),
                    Center(
                      child: Container(
                        height: 100.0,
                        width: 100.0,
                        color: Colors.lime,
                      ),
                    )
                  ],
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
