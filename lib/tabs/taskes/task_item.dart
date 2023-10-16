import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:to_do/fire_base/fire_base_manager.dart';
import 'package:to_do/providers/my_provider.dart';
import 'package:to_do/styles/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:to_do/tabs/update/update.dart';

import '../../models/task_Model.dart';

class TaskItem extends StatelessWidget {
  final TaskModel taskModel;

  const TaskItem(this.taskModel, {super.key});

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Slidable(
        closeOnScroll: true,
        startActionPane: ActionPane(motion: StretchMotion(), children: [
          SlidableAction(
            onPressed: (context) {
              FireBaseOperations.deleteTask(taskModel);
            },
            backgroundColor: Colors.red,
            icon: Icons.delete,
            borderRadius: (provider.local == "en")
                ? const BorderRadius.only(
                topLeft: Radius.circular(18),
                bottomLeft: Radius.circular(18))
                : const BorderRadius.only(
                topRight: Radius.circular(18),
                bottomRight: Radius.circular(18)),
            label: AppLocalizations.of(context)!.delete,
          ),
          SlidableAction(
            onPressed: (context) {
              Navigator.pushNamed(context, UpDateScreen.routName,
                  arguments: taskModel);
            },
            backgroundColor: primary,
            icon: Icons.edit,
            label: AppLocalizations.of(context)!.edite,
          )
        ]),
        child: Card(
          color: Theme.of(context).colorScheme.onError,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  width: 4,
                  height: 70,
                  decoration: BoxDecoration(
                      color: (taskModel.isDone) ? Colors.green : primary,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                          color:
                          (taskModel.isDone) ? Colors.green : primary)),
                ),
                SizedBox(
                  width: 18,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      taskModel.title,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(
                        color:
                        (taskModel.isDone) ? Colors.green : primary,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      taskModel.description,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(
                          color:
                          Theme.of(context).colorScheme.onPrimary),
                    )
                  ],
                ),
                const Spacer(),
                (taskModel.isDone)
                    ? ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green),
                    onPressed: () {},
                    child: Text(AppLocalizations.of(context)!.done))
                    : ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: primary),
                    onPressed: () {
                      FireBaseOperations.updateTask(taskModel,
                          isDone: true);
                    },
                    child: Icon(Icons.done))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
