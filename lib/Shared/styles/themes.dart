

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightTheme()=>ThemeData(

    primarySwatch: Colors.deepOrange,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: Colors.black,
        size: 22,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
      color: Colors.white,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontSize: 30,
      ),
      elevation: 0.0,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,

      backgroundColor: Colors.white,
      selectedItemColor: Colors.deepOrange,
      selectedIconTheme: IconThemeData(size: 22),
      unselectedLabelStyle: TextStyle(fontSize: 15),

      selectedLabelStyle: TextStyle(fontSize: 18),
      showSelectedLabels: true,

      // showUnselectedLabels: false
    ),
    textTheme: TextTheme(
        titleLarge:TextStyle(
            fontSize: 20,
            color: Colors.black,fontWeight: FontWeight.bold
        )

    )
);

ThemeData darkTheme()=>ThemeData(
    primarySwatch: Colors.deepOrange,
    scaffoldBackgroundColor:  Color(0xff333739),
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: Colors.white,
        size: 22,
      ),

      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.light,
      ),
      color:  Color(0xff333739),
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white,
        fontSize: 30,
      ),
      elevation: 0.0,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Color(0xff333739),
      selectedItemColor: Colors.deepOrange,
      unselectedItemColor: Colors.grey,
      selectedIconTheme: IconThemeData(size: 22),
      unselectedLabelStyle: TextStyle(fontSize: 15),
      selectedLabelStyle: TextStyle(fontSize: 18),
      showSelectedLabels: true,

      // showUnselectedLabels: false
    ),
    textTheme: TextTheme(
        titleLarge:TextStyle(
            fontSize: 20,
            color: Colors.white,fontWeight: FontWeight.bold
        )

    )
);