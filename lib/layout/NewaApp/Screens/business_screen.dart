import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testandroid/Components/components.dart';
import 'package:testandroid/layout/NewaApp/cubit.dart';
import 'package:testandroid/layout/NewaApp/states.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return
      BlocConsumer<NewsCubit,NewsStates>(
        listener: (BuildContext context, state) {
          if(state is GetBusinessLoadingState) {
            Center(child: CircularProgressIndicator());
          }
        },
        builder: (BuildContext context, Object? state) {
          var list = NewsCubit.get(context).business;
          return  ListView.separated
            (physics: BouncingScrollPhysics(),
              itemBuilder: (context,index)=>buildItemData(list[index],context),
              separatorBuilder: (context,index)=>divider(),
              itemCount: list.length);
        },

      );
  }
}
