import 'package:flutter/material.dart';
import 'package:to_do/fire_base/fire_base_manager.dart';
import 'package:to_do/models/task_Model.dart';

import '../../styles/colors.dart';

class AddTask extends StatefulWidget {
  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  var titleController = TextEditingController();

  var descriptionController = TextEditingController();

  var selectedDate = DateTime.now();
  var formKey= GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Text(
                "Add New Task",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Theme.of(context).colorScheme.onPrimary),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              validator: (value) {
                if(value==null||value.isEmpty)
                  {
                    return "enter title";
                  }
              },
              controller: titleController,
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
                if(value==null||value.isEmpty)
                  {
                    return "enter description";
                  }
              },
              controller: descriptionController,
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
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onPrimary),
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
                      date: DateUtils.dateOnly(selectedDate).millisecondsSinceEpoch);
                  FireBaseOperations.addTasks(task);
                       Navigator.pop(context);
                },
                child: Text(
                  "Add",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Colors.white),
                ))
          ],
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
    setState(() {});
  }
}
