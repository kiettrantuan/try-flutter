import 'package:f_shop_1/view_models/banner_view_model.dart';
import 'package:f_shop_1/views/home/widgets/home_banner.dart';
import 'package:f_shop_1/widgets/clamp_top_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          iconSize: 24,
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        title: SvgPicture.asset('assets/logo.svg'),
        centerTitle: true,
        actions: [
          IconButton(
            iconSize: 24,
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            iconSize: 24,
            icon: const Icon(Icons.shopping_bag_outlined),
            onPressed: () {},
          )
        ],
      ),
      body: ClampTopSingleScrollView(
        child: Column(
          children: [
            ChangeNotifierProvider(
                create: (context) => BannerViewModel(),
                child: const HomeHero()),
            SafeArea(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.sizeOf(context).height * 2,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      // A fixed-height child.
                      color: const Color(0xffeeee00), // Yellow
                      height: 120.0,
                      alignment: Alignment.center,
                      child: const Text('Fixed Height Content'),
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
              ),
            )
          ],
        ),
        // SliverSafeArea(
        //     sliver: SliverList(
        //         delegate: SliverChildListDelegate([
        //   ConstrainedBox(
        //     constraints: BoxConstraints(
        //       minHeight: MediaQuery.sizeOf(context).height * 2,
        //     ),
        //     child: Column(
        //       mainAxisSize: MainAxisSize.min,
        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //       children: <Widget>[
        //         Container(
        //           // A fixed-height child.
        //           color: const Color(0xffeeee00), // Yellow
        //           height: 120.0,
        //           alignment: Alignment.center,
        //           child: const Text('Fixed Height Content'),
        //         ),
        //         Container(
        //           // Another fixed-height child.
        //           color: const Color(0xff008000), // Green
        //           height: 120.0,
        //           alignment: Alignment.center,
        //           child: const Text('Fixed Height Content'),
        //         ),
        //       ],
        //     ),
        //   ),
        // ])))
      ),
    );
  }
}

// fun

// body: CustomScrollView(
// physics: const BouncingScrollPhysics(),
// slivers: <Widget>[
// SliverAppBar(
// pinned: true,
// // stretch: _stretch,
// // onStretchTrigger: () async {
// //   // Triggers when stretching
// // },
// // // [stretchTriggerOffset] describes the amount of overscroll that must occur
// // // to trigger [onStretchTrigger]
// // //
// // // Setting [stretchTriggerOffset] to a value of 300.0 will trigger
// // // [onStretchTrigger] when the user has over-scrolled by 300.0 pixels.
// stretchTriggerOffset: 300.0,
// expandedHeight: 200.0,
//
// flexibleSpace: const FlexibleSpaceBar(
// title: Text('Open Fashion'),
// ),
// leading: IconButton(
// iconSize: 24,
// icon: const Icon(Icons.menu),
// onPressed: () {},
// ),
// title: SvgPicture.asset('assets/logo.svg'),
// centerTitle: true,
// actions: [
// IconButton(
// iconSize: 24,
// icon: const Icon(Icons.search),
// onPressed: () {},
// ),
// IconButton(
// iconSize: 24,
// icon: const Icon(Icons.shopping_bag_outlined),
// onPressed: () {},
// )
// ],
// ),
// SliverList(
// delegate: SliverChildBuilderDelegate(
// (BuildContext context, int index) {
// return Container(
// color: index.isOdd ? Colors.white : Colors.black12,
// height: 100.0,
// child: Center(
// child: Text('$index',
// textScaler: const TextScaler.linear(5.0)),
// ),
// );
// },
// childCount: 20,
// ),
// ),
// ],
// ),
