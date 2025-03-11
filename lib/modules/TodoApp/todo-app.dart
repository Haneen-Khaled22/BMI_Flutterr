// ignore_for_file: avoid_print, unused_local_variable

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';


class Homelayout extends StatefulWidget {
  const Homelayout({super.key});



  @override
  State<Homelayout> createState() => _HomelayoutState();
}

class _HomelayoutState extends State<Homelayout> {
  int currentIndex = 0;


  List<String> titles = ['new tasks', 'done tasks', 'archived tasks'];

  var database;

  @override
  void initState() {

    super.initState();


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(
          titles[currentIndex],
          style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueGrey,

        onPressed: () {
          createDatabase();
        },
        child: Icon(Icons.add,color: Colors.white,size: 30,),
      ),

      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: TextStyle(
          fontSize: 20,


        ),
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey[600],
        unselectedLabelStyle: TextStyle(
          fontSize: 20,

        ),
        backgroundColor: Colors.white,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;

            print(index);
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.menu,size: 30,), label: 'tasks'),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_circle_outline,size: 30,),
            label: 'done',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.archive_outlined,size: 30,),
            label: 'archived',
          ),
        ],
      ),




    );


  }

  void createDatabase()async
  {
    database = await openDatabase(
      'todo.db',version: 1,
      onCreate: (database,version)
      {
        database.execute('CREATE TABLE Tasks (id INTEGER PRIMARY KEY , title TEXT , status TEXT , time TEXT)').then((value){
          print('table created');
        }).catchError((error){
        print('error is ${error.toString()}');
        });
        print('database created');
      },
      onOpen: (database){
        print('database opened');
    }
    );
  }




}
