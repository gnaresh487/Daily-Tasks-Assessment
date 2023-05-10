import 'package:flutter/material.dart';
import 'package:workruit_assessment/controllers/daily_task_controller.dart';
import 'package:workruit_assessment/custom_widgets/custom_text_field.dart';

displayDialog(BuildContext context,
    {required DailyTaskController dailyTaskController,
    required bool isEditTask,
    int? index}) {
  final formKey = GlobalKey<FormState>();
  showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
            title: const Text('Add Task'),
            content: Form(
              key: formKey,
              child: CustomTextField(
                textEditingController: dailyTaskController.addTaskController,
                labelText: 'Daily Task',
                hintText: 'Enter daily task',
              ),
            ),
            actions: [
              MaterialButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Cancel'),
              ),
              MaterialButton(
                onPressed: () {
                  if (isEditTask) {
                    dailyTaskController.editTask(
                        index, dailyTaskController.addTaskController.text);
                  } else {
                    dailyTaskController
                        .addTask(dailyTaskController.addTaskController.text);
                  }
                  Navigator.of(context).pop();
                },
                child: const Text('Save'),
              ),
            ],
          ));
}
