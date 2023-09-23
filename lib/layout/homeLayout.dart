import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:to_do/screens/taskes/task_item.dart';
import 'package:to_do/styles/colors.dart';

class HomeLayout extends StatefulWidget {
  static const String routName = "home";

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton:FloatingActionButton(
        backgroundColor: primary,
        child: Icon(Icons.add),
        onPressed: (){},
        shape:const CircleBorder(side: BorderSide(color: Colors.white,)),
      ),
      backgroundColor: mintGreen,
      appBar: AppBar(
        title: Text("To Do List",style: Theme.of(context).textTheme.bodyLarge,),
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 8,
        shape: const CircularNotchedRectangle(),
        child: BottomNavigationBar(
            currentIndex: index,
            onTap: (value) {
              index = value;
              setState(() {});
            },
            items: const [
              BottomNavigationBarItem(
                  icon: ImageIcon(
                      AssetImage("assets/images/Icon awesome-list.png")),
                  label: ""),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                      AssetImage("assets/images/Icon feather-settings.png")),
                  label: ""),
            ]),
      ),
      body: Column(
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
      ),
    );
  }
}
