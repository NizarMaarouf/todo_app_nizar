// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:todo_app_nizar/widgets/Counter.dart';
import 'package:todo_app_nizar/widgets/todo-card.dart';

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
    Task(title: "Publish video", status: false),
    Task(title: "Laugh louder", status: true),
    Task(title: "GEM", status: false),
    Task(title: "call mom", status: true),
  ];

  changeStatus(int taskIndex) {
    setState(() {
      // allTasks[0].status == false ?   allTasks[0].status = true :allTasks[0].status =false;
      allTasks[taskIndex].status = !allTasks[taskIndex].status;
      // allTasks[taskIndex].status == true ?  TextStyle() : allTasks[taskIndex].title;

    });
  }

  delete(int inum) {
    setState(() {
      allTasks.remove(allTasks[inum]);
    });
  }

  deleteall() {
    setState(() {
      allTasks.removeRange(0, allTasks.length);
    });
  }

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
      for (var element in allTasks) {
        element.status == true ? completTask++ : completTask;
      }
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
      backgroundColor: Color.fromRGBO(160, 120, 80, 0.6),
      appBar: AppBar(
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                deleteall();
              },
              icon: Icon(
                Icons.delete_forever,
                size: 40,
                color: Colors.red[300],
              ))
        ],
        elevation: 0,
        backgroundColor: Color.fromRGBO(160, 120, 80, 1),
        leading: Image.asset(
          'assets/images/task.png',
        ),
        title: Text(
          "NIZAR TO DO ",
          style: TextStyle(
            fontSize: 33,
            color: Colors.black,
            fontFamily: 'myfont1',
          ),
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
                  itemBuilder: (
                    BuildContext context,
                    int index,
                  ) {
                    return Todecard(
                      vartitle: allTasks[index].title,
                      doneORnot: allTasks[index].status,
                      index: index,
                      myfunc2: delete,
                      myfunc: changeStatus,
                      inum: index,
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
