import 'package:flutter/material.dart';

class ClampTopCustomScrollView extends StatefulWidget {
  final List<Widget> slivers;
  final ScrollController controller;

  ClampTopCustomScrollView({
    super.key,
    required this.slivers,
    ScrollController? controller,
  }) : controller = controller ?? ScrollController();

  @override
  State<ClampTopCustomScrollView> createState() =>
      _ClampTopCustomScrollViewState();
}

class _ClampTopCustomScrollViewState extends State<ClampTopCustomScrollView> {
  @override
  void initState() {
    widget.controller.addListener(() {
      if (widget.controller.position.pixels < 0) {
        widget.controller.jumpTo(0);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      controller: widget.controller,
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
