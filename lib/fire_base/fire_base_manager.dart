import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:to_do/models/task_Model.dart';

class FireBaseOperations {
  static CollectionReference <TaskModel> getTasksCollection() {
    return FirebaseFirestore.instance
        .collection("Tasks")
        .withConverter<TaskModel>(
      fromFirestore: (snapshot, _) {
        return TaskModel.fromJson(snapshot.data()!);
      },
      toFirestore: (taskModel, _) {
        return taskModel.toJson();
      },
    );
  }

  static Future<void> addTasks(TaskModel taskModel) {
    var collection = getTasksCollection();
    var decRef = collection.doc();
    taskModel.id = decRef.id;
   return decRef.set(taskModel);
  }

  static Stream<QuerySnapshot<TaskModel>> getTask(DateTime date) {
    return getTasksCollection().where("date",isEqualTo:DateUtils.dateOnly(date).millisecondsSinceEpoch).snapshots();
  }

  static updateTask(TaskModel taskModel,
      {bool ?isDone, String?title, String?description, int ? date}) {
    if (isDone != null) {
      getTasksCollection().doc(taskModel.id).update({"isDone": isDone});
    }
    if (title != null) {
      getTasksCollection().doc(taskModel.id).update({"title": title});
    }
    if (description!=null) {
      getTasksCollection().doc(taskModel.id).update({"description":description});

    }
    if (date!=null) {
      getTasksCollection().doc(taskModel.id).update({"date":date});

    }
  }
 static deleteTask(TaskModel task){
    getTasksCollection().doc(task.id).delete();
  }

}
