import 'package:f_shop_1/services/api/banner.dart';
import 'package:f_shop_1/view_models/banner_view_model.dart';
import 'package:f_shop_1/view_models/cart_view_model.dart';
import 'package:f_shop_1/views/home/widgets/home_banner.dart';
import 'package:f_shop_1/views/home/widgets/home_colors.dart';
import 'package:f_shop_1/views/home/widgets/home_drawer.dart';
import 'package:f_shop_1/widgets/clamp_top_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
            builder: (ctx) => IconButton(
                  iconSize: 24,
                  icon: const Icon(Icons.menu),
                  onPressed: () {
                    Scaffold.of(ctx).openDrawer();
                  },
                )),
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
            icon: Consumer<CartViewModel>(
              builder: (_, cart, __) {
                return Badge.count(
                    isLabelVisible: cart.cartItems.keys.isNotEmpty,
                    count: cart.cartItems.keys.length,
                    child: const Icon(Icons.shopping_bag_outlined));
              },
            ),
            onPressed: () {
              context.go('/cart');
            },
          )
        ],
      ),
      body: ClampTopSingleScrollView(
        child: Column(
          children: [
            ChangeNotifierProvider(
                create: (context) => BannerViewModel(apiService: BannerApi()),
                child: const HomeHero()),
            const SafeArea(child: HomeColors())
            // SafeArea(
            //   child: ConstrainedBox(
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
            // ),
          ],
        ),
      ),
      drawer: const HomeDrawer(),
    );
  }
}
