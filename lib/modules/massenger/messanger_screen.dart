import 'package:flutter/material.dart';
import 'package:testandroid/modules/massenger/statuslist.dart';

import 'chat-item.dart';

class UserModel {
  String name;
  String message;
  String time;

  UserModel({
    required this.name,
    required this.message,
    required this.time
});
}

class Userstatus{
  String name;

  Userstatus({
    required this.name
});
}



class MessangerScreen extends StatefulWidget {
   MessangerScreen({super.key});
  


  @override
  State<MessangerScreen> createState() => _MessangerScreenState();
}

class _MessangerScreenState extends State<MessangerScreen> {

  List<UserModel> users=[
    UserModel(
        name:'Haneen Khaled',
        message:'hello iam haneen khaled flutter developer',
        time:'02:00 pm'),
    UserModel(
        name:'Sarah Ahmed',
        message:'hello iam Sarah Ahmed flutter developer',
        time:'11:00 pm'),
    UserModel(
        name:'Mona Khaled',
        message:'hello iam Mona Khaled flutter developer',
        time:'06:00 pm'),
    UserModel(
        name:'Ahmed Ali',
        message:'hello iam Ahmed Ali flutter developer',
        time:'02:00 pm'),
    UserModel(
        name:'Youseff Khaled',
        message:'hello iam Youseff Khaled flutter developer',
        time:'02:00 pm'),
    UserModel(
        name:'Haneen Khaled',
        message:'hello iam haneen khaled flutter developer',
        time:'02:00 pm'),
    UserModel(
        name:'Sarah Ahmed',
        message:'hello iam Sarah Ahmed flutter developer',
        time:'11:00 pm'),
    UserModel(
        name:'Mona Khaled',
        message:'hello iam Mona Khaled flutter developer',
        time:'06:00 pm'),
    UserModel(
        name:'Ahmed Ali',
        message:'hello iam Ahmed Ali flutter developer',
        time:'02:00 pm'),
    UserModel(
        name:'Youseff Khaled',
        message:'hello iam Youseff Khaled flutter developer',
        time:'02:00 pm'),
  ];

  List<Userstatus> status=[
    Userstatus(name: "Haneen Khaled"),
    Userstatus(name: "Mona Ahmed"),
    Userstatus(name: "Sarah Ahmed"),
    Userstatus(name: "Mona  Khaled"),
    Userstatus(name: "Heba Mohamed"),
    Userstatus(name: "Youseff Khaled"),
    Userstatus(name: "Nada Mohamed"),
    Userstatus(name: "Rana Yasser"),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/images/person.png'),
          ),
        ),
        title: Text(
          'Chats',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.camera_alt_outlined),
                color: Colors.black,
              ),
              backgroundColor: Colors.white,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.edit),
                color: Colors.black,
              ),
              backgroundColor: Colors.white,
            ),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    children: [
                      Icon(Icons.search),
                      SizedBox(width: 10),
                      Text('search'),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 20),
              SizedBox(
                height: 100,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => statusList(status[index]),
                  separatorBuilder: (context, index) => SizedBox(width: 10),
                  itemCount: status.length,
                ),
              ),
              SizedBox(height: 30),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => messageScreen(users[index]),
                separatorBuilder: (context, index) => SizedBox(height: 15),
                itemCount: users.length,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
