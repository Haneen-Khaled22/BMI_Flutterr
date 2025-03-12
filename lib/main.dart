import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:testandroid/Counter/Cubit/cubit.dart';
import 'package:testandroid/Counter/Cubit/states.dart';
import 'package:testandroid/modules/massenger/messanger_screen.dart';
import 'package:testandroid/modules/result_screen.dart';
import 'package:testandroid/network/remote/dio_helper.dart';

import 'Counter/counter_screen.dart';
import 'Shared/bloc_observer.dart';
import 'layout/news_app.dart';
import 'modules/ibm_calculator.dart';
import 'modules/TodoApp/todo-app.dart';
import 'modules/products_screen.dart';

void main() {
  // DioHelper.init();
  Bloc.observer = MyBlocObserver();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:(BuildContext context)=>CounterCubit(),
      child: BlocConsumer<CounterCubit,CounterStates>(
        listener: (BuildContext context, CounterStates state) {  },
        builder: (BuildContext context, CounterStates state) {
          return MaterialApp(
            themeMode: CounterCubit.get(context).isDark?ThemeMode.dark:ThemeMode.light,
            theme: ThemeData(
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
            ),
            darkTheme: ThemeData(
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
            ),

            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',

            home: ProductsScreen(),
          );
        },

      ),
    );
  }
}
