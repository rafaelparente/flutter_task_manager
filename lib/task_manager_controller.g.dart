// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_manager_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TaskManagerController on TaskManagerControllerBase, Store {
  final _$tasksAtom = Atom(name: 'TaskManagerControllerBase.tasks');

  @override
  ObservableList<String> get tasks {
    _$tasksAtom.reportRead();
    return super.tasks;
  }

  @override
  set tasks(ObservableList<String> value) {
    _$tasksAtom.reportWrite(value, super.tasks, () {
      super.tasks = value;
    });
  }

  final _$TaskManagerControllerBaseActionController =
      ActionController(name: 'TaskManagerControllerBase');

  @override
  void addTask(String taskContent) {
    final _$actionInfo = _$TaskManagerControllerBaseActionController
        .startAction(name: 'TaskManagerControllerBase.addTask');
    try {
      return super.addTask(taskContent);
    } finally {
      _$TaskManagerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateTask(int index, String taskContent) {
    final _$actionInfo = _$TaskManagerControllerBaseActionController
        .startAction(name: 'TaskManagerControllerBase.updateTask');
    try {
      return super.updateTask(index, taskContent);
    } finally {
      _$TaskManagerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeTask(int index) {
    final _$actionInfo = _$TaskManagerControllerBaseActionController
        .startAction(name: 'TaskManagerControllerBase.removeTask');
    try {
      return super.removeTask(index);
    } finally {
      _$TaskManagerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tasks: ${tasks}
    ''';
  }
}
