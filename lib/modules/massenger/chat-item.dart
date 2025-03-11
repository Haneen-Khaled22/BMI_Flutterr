
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testandroid/modules/massenger/messanger_screen.dart';

Widget messageScreen(UserModel user)=>Row(

  children: [
    Stack(
      alignment: Alignment.bottomRight,
      children: [
        CircleAvatar(
          backgroundImage: AssetImage('assets/images/person.png'),
          radius: 30,
        ),
        CircleAvatar(
          backgroundColor: Colors.white,
          radius: 7,
        ),
        CircleAvatar(
          backgroundColor: Colors.green,
          radius: 6,
        )
      ],
    ),
    SizedBox(width: 15,),
    Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('${user.name}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
          SizedBox(height: 8,),
          Row(children: [
            Expanded(
              child: Text('${user.message} ',style: TextStyle(fontSize: 15),
                maxLines: 1,overflow: TextOverflow.ellipsis,),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              height: 8,
              width: 8,
            ),
            SizedBox(width: 8,),
            Text('${user.time}')
          ],)
        ],
      ),
    )
  ],
);