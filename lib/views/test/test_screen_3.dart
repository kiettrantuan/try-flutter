import 'package:f_shop_1/views/test/widgets/test_custom_child_layout.dart';
import 'package:f_shop_1/views/test/widgets/test_expandable_fab.dart';
import 'package:f_shop_1/views/test/widgets/test_flow.dart';
import 'package:f_shop_1/views/test/widgets/test_layout_builder.dart';
import 'package:flutter/material.dart';

class TestScreen3 extends StatelessWidget {
  const TestScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      // TRY THIS: Try changing the direction here and hot-reloading to
      // see the layout change.
      textDirection: TextDirection.ltr,
      child: Scaffold(
        // floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        floatingActionButton: ExpandableFab(distance: 112, children: [
          ActionButton(
            onPressed: () {}, // => _showAction(context, 0),
            icon: const Icon(Icons.format_size),
          ),
          ActionButton(
            onPressed: () {}, // => _showAction(context, 1),
            icon: const Icon(Icons.insert_photo),
          ),
          ActionButton(
            onPressed: () {}, // => _showAction(context, 2),
            icon: const Icon(Icons.videocam),
          ),
        ]),
        appBar: AppBar(
          title: const Row(
            children: [Icon(Icons.developer_mode), Text('Test3')],
          ),
        ),
        body: Stack(
          children: [
            Center(
              child: Column(
                children: [
                  Container(
                      color: Colors.black12,
                      width: 300,
                      height: 200,
                      child: const CustomMultiChildLayoutExample()),
                  Container(
                      color: Colors.black26,
                      width: 100,
                      height: 80,
                      child: CustomSingleChildLayout(
                        delegate:
                            CenteredWithOffsetLayoutDelegate(offset: 100.0),
                        child: Container(
                          width: 200,
                          height: 100,
                          color: Colors.yellow,
                          child: const Center(
                            child: Text(
                              'Hello!',
                              style: TextStyle(
                                  color: Colors.deepPurpleAccent, fontSize: 24),
                            ),
                          ),
                        ),
                      )),
                  const LayoutBuilderExample()
                ],
              ),
            ),
            // const FlowMenu()
          ],
        ),
      ),
    );
  }
}
