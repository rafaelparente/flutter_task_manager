import 'package:mobx/mobx.dart';

part 'task_manager_controller.g.dart';

class TaskManagerController = TaskManagerControllerBase with _$TaskManagerController;

abstract class TaskManagerControllerBase with Store {
  @observable
  ObservableList<String> tasks = ObservableList.of([]);

  @action
  void addTask(String taskContent) {
    if (taskContent.length == 0) return;
    tasks.insert(0, taskContent);
  }

  @action
  void updateTask(int index, String taskContent) {
    if (taskContent.length == 0) return;
    tasks[index] = taskContent;
  }

  @action
  void removeTask(int index) {
    tasks.removeAt(index);
  }
}
