import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:testandroid/Counter/Cubit/cubit.dart';
import 'package:testandroid/Counter/Cubit/states.dart';
import 'package:testandroid/Shared/styles/themes.dart';
import 'package:testandroid/layout/NewaApp/cubit.dart';
import 'package:testandroid/modules/massenger/messanger_screen.dart';
import 'package:testandroid/modules/result_screen.dart';
import 'package:testandroid/network/local/cache_helper.dart';
import 'package:testandroid/network/remote/dio_helper.dart';

import 'Counter/counter_screen.dart';
import 'Shared/bloc_observer.dart';
import 'layout/news_app.dart';
import 'modules/ShopApp/onboarding/onboarding_screen.dart';
import 'modules/ibm_calculator.dart';
import 'modules/TodoApp/todo-app.dart';
import 'modules/login_screen.dart';
import 'modules/products_screen.dart';
import 'modules/register_screen.dart';

Future<void> main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  DioHelper.init();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  bool? isDark = CacheHelper.getBoolean(key: 'isDark');

  runApp(MyApp(isDark!));
}

class MyApp extends StatelessWidget {


  final bool isDark;
  MyApp(this.isDark);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>NewsCubit()..getBusinessData()..getSportsData()..getScienceData(),),
        BlocProvider(create:(context)=>CounterCubit()..changeThemeMode(fromShared: isDark), )
      ],
      child: BlocConsumer<CounterCubit,CounterStates>(
        listener: (BuildContext context, CounterStates state) {  },
        builder: (BuildContext context, CounterStates state) {
          return MaterialApp(
            themeMode: CounterCubit.get(context).isDark?ThemeMode.dark:ThemeMode.light,
            theme: lightTheme(),
            darkTheme: darkTheme(),

            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',

            home: ProductsScreen(),
          );
        },

      ),
    );
  }
}
