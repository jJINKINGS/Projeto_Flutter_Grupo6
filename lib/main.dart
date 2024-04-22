import 'package:flutter/material.dart';
import 'package:flutter_application_1/addTaskScreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Atividade',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChangeNotifierProvider( 
        create: (context) => TaskProvider(), 
        child: TaskListScreen(),
      ),
    );
  }
}
class TaskListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context); 

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 27, 25, 25),
        title: Text('Atividade Flutter - Grupo 6'),
        foregroundColor: Colors.amber,
      ),
      body: Container(
        color: Color.fromARGB(255, 104, 103, 103),
        child: Center(
          child: ListView.builder(
            itemCount: taskProvider.tasks.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: Key(taskProvider.tasks[index]),
                onDismissed: (direction) {
                  taskProvider.removeTask(index); 
                },
                background: Container(
                  color: Color.fromARGB(255, 255, 3, 3),
                  child: Icon(Icons.delete, color: Color.fromARGB(255, 255, 255, 255)),
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(right: 20.0),
                ),
                child: ListTile(
                  title: Text(taskProvider.tasks[index], style: TextStyle(color: Colors.amber)),
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTaskScreen()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
