import 'package:flutter/material.dart';

import '../../fire_base/fire_base_manager.dart';
import '../../models/task_Model.dart';
import '../../styles/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UpDateScreen extends StatefulWidget {
  static const String routName = "update";
  TaskModel taskModel;

  UpDateScreen({super.key, required this.taskModel});

  @override
  State<UpDateScreen> createState() => _UpDateScreenState();
}

class _UpDateScreenState extends State<UpDateScreen> {
  var formKey = GlobalKey<FormState>();
  var titleController = TextEditingController();

  var descriptionController = TextEditingController();

  var selectedDate = DateTime.now();
  bool edited = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    titleController.text = widget.taskModel.title;
    descriptionController.text = widget.taskModel.description;
    selectedDate = DateTime.fromMillisecondsSinceEpoch(widget.taskModel.date!);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("To Do")),
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
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return AppLocalizations.of(context)!.enterTitle;
                        }
                        return null;
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
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return AppLocalizations.of(context)!.enterDescription;
                        }
                        return null;
                      },
                      controller: descriptionController,
                      onTap: () => descriptionController.clear(),
                      decoration: InputDecoration(
                        label:
                            Text(AppLocalizations.of(context)!.taskDescription),
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
                    const SizedBox(height: 10),
                    Text(
                      AppLocalizations.of(context)!.selectTime,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary),
                    ),
                    const SizedBox(
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
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(23)),
                            backgroundColor: primary),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            // TaskModel task = TaskModel(
                            //   userid: FirebaseAuth.instance.currentUser!.uid,
                            //     title: titleController.text,
                            //     description: descriptionController.text,
                            //     date: DateUtils
                            //         .dateOnly(selectedDate)
                            //         .millisecondsSinceEpoch);
                            widget.taskModel.description = descriptionController.text;
                            widget.taskModel.date = DateUtils.dateOnly(selectedDate)
                                .millisecondsSinceEpoch;
                            widget.taskModel.title = titleController.text;
                            FireBaseOperations.updateTask(widget.taskModel);
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
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: Theme.of(context).colorScheme.primary,
                onPrimary: Theme.of(context).colorScheme.onError,
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.black,
                ),
              ),
            ),
            child: child!,
          );
        },
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 365)));
    if (chosenDate == null) {
      selectedDate = DateTime.now();
    } else {
      selectedDate = chosenDate;
    }
    edited = true;
    setState(() {});
  }
}
