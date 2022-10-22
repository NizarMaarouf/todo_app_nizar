// ignore_for_file: prefer_const_constructors, avoid_print, unnecessary_null_comparison, unrelated_type_equality_checks, unused_local_variable, unused_element, non_constant_identifier_names, avoid_function_literals_in_foreach_calls

import 'package:flutter/material.dart';
import 'package:todo_app_lesson10_1/widgets/Counter.dart';
import 'package:todo_app_lesson10_1/widgets/todo-card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoApp(),
    );
  }
}

class TodoApp extends StatefulWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class Task {
  String title;
  bool status;
  Task({
    required this.title,
    required this.status,
  });
}

class _TodoAppState extends State<TodoApp> {
  List allTasks = [
    Task(title: "Publish video", status: true),
    Task(title: "Laugh louder", status: true),
    Task(title: "GEM", status: true),
    Task(title: "call mom", status: true),
  ];

  addnewtask() {
    setState(() {
      allTasks.add(
        Task(title: myController.text, status: false),
      );
    });
  }

  final myController = TextEditingController();
  countTask() {
    return allTasks.length;
  }

  countDone() {
    int completTask = 0;
    setState(() {
      allTasks.forEach((element) {
        element.status == true ? completTask++ : completTask;
      });
    });
    return completTask;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Container(
                  padding: EdgeInsets.all(20),
                  color: Colors.white,
                  height: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        controller: myController,
                        maxLength: 20,
                        decoration: InputDecoration(hintText: "Add new Task"),
                      ),
                      SizedBox(
                        height: 22,
                      ),
                      TextButton(
                        onPressed: () {
                          addnewtask();
                          Navigator.pop(context);
                        },
                        child: Text(
                          "ADD",
                          style: TextStyle(fontSize: 22),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.redAccent,
      ),
      backgroundColor: Color.fromRGBO(58, 66, 86, 0.7),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromRGBO(58, 66, 86, 1),
        title: Text(
          "TO DO APP",
          style: TextStyle(
              fontSize: 33, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Counter(
              countDone: countDone(),
              countTask: countTask(),
            ),
            SizedBox(
              height: 500,
              child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: allTasks.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Todecard(
                      vartitle: allTasks[index].title,
                      doneORnot: allTasks[index].status,
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}