import 'dart:async';

import 'package:flutter/material.dart';

class ProgressIndicatorExample extends StatefulWidget {
  const ProgressIndicatorExample({super.key});

  @override
  State<ProgressIndicatorExample> createState() =>
      _ProgressIndicatorExampleState();
}

class _ProgressIndicatorExampleState extends State<ProgressIndicatorExample>
    with TickerProviderStateMixin {
  // late AnimationController controller;
  bool determinate = false;
  double _progressValue = 0.0;
  Timer? _timer;

  @override
  void initState() {
    // controller = AnimationController(
    //   /// [AnimationController]s can be created with `vsync: this` because of
    //   /// [TickerProviderStateMixin].
    //   vsync: this,
    //   duration: const Duration(seconds: 2),
    // )..addListener(() {
    //     setState(() {});
    //   });
    // controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    // controller.dispose();
    super.dispose();
  }

  void startProgress() {
    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {
        // Increment the progress value by a small amount.
        _progressValue =
            double.parse((_progressValue + 0.01).toStringAsFixed(2));
        // Stop the timer when progress is complete.
        if (_progressValue >= 1.0) {
          _timer?.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'Linear progress indicator',
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 30),
          LinearProgressIndicator(
            value: determinate ? _progressValue : null,
            semanticsLabel: 'Linear progress indicator',
          ),
          const SizedBox(height: 10),
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  'determinate Mode ${(_progressValue * 100).round()}',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              Switch(
                thumbIcon: WidgetStateProperty.resolveWith<Icon?>(
                    (Set<WidgetState> states) {
                  if (states.contains(WidgetState.selected)) {
                    return const Icon(Icons.close);
                  }
                  return const Icon(Icons
                      .check); // All other states will use the default thumbIcon.
                }),
                value: determinate,
                onChanged: (bool value) {
                  setState(() {
                    determinate = value;
                    if (determinate) {
                      _progressValue = 0.0;
                      // controller.stop();
                      startProgress();
                    } else {
                      _timer?.cancel();
                      _progressValue = 0.0;
                      // controller
                      //   ..forward(from: controller.value)
                      //   ..repeat();
                    }
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
