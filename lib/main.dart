import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:testandroid/modules/massenger/messanger_screen.dart';
import 'package:testandroid/modules/result_screen.dart';

import 'Counter/counter_screen.dart';
import 'Shared/bloc_observer.dart';
import 'modules/ibm_calculator.dart';
import 'modules/TodoApp/todo-app.dart';

void main() {

  Bloc.observer = MyBlocObserver();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false
      ,
      title: 'Flutter Demo',

      home: IBMCalculatorScreen(),
    );
  }
}

