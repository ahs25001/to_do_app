import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:to_do/tabs/taskes/task_item.dart';

import '../../styles/colors.dart';

class Tasks extends StatelessWidget {
  const Tasks({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [

        CalendarTimeline(
          shrink: true,
          initialDate: DateTime.now(),
          firstDate: DateTime.now().subtract(const Duration(days: 365)),
          lastDate: DateTime.now().add(const Duration(days: 365)),
          onDateSelected: (date) => print(date),
          leftMargin: 20,
          monthColor: primary,
          dayColor: Colors.grey,
          activeDayColor: Colors.white,
          activeBackgroundDayColor: primary,
          dotsColor: Colors.white,
          selectableDayPredicate: (date) => true,
          locale: 'en',
        ),
        Expanded(
            child: ListView.builder(itemBuilder: (context, index) => TaskItem(),itemCount: 6,))
      ],
    );
  }
}
