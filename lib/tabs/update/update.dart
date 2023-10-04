import 'package:flutter/material.dart';

import '../../fire_base/fire_base_manager.dart';
import '../../models/task_Model.dart';
import '../../styles/colors.dart';

class UpDateScreen extends StatefulWidget {
  static const String routName = "update";

  @override
  State<UpDateScreen> createState() => _UpDateScreenState();
}

class _UpDateScreenState extends State<UpDateScreen> {
  var titleController = TextEditingController();

  var descriptionController = TextEditingController();

  var selectedDate = DateTime.now();
  bool edited=false;
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as TaskModel;
    if(!edited) {
      titleController.text = args.title;
      descriptionController.text = args.description;
      selectedDate = DateTime.fromMillisecondsSinceEpoch(args.date!);
    }
    return Scaffold(
      appBar: AppBar(title: Text("To Do")),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Center(
          child: Card(
            child: Container(
              color: Theme.of(context).colorScheme.onError,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: Text(
                      "Edit Task",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "enter title";
                      }
                    },
                    controller: titleController,
                    onTap: () => titleController.clear(),
                    decoration: InputDecoration(
                      label: Text("title"),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(23),
                          borderSide: BorderSide(color: primary)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(23),
                          borderSide: BorderSide(color: primary)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(23),
                          borderSide: BorderSide(color: primary)),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "enter description";
                      }
                    },
                    controller: descriptionController,
                    onTap: () => descriptionController.clear(),
                    decoration: InputDecoration(
                      label: Text("description"),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(23),
                          borderSide: BorderSide(color: primary)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(23),
                          borderSide: BorderSide(color: primary)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(23),
                          borderSide: BorderSide(color: primary)),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Select Time",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      selectDate();
                    },
                    child: Center(
                        child: Text(
                      selectedDate.toString().substring(0, 10),
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: primary),
                    )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(23)),
                          backgroundColor: primary),
                      onPressed: () {
                        TaskModel task = TaskModel(
                            title: titleController.text,
                            description: descriptionController.text,
                            date: DateUtils.dateOnly(selectedDate)
                                .millisecondsSinceEpoch);
                        FireBaseOperations.updateTask(args,
                            description: descriptionController.text,
                            date: DateUtils.dateOnly(selectedDate)
                                .millisecondsSinceEpoch,
                            title: titleController.text);
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Done",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: Colors.white),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  selectDate() async {
    DateTime? chosenDate = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 365)));
    if (chosenDate == null) {
      selectedDate = DateTime.now();
    } else {
      selectedDate = chosenDate;
    }
    edited=true;
    setState(() {});
  }
}
