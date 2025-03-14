import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testandroid/Components/components.dart';
import 'package:testandroid/layout/NewaApp/cubit.dart';
import 'package:testandroid/layout/NewaApp/states.dart';

class SearchScreen extends StatelessWidget {
   SearchScreen({super.key});

  var searchController =  TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (BuildContext context, state) {  },
      builder: (BuildContext context, Object? state) {

        var list = NewsCubit.get(context).search;
       return  Scaffold(
         appBar: AppBar(

         ),
         body: Column(
           children: [
             Padding(
               padding: const EdgeInsets.all(20.0),
               child: TextFormField(
                 
                 controller: searchController,
                 validator: (value){
                   if(value!.isEmpty)
                   {
                     return "search must not be empty";
                   }
                   return null;

                 },
                 onChanged: (value){
                   if (value.trim().isNotEmpty) {
                     NewsCubit.get(context).getSearchData(value);
                   }

                 },
                 decoration: InputDecoration(

                     border: OutlineInputBorder(

                         borderRadius: BorderRadius.circular(20)
                     ),
                     prefixIcon: Icon(Icons.search,size: 30,),
                     hintText: 'search',
                     hintStyle: TextStyle(
                         fontSize: 25,
                     )
                 ),
               ),
             ),

             Expanded(
               child: ListView.separated

                 (physics: BouncingScrollPhysics(),
                   itemBuilder: (context,index)=>buildItemData(list[index],context),
                   separatorBuilder: (context,index)=>divider(),
                   itemCount: list.length),
             ),



           ],
         ),
       );
      },

    );
  }
}
