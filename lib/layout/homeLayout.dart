import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/providers/my_provider.dart';
import 'package:to_do/styles/colors.dart';
import 'package:to_do/tabs/bottom_sheet/add_task.dart';

import '../tabs/settings/settings.dart';
import '../tabs/taskes/task_item.dart';
import '../tabs/taskes/task_tab.dart';

class HomeLayout extends StatefulWidget {
  static const String routName = "home";

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int index = 0;
  List<Widget> tabs = [Tasks(), Settings()];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Scaffold(
        extendBody: true,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: primary,
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () {
            openAddTaskSheet();
          },
          shape: const CircleBorder(
              side: BorderSide(
                width: 3,
            color: Colors.white,
          )),
        ),
        appBar: AppBar(
          title: Text(
            "To Do List",
          ),
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
              items: [
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
        body: tabs[index]);
  }

  openAddTaskSheet() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: AddTask(),
        );
      },
    );
  }
}
