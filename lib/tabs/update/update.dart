import 'package:flutter/material.dart';

import '../../fire_base/fire_base_manager.dart';
import '../../models/task_Model.dart';
import '../../styles/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UpDateScreen extends StatefulWidget {
  static const String routName = "update";

  @override
  State<UpDateScreen> createState() => _UpDateScreenState();
}

class _UpDateScreenState extends State<UpDateScreen> {
  var formKey=GlobalKey<FormState>();
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
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Center(
                      child: Text(
                        AppLocalizations.of(context)!.editTask,
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
                          return AppLocalizations.of(context)!.enterTitle;
                        }
                      },
                      controller: titleController,
                      onTap: () => titleController.clear(),
                      decoration: InputDecoration(
                        label: Text(AppLocalizations.of(context)!.taskTitle),
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
                          return AppLocalizations.of(context)!.enterDescription;
                        }
                      },
                      controller: descriptionController,
                      onTap: () => descriptionController.clear(),
                      decoration: InputDecoration(
                        label: Text(AppLocalizations.of(context)!.taskDescription),
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
                      AppLocalizations.of(context)!.selectTime,
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
                          if(formKey.currentState!.validate()) {
                            TaskModel task = TaskModel(
                                title: titleController.text,
                                description: descriptionController.text,
                                date: DateUtils
                                    .dateOnly(selectedDate)
                                    .millisecondsSinceEpoch);
                            FireBaseOperations.updateTask(args,
                                description: descriptionController.text,
                                date: DateUtils
                                    .dateOnly(selectedDate)
                                    .millisecondsSinceEpoch,
                                title: titleController.text);
                            Navigator.pop(context);
                          }
                        },
                        child: Text(
                         AppLocalizations.of(context)!.done,
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
