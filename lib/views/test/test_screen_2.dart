import 'dart:math';

import 'package:f_shop_1/views/example/example_screen.dart';
import 'package:f_shop_1/views/test/widgets/test_day_picker.dart';
import 'package:f_shop_1/views/test/widgets/test_input.dart';
import 'package:f_shop_1/views/test/widgets/test_intrinsic.dart';
import 'package:f_shop_1/views/test/widgets/test_menu.dart';
import 'package:f_shop_1/views/test/widgets/test_offstage.dart';
import 'package:f_shop_1/views/test/widgets/test_progress_indicator.dart';
import 'package:f_shop_1/views/test/widgets/test_radio.dart';
import 'package:f_shop_1/views/test/widgets/test_slider.dart';
import 'package:f_shop_1/views/test/widgets/test_snack_bar.dart';
import 'package:f_shop_1/views/test/widgets/test_table.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TestScreen2 extends StatelessWidget {
  const TestScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 5,
      child: Scaffold(
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 10.0,
          child: Row(
            children: <Widget>[
              const MyCascadingMenu(),
              const Spacer(),
              OutlinedButton(
                child: const Icon(Icons.schedule),
                onPressed: () {
                  Future<TimeOfDay?> selectedTime = showTimePicker(
                          initialTime: TimeOfDay.now(),
                          context: context,
                          initialEntryMode: TimePickerEntryMode.input)
                      .then((_time) {
                    print(_time);
                    return _time;
                  });
                  // showDatePicker(context: context, firstDate: firstDate, lastDate: lastDate)
                },
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () => context.go('/'),
          child: const Icon(Icons.home),
        ),
        appBar: AppBar(
          title: const Row(
            children: [Icon(Icons.developer_mode), Text('Test2')],
          ),
          bottom: TabBar(
            tabs: <Widget>[
              const Tab(
                icon: Badge(
                  label: Text('Cloud'),
                  backgroundColor: Colors.blueAccent,
                  child: Icon(Icons.cloud_outlined),
                ),
              ),
              Tab(
                icon: Badge.count(
                    count: 1000, child: const Icon(Icons.beach_access_sharp)),
              ),
              const Tab(
                icon: Icon(Icons.brightness_5_sharp),
              ),
              const Tab(
                icon: Icon(Icons.account_balance),
              ),
              const Tab(
                icon: Icon(Icons.add),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Row(
              children: [
                NavigationRail(
                  destinations: List.generate(
                      destinations.length,
                      (idx) => NavigationRailDestination(
                          icon: destinations[idx].icon,
                          label: Text(destinations[idx].label))),
                  selectedIndex: 0,
                  elevation: 5,
                ),
                // const VerticalDivider(),
                const BackButton(),
                const Column(
                  children: [
                    SnackBarExample(),
                    IntrinsicHeightExample(),
                    IntrinsicWidthExample()
                  ],
                ),
              ],
            ),
            ListView(
              children: const [
                Text("It's rainy here"),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: LinearProgressIndicator(),
                ),
                Center(child: CircularProgressIndicator()),
                ProgressIndicatorExample(),
                Wrap(
                  spacing: 8.0, // gap between adjacent chips
                  runSpacing: 4.0, // gap between lines
                  children: <Widget>[
                    Chip(
                      avatar: CircleAvatar(
                          backgroundColor: Colors.blue, child: Text('AH')),
                      label: Text('Hamilton'),
                    ),
                    Chip(
                      avatar: CircleAvatar(
                          backgroundColor: Colors.blue, child: Text('ML')),
                      label: Text('Lafayette'),
                    ),
                    Chip(
                      avatar: CircleAvatar(
                          backgroundColor: Colors.blue, child: Text('HM')),
                      label: Text('Mulligan'),
                    ),
                    Chip(
                      avatar: CircleAvatar(
                          backgroundColor: Colors.blue, child: Text('JL')),
                      label: Text('Laurens'),
                    ),
                  ],
                ),
                SliderExample(),
                RadioExample()
              ],
            ),
            const InputExample(),
            ListView(children: [
              const TestLayout1(),
              const TableExample(),
              ConstrainedBox(
                constraints: const BoxConstraints(maxHeight: 200),
                child: CarouselView(
                  itemSnapping: true,
                  itemExtent: 300,
                  shrinkExtent: 100,
                  padding: const EdgeInsets.all(20.0),
                  elevation: 10,
                  children: List.generate(
                    10,
                    (index) => Image.network(
                      'https://picsum.photos/400?random=$index',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              FractionallySizedBox(
                // heightFactor: 0.1,
                widthFactor: 0.3,
                alignment: Alignment.centerRight,
                child: Container(color: Colors.cyan, child: const Text('data')),
              ),
              const OffstageExample(),
              const RotatedBox(
                quarterTurns: 3,
                child: Text('RotatedBox'),
              ),
              Transform(
                alignment: Alignment.topRight,
                transform: Matrix4.skewY(0.3)..rotateZ(-pi / 7.0),
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  color: const Color(0xFFE8581C),
                  child: const Text('Apartment for rent!'),
                ),
              ),
              for (var i = 1; i < 4; i++)
                // Only Effect on Child has Unbound Parent
                LimitedBox(
                  maxHeight: 50,
                  child: Container(
                    color: Color.fromRGBO(50, 250, 50, i * 0.1),
                  ),
                )
            ]),
            TestLayout2(),
          ],
        ),
      ),
    );
  }
}

class TestLayout2 extends StatelessWidget {
  const TestLayout2({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.black12,
      child: ListView(
        reverse: true,
        children: <Widget>[
          const Text('Child 1'),
          Container(
              color: Colors.brown,
              height: 100,
              width: 100,
              child: const Baseline(
                baseline: 80,
                baselineType: TextBaseline.alphabetic,
                child: Text(
                  'Baseline 80 / 100',
                  style: TextStyle(color: Colors.white),
                ),
              )),
          const Text('Child 3'),
          DatePickerExample(),
          // Row(
          //   children: [
          //     Expanded(
          //       flex: 2,
          //       child: Container(
          //         color: Colors.amber,
          //         height: 60,
          //         child: FittedBox(
          //           fit: BoxFit.cover,
          //           child: Image.network(
          //             'https://picsum.photos/400?random=10',
          //           ),
          //         ),
          //       ),
          //     ),
          //     Container(
          //       color: Colors.red,
          //       height: 50,
          //       width: 100,
          //       child: FittedBox(
          //         fit: BoxFit.cover,
          //         clipBehavior: Clip.hardEdge,
          //         child: Image.network(
          //           'https://picsum.photos/400?random=11',
          //         ),
          //       ),
          //     ),
          //     Expanded(
          //       flex: 5,
          //       child: Container(
          //         color: Colors.amber,
          //         height: 60,
          //         child: FittedBox(
          //           fit: BoxFit.contain,
          //           child: Image.network(
          //             'https://picsum.photos/50?random=12',
          //           ),
          //         ),
          //       ),
          //     ),
          //     Container(
          //       color: Colors.blue,
          //       height: 70,
          //       width: 100,
          //       child: FittedBox(
          //         alignment: Alignment.bottomRight,
          //         fit: BoxFit.scaleDown,
          //         child: Image.network(
          //           'https://picsum.photos/50?random=13',
          //         ),
          //       ),
          //     ),
          //     Expanded(
          //       child: Container(
          //         color: Colors.amber,
          //         height: 60,
          //         child: FittedBox(
          //           fit: BoxFit.fitWidth,
          //           child: Image.network(
          //             'https://picsum.photos/400?random=14',
          //           ),
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}

class TestLayout1 extends StatelessWidget {
  const TestLayout1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width,
      color: Colors.black12,
      child: GridView.count(
        // physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        // shrinkWrap: true,
        crossAxisCount: 2,
        children: [
          Container(
            color: Colors.indigo,
            alignment: Alignment.center,
            child: AspectRatio(
              aspectRatio: 9 / 16,
              child: Container(
                color: Colors.red,
              ),
            ),
          ),
          Container(
            color: Colors.blueAccent,
          ),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.cyan,
          ),
          Container(
            color: Colors.indigo,
          ),
          Container(
            color: Colors.blueAccent,
          ),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.cyan,
          ),
          Container(
            color: Colors.indigo,
          ),
          Container(
            color: Colors.blueAccent,
          ),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.cyan,
          ),
          Container(
            color: Colors.indigo,
          ),
          Container(
            color: Colors.blueAccent,
          ),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.cyan,
          ),
        ],
      ),
    );
  }
}
