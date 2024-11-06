import 'package:flutter/material.dart';

class ClampTopCustomScrollView extends StatefulWidget {
  final List<Widget> slivers;

  const ClampTopCustomScrollView({super.key, required this.slivers});

  @override
  State<ClampTopCustomScrollView> createState() =>
      _ClampTopCustomScrollViewState();
}

class _ClampTopCustomScrollViewState extends State<ClampTopCustomScrollView> {
  final controller = ScrollController();

  @override
  void initState() {
    controller.addListener(() {
      if (controller.position.pixels < 0) controller.jumpTo(0);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      controller: controller,
      slivers: widget.slivers,
    );
  }
}

class ClampTopSingleScrollView extends StatefulWidget {
  final Widget child;

  const ClampTopSingleScrollView({super.key, required this.child});

  @override
  State<ClampTopSingleScrollView> createState() =>
      _ClampTopSingleScrollViewState();
}

class _ClampTopSingleScrollViewState extends State<ClampTopSingleScrollView> {
  final controller = ScrollController();

  @override
  void initState() {
    controller.addListener(() {
      if (controller.position.pixels < 0) controller.jumpTo(0);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      controller: controller,
      child: widget.child,
    );
  }
}
