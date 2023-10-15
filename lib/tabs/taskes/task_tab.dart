import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:to_do/fire_base/fire_base_manager.dart';
import 'package:to_do/tabs/taskes/task_item.dart';

import '../../models/task_Model.dart';
import '../../styles/colors.dart';

class Tasks extends StatefulWidget {
  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CalendarTimeline(
          // shrink: true,
          initialDate:selectedDate,
          firstDate: DateTime.now().subtract(const Duration(days: 365)),
          lastDate: DateTime.now().add(const Duration(days: 365)),
          onDateSelected: (date) {
            selectedDate=date;
            setState(() {

            });
          },
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
            child: StreamBuilder<QuerySnapshot<TaskModel>>(
          stream: FireBaseOperations.getTask(selectedDate),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return const Center(child: Text("Error"));
            }
            var tasks = snapshot.data!.docs.map((doc) => doc.data()).toList()??[];
            return ListView.builder(
              itemBuilder: (context, index) {
                return TaskItem(tasks[index]);
              },
              itemCount: tasks.length,
            );
          },
        ))
      ],
    );
  }
}
