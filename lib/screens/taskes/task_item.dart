import 'package:flutter/material.dart';
import 'package:to_do/styles/colors.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                width: 4,
                height: 70,
                decoration: BoxDecoration(
                    color: primary,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: primary)),
              ),
              SizedBox(width: 18,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Task title",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(height: 4,),
                  Text("Task description",style: Theme.of(context).textTheme.bodySmall,)
                ],
              ),
              Spacer(),
              ElevatedButton(onPressed: () {}, child: Icon(Icons.done))
            ],
          ),
        ),
      ),
    );
  }
}
