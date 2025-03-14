import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testandroid/Components/components.dart';
import 'package:testandroid/Counter/Cubit/cubit.dart';
import 'package:testandroid/layout/NewaApp/cubit.dart';
import 'package:testandroid/layout/NewaApp/search/search_screen.dart';
import 'package:testandroid/layout/NewaApp/states.dart';
import 'package:testandroid/network/remote/dio_helper.dart';

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (BuildContext context, Object? state) {  },
      builder: (BuildContext context, state) {
        var cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text('News App'),
            actions: [
              IconButton(onPressed: (){
                navigateTo(context, SearchScreen());
              }, icon: Icon(Icons.search,size: 30,)),
              IconButton(onPressed: (){
                CounterCubit.get(context).changeThemeMode();

              }, icon: Icon(Icons.brightness_2_outlined))
            ],
          ),

          bottomNavigationBar: BottomNavigationBar(

            onTap: (index){
              cubit.changeBottonNavBar(index);
            },

            currentIndex: cubit.currentIndex,
              items:
                cubit.bottomitems

          ),
          body: cubit.screens[cubit.currentIndex],
        );
      },


    );
  }
}
