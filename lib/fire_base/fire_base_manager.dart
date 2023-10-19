import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:to_do/models/task_Model.dart';
import 'package:to_do/models/user_model.dart';

class FireBaseOperations {
  static CollectionReference<TaskModel> getTasksCollection() {
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

  static Stream<QuerySnapshot<TaskModel>> getTask(DateTime date, String id) {
    return getTasksCollection()
        .where("userid", isEqualTo: id)
        .where("date",
            isEqualTo: DateUtils.dateOnly(date).millisecondsSinceEpoch)
        .snapshots();
  }

  static updateTask(TaskModel taskModel) {
    getTasksCollection().doc(taskModel.id).update(taskModel.toJson());
  }

  static deleteTask(TaskModel task) {
    getTasksCollection().doc(task.id).delete();
  }

  static Future<void> createAccount(
      {required String email,
      required String password,
      required Function onSuccess,
      required Function onError,
      required String firstName,
      required String lastName,
      required int age}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      UserModel user = UserModel(
          id: credential.user!.uid,
          firstName: firstName,
          lastName: lastName,
          age: age,
          email: email);
      credential.user?.sendEmailVerification();
      FireBaseOperations.addUserToFirestore(user);
      onSuccess();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        onError(e.message);
      } else if (e.code == 'email-already-in-use') {
        onError(e.message);
      }
    } catch (e) {
      print(e);
    }
  }

  static CollectionReference<UserModel> getUserCollection() {
    return FirebaseFirestore.instance
        .collection("Users")
        .withConverter<UserModel>(
      fromFirestore: (snapshot, _) {
        return UserModel.fromJson(snapshot.data()!);
      },
      toFirestore: (value, options) {
        return value.toJson();
      },
    );
  }

  static Future<void> addUserToFirestore(UserModel user) {
    var collection = getUserCollection();
    var decRef = collection.doc(user.id);
    return decRef.set(user);
  }

  static Future<void> login(String email, String password, Function onSuccess,
      Function onError) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if (credential.user!.emailVerified) {
        onSuccess();
      } else {
        onError("Pleas verify your email!");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
        onError("user not found or password or mail is wrong");
      }
    }
  }

  static Future<UserModel?> getUser(String id) async {
    DocumentSnapshot<UserModel> snapshot =
        await getUserCollection().doc(id).get();
    return snapshot.data();
  }
}
