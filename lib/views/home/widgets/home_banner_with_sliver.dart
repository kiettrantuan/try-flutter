import 'package:f_shop_1/bloc/banner/banner_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeHeroWithSliver extends StatefulWidget {
  const HomeHeroWithSliver({super.key});

  @override
  State<HomeHeroWithSliver> createState() => _HomeHeroWithSliverState();
}

class _HomeHeroWithSliverState extends State<HomeHeroWithSliver> {
  final _pageController = PageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SliverFillRemaining(child: BlocBuilder<BannerBloc, BannerState>(
      builder: (ctx, state) {
        return Stack(
          children: [
            Container(
              color: Theme.of(context).colorScheme.inverseSurface,
            ),
            if (state is BannerError)
              const Center(
                child: Icon(Icons.broken_image, color: Colors.grey, size: 50),
              ),
            if (state is BannerLoading)
              const Center(child: CircularProgressIndicator()),
            if (state is BannerLoaded) _buildBannerList(state, screenWidth),
            if (state is BannerLoaded)
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: _buildPageIndicator(state),
                ),
              ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 48),
                child: _buildExploreButton(),
              ),
            ),
          ],
        );
      },
    ));
  }

  Widget _buildBannerList(BannerLoaded state, double screenWidth) {
    return ListView.builder(
      controller: _pageController,
      itemExtent: screenWidth,
      scrollDirection: Axis.horizontal,
      physics: const PageScrollPhysics().applyTo(const ClampingScrollPhysics()),
      itemCount: state.banners.length,
      itemBuilder: (ctx, idx) {
        return Image.network(
          state.banners[idx].imageUrl,
          width: screenWidth,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, progress) {
            if (progress == null) return child;
            return SizedBox(
              width: screenWidth,
              child: Center(
                child: CircularProgressIndicator(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  value: progress.expectedTotalBytes != null
                      ? (progress.cumulativeBytesLoaded /
                          progress.expectedTotalBytes!)
                      : null,
                ),
              ),
            );
          },
          errorBuilder: (_, __, ___) => const Center(
            child: Icon(Icons.broken_image, color: Colors.grey, size: 50),
          ),
        );
      },
    );
  }

  Widget _buildPageIndicator(BannerLoaded state) {
    return SmoothPageIndicator(
      controller: _pageController,
      count: state.banners.length,
      effect: const CustomizableEffect(
        spacing: 12,
        activeDotDecoration: DotDecoration(
          width: 7,
          height: 7,
          rotationAngle: 45,
          color: Colors.white,
          dotBorder: DotBorder(width: 1, color: Colors.white),
        ),
        dotDecoration: DotDecoration(
          width: 7,
          height: 7,
          rotationAngle: 45,
          color: Colors.transparent,
          dotBorder: DotBorder(width: 1, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildExploreButton() {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: Colors.black45,
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 30),
      ),
      onPressed: () {
        // Handle navigation or event here
      },
      child: Text(
        'Explore Collection'.toUpperCase(),
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
