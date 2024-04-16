import 'package:flutter/material.dart';
import 'package:flutter_application_1/addTaskScreen.dart';

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
      home: TaskListScreen(),
    );
  }
}

class TaskListScreen extends StatefulWidget {
  @override
  _TaskListScreenState createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  List<String> tasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 27, 25, 25),
        title: Text('Atividade Flutter - Grupo 6'), foregroundColor: Colors.amber,
      ),
      body: Container( 
        color: Color.fromARGB(255, 104, 103, 103),
        child: Center(
          child: ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: Key(tasks[index]),
                onDismissed: (direction) {
                  setState(() {
                    tasks.removeAt(index);
                  });
                },
                background: Container(
                  color: Color.fromARGB(255, 255, 3, 3),
                  child: Icon(Icons.delete, color: Color.fromARGB(255, 255, 255, 255)),
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(right: 20.0),
                ),
                child: ListTile(
                  title: Text(tasks[index], style: TextStyle(color: Colors.amber),),
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
          ).then((newTask) {
            if (newTask != null) {
              setState(() {
                tasks.add(newTask);
              });
            }
          });
        },
        child: Icon(Icons.add), backgroundColor: Colors.amber,foregroundColor: Colors.black,
      ),
    );
  }
}

