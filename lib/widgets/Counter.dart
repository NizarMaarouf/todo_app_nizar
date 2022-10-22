

// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
 final int countDone;
 final int countTask;

  const Counter({Key? key, required this.countDone, required this.countTask})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Text(
        '$countDone/$countTask',
        style: TextStyle(
          color: countDone == countTask ?Colors.green[300]:Colors.white,
           fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
      margin: const EdgeInsets.only(top: 20),
      width: 350,
      height: 50,
      // color: Colors.blue[800],
    );
  }
}
