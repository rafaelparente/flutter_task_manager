import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_task_manager/task_manager_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final String title = 'Controle de Tarefas';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: title),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  final TaskManagerController taskManager = TaskManagerController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Observer(
        builder: (_) => ListView.builder(
          itemBuilder: (_, index) => Card(
            child: ListTile(
              title: Text(taskManager.tasks.toList()[index]),
              trailing: ButtonBar(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () async {
                      final taskContent = await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TaskPage(taskContent: taskManager.tasks.toList()[index])),
                      );
                      if (taskContent != null) {
                        taskManager.updateTask(index, taskContent);
                      }
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: (){ taskManager.removeTask(index); },
                  ),
                ],
              ),
            ),
          ), // ListTitle
          itemCount: taskManager.tasks.toList().length,
        ), // ListView.builder
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final taskContent = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TaskPage()),
          );
          if (taskContent != null) {
            taskManager.addTask("$taskContent");
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class TaskPage extends StatelessWidget {
  TaskPage({Key key, String taskContent}) :
        taskEditingController = TextEditingController(text: taskContent),
        super(key: key);

  final TextEditingController taskEditingController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tarefa"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: taskEditingController,
              decoration: InputDecoration(
                hintText: 'Tarefa',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (taskEditingController.text != '') {
                  Navigator.pop(context, taskEditingController.text);
                }
              },
              child: Text(
                taskEditingController.text == '' ? 'Adicionar Tarefa' : 'Atualizar Tarefa',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
