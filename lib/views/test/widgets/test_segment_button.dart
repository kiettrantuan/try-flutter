import 'package:flutter/material.dart';

class SegmentedButtonExample extends StatefulWidget {
  const SegmentedButtonExample({super.key});

  @override
  State<SegmentedButtonExample> createState() => _SegmentedButtonExampleState();
}

enum Calendar { day, week, month, year }

class _SegmentedButtonExampleState extends State<SegmentedButtonExample> {
  Set<Calendar> calendarView = {};

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<Calendar>(
      style: SegmentedButton.styleFrom(
        backgroundColor: Colors.grey[200],
        foregroundColor: Colors.red,
        selectedForegroundColor: Colors.white,
        selectedBackgroundColor: Colors.green,
      ),
      segments: const <ButtonSegment<Calendar>>[
        ButtonSegment<Calendar>(
            value: Calendar.day,
            label: Text('D'),
            icon: Icon(Icons.calendar_view_day)),
        ButtonSegment<Calendar>(
            value: Calendar.week,
            label: Text('W'),
            icon: Icon(Icons.calendar_view_week)),
        ButtonSegment<Calendar>(
            value: Calendar.month,
            label: Text('M'),
            icon: Icon(Icons.calendar_view_month)),
        ButtonSegment<Calendar>(
            value: Calendar.year,
            label: Text('Y'),
            icon: Icon(Icons.calendar_today)),
      ],
      selected: calendarView,
      multiSelectionEnabled: true,
      emptySelectionAllowed: true,
      onSelectionChanged: (Set<Calendar> newSelection) {
        setState(() {
          calendarView = newSelection;
        });
      },
    );
  }
}
