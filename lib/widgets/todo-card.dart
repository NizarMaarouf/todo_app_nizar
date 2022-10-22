// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names, avoid_print, unrelated_type_equality_checks

import 'package:flutter/material.dart';

class Todecard extends StatelessWidget {
  final String vartitle;
  final bool doneORnot;
  final Function myfunc;
  final int index;
  final int inum;
  final Function myfunc2;
  const Todecard({
    Key? key,
    required this.vartitle,
    required this.doneORnot,
    required this.myfunc,
    required this.index,
    required this.myfunc2,
    required this.inum,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        myfunc(index);
      },
      child: FractionallySizedBox(
        widthFactor: 0.9,
        child: Container(
          margin: EdgeInsets.only(top: 20),
          padding: EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                vartitle,
                style: TextStyle(
                  color: doneORnot ? Colors.black : Colors.white,
                  fontSize: 25,
                  fontFamily: 'myfont1',
                decoration: doneORnot ? TextDecoration.lineThrough :  TextDecoration.none,
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                SizedBox(
                  width: 80,
                  child: Icon(
                    doneORnot ? Icons.check : Icons.close,
                    size: 27,
                    color: doneORnot ? Colors.green[400] : Colors.red,
                  ),
                ),
                IconButton(
                    onPressed: () {
                      myfunc2(inum);
                    },
                    icon: Icon(
                      Icons.delete,
                      size: 30,
                      color: Colors.red[300],
                    ))
              ]),
            ],
          ),
          decoration: BoxDecoration(
              color: Color.fromRGBO(209, 224, 224, 0.2),
              borderRadius: BorderRadius.circular(11)),
        ),
      ),
    );
  }
}
