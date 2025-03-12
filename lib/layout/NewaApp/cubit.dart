
import 'package:bloc/bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testandroid/layout/NewaApp/Screens/business_screen.dart';
import 'package:testandroid/layout/NewaApp/Screens/science_screen.dart';
import 'package:testandroid/layout/NewaApp/Screens/settings_screen.dart';
import 'package:testandroid/layout/NewaApp/Screens/sports_screen.dart';
import 'package:testandroid/layout/NewaApp/states.dart';

import '../../network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates>{
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context)=> BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomitems =[
  BottomNavigationBarItem(
    icon: Icon(Icons.business_sharp),
    label: 'Business'
  ),
    BottomNavigationBarItem(
        icon: Icon(Icons.science),
        label: 'Science'
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.sports),
        label: 'Sports'
    ),
    // BottomNavigationBarItem(
    //     icon: Icon(Icons.settings),
    //     label: 'Settings'
    // ),

  ];



  void changeBottonNavBar(int index){
    // if(currentIndex ==1) getScienceData();
    // if(currentIndex ==2) getSportsData();

    currentIndex = index;
    emit(BottomNavChange());
  }

  List<Widget>screens=[
    BusinessScreen(),
    ScienceScreen(),
    SportsScreen(),
    // SettingsScreen(),
  ];

  List<dynamic> business =[];

  void getBusinessData(){

    if(business.length ==0){
      emit(GetBusinessLoadingState());
      DioHelper.getData(
          url: 'v2/top-headlines',
          query: {
            'country':'us',
            'category':'business',

            'apiKey':'2e16eee24e88404184af8a9e74c073a6'
          }

      ).then((value)=>{
        // print(value.data['articles'][0]['title'])
        business = value.data['articles'],
        print(business[0]['title']),
        emit(GetBusinessSuccessState())

      }).catchError((error)=>{
        print('error is ${error.toString()}'),
        emit(GetBusinessErrorState(error.toString()))


      });

    }
    else
      {
        emit(GetBusinessSuccessState());
      }

  }


  List<dynamic> sports =[];

  void getSportsData(){
   if(sports.length == 0){
     emit(GetSportsLoadingState());
     DioHelper.getData(
         url: 'v2/top-headlines',
         query: {
           'country':'us',
           'category':'sports',

           'apiKey':'2e16eee24e88404184af8a9e74c073a6'
         }

     ).then((value)=>{
       // print(value.data['articles'][0]['title'])
       sports = value.data['articles'],
       print(sports[0]['title']),
       emit(GetSportsSuccessState())

     }).catchError((error)=>{
       print('error is ${error.toString()}'),
       emit(GetSportsErrorState(error.toString()))


     });
   }else
     {
       emit(GetSportsSuccessState());
     }
  }


  List<dynamic> science =[];

  void getScienceData(){
   if(science.length == 0){
     emit(GetScienceLoadingState());
     DioHelper.getData(
         url: 'v2/top-headlines',
         query: {
           'country':'us',
           'category':'science',

           'apiKey':'2e16eee24e88404184af8a9e74c073a6'
         }

     ).then((value)=>{
       // print(value.data['articles'][0]['title'])
       science = value.data['articles'],
       print(science[0]['title']),
       emit(GetScienceSuccessState())

     }).catchError((error)=>{
       print('error is ${error.toString()}'),
       emit(GetScienceErrorState(error.toString()))


     });
   }else{
     emit(GetScienceSuccessState());
   }
  }

}
