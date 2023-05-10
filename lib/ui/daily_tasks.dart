import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';
import 'package:workruit_assessment/controllers/daily_task_controller.dart';
import 'package:workruit_assessment/custom_widgets/dialog.dart';

class DailyTasksScreen extends StatelessWidget {
  final DailyTaskController _dailyTaskController = Get.put(DailyTaskController());

  DailyTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Task List'),
        ),
        body: Obx(() {
          return ListView.builder(
            itemCount: _dailyTaskController.taskList.length,
            itemBuilder: (BuildContext context, int index) {
              return _dailyTaskController.taskList.isNotEmpty
                  ? ListTile(
                      title: Text(_dailyTaskController.taskList[index]),
                      trailing: IconButton(
                          onPressed: () {
                            displayDialog(context,
                                index: index,
                                dailyTaskController: _dailyTaskController,
                                isEditTask: true);
                          },
                          icon: const Icon(Icons.edit)),
                    )
                  : const Text("No Tasks Found");
            },
          );
        }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            displayDialog(context,
                dailyTaskController: _dailyTaskController, isEditTask: false);
          },
          child: const Icon(Icons.add),
        ));
  }
}
