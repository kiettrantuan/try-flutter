import 'package:f_shop_1/views/example/example_screen.dart';
import 'package:f_shop_1/views/test/widgets/test_progress_indicator.dart';
import 'package:f_shop_1/views/test/widgets/test_radio.dart';
import 'package:f_shop_1/views/test/widgets/test_slider.dart';
import 'package:f_shop_1/views/test/widgets/test_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TestScreen2 extends StatelessWidget {
  const TestScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
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
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 10.0,
          child: Row(
            children: <Widget>[
              FilledButton(
                child: const Icon(Icons.search),
                onPressed: () async {},
              ),
              const Spacer(),
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
                          backgroundColor: Colors.blue,
                          child: const Text('AH')),
                      label: const Text('Hamilton'),
                    ),
                    Chip(
                      avatar: CircleAvatar(
                          backgroundColor: Colors.blue,
                          child: const Text('ML')),
                      label: const Text('Lafayette'),
                    ),
                    Chip(
                      avatar: CircleAvatar(
                          backgroundColor: Colors.blue,
                          child: const Text('HM')),
                      label: const Text('Mulligan'),
                    ),
                    Chip(
                      avatar: CircleAvatar(
                          backgroundColor: Colors.blue,
                          child: const Text('JL')),
                      label: const Text('Laurens'),
                    ),
                  ],
                ),
                SliderExample(),
                RadioExample()
              ],
            ),
            ListView(
              children: [
                Text("It's sunny here"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
