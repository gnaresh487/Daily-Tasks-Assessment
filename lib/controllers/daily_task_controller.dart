import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workruit_assessment/custom_widgets/custom_snackbar.dart';
import 'package:workruit_assessment/utils/app.dart';
import 'package:workruit_assessment/utils/constants.dart';
import 'package:workruit_assessment/utils/preference_helper.dart';

class DailyTaskController extends GetxController {
  late TextEditingController addTaskController;
  RxList taskList = [].obs;

  @override
  void onInit() {
    super.onInit();
    addTaskController = TextEditingController();
  }

  ///adding daily task to Daily Task List
  void addTask(task) {
    taskList.add(task);
    addTaskController.clear();
  }

  /// edit Daily Task List
  void editTask(index, task) {
    taskList[index] = task;
    addTaskController.clear();
  }

  @override
  void dispose() {
    addTaskController.dispose();
    super.dispose();
  }
}
