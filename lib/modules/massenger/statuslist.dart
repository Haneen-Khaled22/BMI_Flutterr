
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testandroid/modules/massenger/messanger_screen.dart';

Widget statusList(Userstatus state)=>Container(
  width: 70,
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Center(
        child: Stack(
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
      ),
      Text('${state.name}',textAlign: TextAlign.center,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,)
    ],
  ),
);