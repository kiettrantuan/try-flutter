import 'package:f_shop_1/view_models/banner_view_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeHero extends StatefulWidget {
  const HomeHero({super.key});

  @override
  State<HomeHero> createState() => _HomeHeroState();
}

class _HomeHeroState extends State<HomeHero> {
  final _pageController = PageController();

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<BannerViewModel>(context, listen: false).fetchBanners();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height -
            (Scaffold.of(context).appBarMaxHeight ?? 0),
        width: MediaQuery.of(context).size.width,
        child: Consumer<BannerViewModel>(
          builder: (ctx, banner, child) => Stack(
            children: [
              Container(
                color: Theme.of(context)
                    .appBarTheme
                    .backgroundColor
                    ?.withAlpha(180),
              ),
              ListView.builder(
                cacheExtent:
                    MediaQuery.of(context).size.width * banner.banners.length,
                controller: _pageController,
                scrollDirection: Axis.horizontal,
                physics: const PageScrollPhysics()
                    .applyTo(const ClampingScrollPhysics()),
                itemCount: banner.banners.length,
                itemBuilder: (ctx, idx) => Image.network(
                  banner.banners[idx].imageUrl,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: SmoothPageIndicator(
                    controller: _pageController,
                    count:
                        banner.banners.isNotEmpty ? banner.banners.length : 1,
                    effect: const CustomizableEffect(
                      spacing: 12,
                      activeDotDecoration: DotDecoration(
                        width: 7,
                        height: 7,
                        rotationAngle: 45,
                        color: Colors.white,
                        dotBorder: DotBorder(
                          width: 1,
                          color: Colors.white,
                        ),
                      ),
                      dotDecoration: DotDecoration(
                        width: 7,
                        height: 7,
                        rotationAngle: 45,
                        color: Colors.transparent,
                        dotBorder: DotBorder(
                          width: 1,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 48),
                  child: TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.black45,
                        padding: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 30)),
                    onPressed: () {
                      Scaffold.of(ctx).openDrawer();
                      // context.go('/home-with-sliver');
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => const HomeScreenWithSliver()),
                      // );
                    },
                    child: Text(
                      'Explore Collection'.toUpperCase(),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
