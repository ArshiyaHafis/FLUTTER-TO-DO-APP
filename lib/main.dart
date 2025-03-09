import 'package:flutter/material.dart';

// entry point of a flutter app
void main() {
  runApp(MyApp()); //start using MyApp
}

//main widget
class MyApp extends StatelessWidget {
  //stateless widget - display info and never changes
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoScreen(),
    ); //sets todoscreen as home screen and siable debugs banner
  }
}

class TodoScreen extends StatefulWidget {
  @override
  TodoScreenState createState() => TodoScreenState(); //creates an instance of TodoScreenState
}

//manages todo list
class TodoScreenState extends State<TodoScreen> {
  List<String> tasks = []; // List to store tasks
  TextEditingController taskController =
      TextEditingController(); //alows to read text inseide the text field

  //adds the task to tasks list
  void addTask() {
    setState(() {
      //update ui
      if (taskController.text.isNotEmpty) {
        tasks.add(
          taskController.text,
        ); // add the text from taskController to tasks list
        taskController.clear(); //clear the taskController input field
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //main structure of the screen
      appBar: AppBar(title: Text('Simple To-Do List')), //topbar with app name
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0), //adds 8pxs of space around Row
            child: Row(
              // enter tasks
              children: [
                Expanded(
                  child: TextField(
                    //where user enters the task
                    controller: taskController,
                    decoration: InputDecoration(hintText: 'Enter task'),
                  ),
                ),
                IconButton(icon: Icon(Icons.add), onPressed: addTask),
              ],
            ),
          ),
          Expanded(
            //displying tasks
            child: ListView.builder(
              itemCount: tasks.length, //how many items to display
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(tasks[index]),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      setState(() {
                        tasks.removeAt(index);
                      });
                    },
                  ),
                ); //display task at position index
              },
            ),
          ),
        ],
      ),
    );
  }
}
