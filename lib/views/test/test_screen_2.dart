import 'package:f_shop_1/views/example/example_screen.dart';
import 'package:f_shop_1/views/test/widgets/test_input.dart';
import 'package:f_shop_1/views/test/widgets/test_menu.dart';
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
      length: 4,
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
                      initialEntryMode: TimePickerEntryMode.input);
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
                const SnackBarExample()
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
            // ListView(
            //   children: const [
            //     Text("It's sunny here"),
            //     DatePickerExample(),
            //     // InputExample(),
            //   ],
            // ),
            const InputExample(),
            ListView(children: [
              const TestLayout1(),
              const TableExample(),
              ConstrainedBox(
                constraints: const BoxConstraints(maxHeight: 200),
                child: CarouselView(
                  itemSnapping: true,
                  itemExtent: 250,
                  shrinkExtent: 200,
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
              Container(
                color: Colors.black12,
                child: const ListBody(
                  mainAxis: Axis.vertical,
                  reverse: true,
                  children: <Widget>[
                    Text('Child 1'),
                    Text('Child 2'),
                    Text('Child 3'),
                  ],
                ),
              )
            ])
          ],
        ),
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
