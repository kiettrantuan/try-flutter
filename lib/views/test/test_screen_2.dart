import 'package:f_shop_1/views/example/example_screen.dart';
import 'package:f_shop_1/views/test/widgets/test_progress_indicator.dart';
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
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.cloud_outlined),
              ),
              Tab(
                icon: Icon(Icons.beach_access_sharp),
              ),
              Tab(
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
                  destinations: destinations
                      .map((d) => NavigationRailDestination(
                          icon: d.icon, label: Text(d.label)))
                      .toList(),
                  selectedIndex: 0,
                  elevation: 5,
                ),
                // const VerticalDivider(),
                const BackButton()
              ],
            ),
            ListView(
              children: [
                Text("It's rainy here"),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: LinearProgressIndicator(),
                ),
                Center(child: CircularProgressIndicator()),
                ProgressIndicatorExample()
              ],
            ),
            const Center(
              child: Text("It's sunny here"),
            ),
          ],
        ),
      ),
    );
  }
}
