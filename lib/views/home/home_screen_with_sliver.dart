import 'dart:math';

import 'package:f_shop_1/view_models/banner_view_model.dart';
import 'package:f_shop_1/views/home/widgets/home_banner_with_sliver.dart';
import 'package:f_shop_1/widgets/clamp_top_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class HomeScreenWithSliver extends StatelessWidget {
  HomeScreenWithSliver({super.key});
  final controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
              heroTag: 'fab_up',
              onPressed: () {
                controller.animateTo(
                  controller.position.minScrollExtent,
                  duration: const Duration(milliseconds: 400),
                  //animation style
                  curve: Curves.linear,
                );
              },
              child: const Icon(Icons.arrow_upward)),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton(
              heroTag: 'fab_down',
              onPressed: () {
                controller.animateTo(
                  controller.position.maxScrollExtent,
                  duration: const Duration(milliseconds: 400),
                  //animation style
                  curve: Curves.linear,
                );
              },
              child: const Icon(Icons.arrow_downward)),
        ],
      ),
      body: ClampTopCustomScrollView(controller: controller, slivers: [
        SliverAppBar(
          pinned: true,
          expandedHeight: 120.0,
          flexibleSpace: FlexibleSpaceBar(
            title: SvgPicture.asset('assets/logo.svg'),
          ),
          // leading: IconButton(
          //   iconSize: 24,
          //   icon: const Icon(Icons.menu),
          //   onPressed: () {},
          // ),
          // title: SvgPicture.asset('assets/logo.svg'),
          // centerTitle: true,
          // actions: [
          //   IconButton(
          //     iconSize: 24,
          //     icon: const Icon(Icons.search),
          //     onPressed: () {},
          //   ),
          //   IconButton(
          //     iconSize: 24,
          //     icon: const Icon(Icons.shopping_bag_outlined),
          //     onPressed: () {},
          //   )
          // ],
        ),
        ChangeNotifierProvider(
            create: (context) => BannerViewModel(),
            child: const HomeHeroWithSliver()),
        SliverToBoxAdapter(
          child: Container(
            height: 10,
            color: Colors.indigo,
          ),
        ),
        SliverPersistentHeader(
            pinned: true,
            delegate: _SliverAppBarDelegate(
              minHeight: 60.0,
              maxHeight: 200.0,
              child: Container(
                  color: Colors.lightBlue,
                  child: const Center(child: Text('headerTitle'))),
            )),
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200.0,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 4.0,
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.teal[100 * (index % 9)],
                child: Text('grid item $index'),
              );
            },
            childCount: 20,
          ),
        ),
        SliverSafeArea(
          top: false,
          // sliver: SliverList(
          //     // delegate: SliverChildBuilderDelegate(
          //     //     (_, __) => ConstrainedBox(
          //     //           constraints: BoxConstraints(
          //     //             minHeight: MediaQuery.sizeOf(context).height * 2,
          //     //           ),
          //     //           child: Column(
          //     //             mainAxisSize: MainAxisSize.min,
          //     //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     //             children: <Widget>[
          //     //               Container(
          //     //                 // A fixed-height child.
          //     //                 color: const Color(0xffeeee00), // Yellow
          //     //                 height: 120.0,
          //     //                 alignment: Alignment.center,
          //     //                 child: const Text('Fixed Height Content'),
          //     //               ),
          //     //               Container(
          //     //                 // Another fixed-height child.
          //     //                 color: const Color(0xff008000), // Green
          //     //                 height: 120.0,
          //     //                 alignment: Alignment.center,
          //     //                 child: const Text('Fixed Height Content'),
          //     //               ),
          //     //             ],
          //     //           ),
          //     //         ),
          //     //     childCount: 1)
          //     delegate: SliverChildListDelegate(
          //   [
          //     Container(
          //       // A fixed-height child.
          //       color: Colors.blueGrey, // Yellow
          //       height: 120.0,
          //       alignment: Alignment.center,
          //       child: const Text('Fixed Height Content'),
          //     ),
          //     ConstrainedBox(
          //       constraints: BoxConstraints(
          //         minHeight: MediaQuery.sizeOf(context).height * 2,
          //       ),
          //       child: Column(
          //         mainAxisSize: MainAxisSize.min,
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: <Widget>[
          //           Container(
          //             // A fixed-height child.
          //             color: const Color(0xffeeee00), // Yellow
          //             height: 120.0,
          //             alignment: Alignment.center,
          //             child: const Text('Fixed Height Content'),
          //           ),
          //           Container(
          //             // Another fixed-height child.
          //             color: const Color(0xff008000), // Green
          //             height: 120.0,
          //             alignment: Alignment.center,
          //             child: const Text('Fixed Height Content'),
          //           ),
          //         ],
          //       ),
          //     )
          //   ],
          // ))
          sliver: SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            sliver: SliverFixedExtentList(
              itemExtent: 50.0,
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.lightBlue[100 * (index % 10)],
                  child: Text('list item $index'),
                );
              }, childCount: 100),
            ),
          ),
        )
      ]),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });
  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;
  @override
  double get maxExtent => max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
