//streams in Flutter in Focus series
//https://www.youtube.com/watch?v=nQBpOIHE4eE

import 'package:flutter/material.dart';
import 'dart:async';

class Demo1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo 1'),
      ),
      body: MyDemo(),
    );
  }
}

class MyDemo extends StatefulWidget {
  @override
  _MyDemoState createState() => _MyDemoState();
}

class _MyDemoState extends State<MyDemo> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        child: Text('Press'),
        onPressed: () {
          performTasks();
        },
      ),
    );
  }
}

void performTasks() {
  final controller = StreamController();
  //add a data event to the stream of type double
  controller.add(100.0);
  //add a data event to the stream of type list<dynamic>.
  controller.add([10, 20, 30, 'hey there']);
  //add a data event to the stream of type map<string, int>.
  controller.add({'name': 'robbin', 'age': 35});
  //add a data event to the stream of type list<map<string, int>>.
  controller.add([
    {'name': 'joe', 'age': 20},
    {'name': 'sam', 'age': 30}
  ]);
  //add a data event to the stream of type null.
  controller.add(null);
  //add an error event to the stream.
  controller.addError(StateError('Hey man this is an error event'));
  //add a data event to the stream of type int.
  controller.add(5);
  //close the controller. Cannot add anything to the stream
  //after closing the controller.
  controller.close();
  //controller.add(10);

  controller.stream.listen((event) {
    print(event);
  }, onError: (error) {
    print(error);
  }, onDone: () {
    print('Hey Man this stream is done');
  });
}
