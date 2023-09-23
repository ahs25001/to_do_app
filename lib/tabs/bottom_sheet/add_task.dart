import 'package:flutter/material.dart';

import '../../styles/colors.dart';

class AddTask extends StatefulWidget {
  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  var titleController = TextEditingController();

  var descriptionController = TextEditingController();

  var selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            style: Theme.of(context).textTheme.bodyMedium!
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
              onPressed: () {},
              child: Text(
                "Add",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Colors.white),
              ))
        ],
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
