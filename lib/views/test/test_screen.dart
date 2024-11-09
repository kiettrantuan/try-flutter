import 'package:f_shop_1/views/test/widgets/test_indexed_stack.dart';
import 'package:f_shop_1/views/test/widgets/test_segment_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future<String?> showMyDialog() async {
      return showDialog<String>(
        context: context,
        // barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('AlertDialog Title'),
            content: const SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('This is a demo alert dialog.'),
                  Text('Would you like to approve of this message?'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Approve'),
                onPressed: () {
                  context.pop('Approve');
                },
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      // bottomNavigationBar: NavigationBar(destinations: [
      //   NavigationDestination(icon: Icon(Icons.iso), label: 'label'),
      //   NavigationDestination(icon: Icon(Icons.iso), label: 'label'),
      // ]),
      // bottomSheet: BottomSheet(
      //     showDragHandle: true,
      //     onClosing: () {},
      //     builder: (_) => const CardExample()),
      appBar: AppBar(title: const Icon(Icons.developer_mode)),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10.0,
        child: Row(
          children: <Widget>[
            FilledButton(
              child: const Icon(Icons.search),
              onPressed: () async {
                var txt = await showMyDialog();
                print(txt);
                // showDialog(
                //     context: context,
                //     builder: (_) => AlertDialog(
                //           title: const Text('data'),
                //           content: const Text('datax'),
                //           actions: [
                //             TextButton(
                //                 onPressed: () => context.pop('No'),
                //                 child: const Text('No')),
                //             TextButton(
                //                 onPressed: () => context.pop('Yes'),
                //                 child: const Text('Yes'))
                //           ],
                //         ));
              },
            ),
            const Spacer(),
            const ShowBottomSheetExample(),
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
        // icon: const Icon(Icons.home),
        // label: Text("abc xx"),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            // A fixed-height child.
            color: const Color(0xffeeee00), // Yellow
            height: 120.0,
            alignment: Alignment.center,
            child: const Text('Fixed Height Content'),
          ),
          const Divider(
            indent: 20,
            endIndent: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: () => context.go('/test/test2'),
                child: const Text('Test2')),
          ),
          const Divider(
            indent: 20,
            endIndent: 20,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: SegmentedButtonExample(),
          ),
          const Divider(
            indent: 20,
            endIndent: 20,
          ),
          IndexedStackExample(),
          ...ListTile.divideTiles(context: context, tiles: [
            const ListTile(
              title: Text('Horse'),
            ),
            const ListTile(
              title: Text('Cow'),
            ),
            const ListTile(
              title: Text('Camel'),
            ),
            const ListTile(
              title: Text('Sheep'),
            ),
            const ListTile(
              title: Text('Goat'),
            ),
          ]),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 2,
          ),
          Container(
            // Another fixed-height child.
            color: const Color(0xff008000), // Green
            height: 120.0,
            alignment: Alignment.center,
            child: const Text('Fixed Height Content'),
          ),
        ],
      ),
    );
  }
}

class ShowBottomSheetExample extends StatelessWidget {
  const ShowBottomSheetExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        child: const Text('?!'),
        onPressed: () {
          Scaffold.of(context).showBottomSheet(
            (BuildContext context) {
              return SizedBox(
                height: 200,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Text('Hello from Persistent Bottom Sheet'),
                      ElevatedButton(
                        child: const Text('Open Modal BottomSheet'),
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (_) => SafeArea(
                              child: Center(
                                child: ElevatedButton(
                                  child: const Text('Close'),
                                  onPressed: () {
                                    context.pop();
                                  },
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      ElevatedButton(
                        child: const Text('Close BottomSheet'),
                        onPressed: () {
                          context.pop();
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class CardExample extends StatelessWidget {
  const CardExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              leading: Icon(Icons.album),
              title: Text('The Enchanted Nightingale'),
              subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: const Text('BUY TICKETS'),
                  onPressed: () {/* ... */},
                ),
                const SizedBox(width: 8),
                TextButton(
                  child: const Text('LISTEN'),
                  onPressed: () {/* ... */},
                ),
                const SizedBox(width: 8),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
