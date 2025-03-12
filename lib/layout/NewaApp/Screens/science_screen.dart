import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Components/components.dart';
import '../cubit.dart';
import '../states.dart';

class ScienceScreen extends StatelessWidget {
  const ScienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (BuildContext context, state) {
        if(state is GetScienceLoadingState) {
          Center(child: CircularProgressIndicator());
        }
      },
      builder: (BuildContext context, Object? state) {
        var list = NewsCubit.get(context).science;
        return  ListView.separated
          (physics: BouncingScrollPhysics(),
            itemBuilder: (context,index)=>buildItemData(list[index],context),
            separatorBuilder: (context,index)=>divider(),
            itemCount: list.length);
      },

    );
  }
}
