import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todoo/models/tasks_model.dart';

class FirebaseManager {
  static CollectionReference<TaskModel> getTasksCollection() {
    return FirebaseFirestore.instance
        .collection("Tasks")
        .withConverter<TaskModel>(
      fromFirestore: (snapshot, _) {
        return TaskModel.fromJson(snapshot.data()!);
      },
      toFirestore: (task, _) {
        return task.toJson();
      },
    );
  }

  static Future<void> addTask(TaskModel task) {
    var collection = getTasksCollection();
    var docRef = collection.doc();
    task.id = docRef.id;
    return docRef.set(task);
  }

  static Stream<QuerySnapshot<TaskModel>> getTasks(DateTime data) {
    return getTasksCollection()
        .where("data",
            isEqualTo: DateUtils.dateOnly(data).millisecondsSinceEpoch)
        .snapshots();
  }

  static Future<void> deleteTasks(String taskId) {
    return getTasksCollection().doc(taskId).delete();
  }

  static Future<void> updateTask(TaskModel model) async {
    await getTasksCollection().doc(model.id).update(model.toJson());
  }
}
