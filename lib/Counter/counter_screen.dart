import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testandroid/Counter/Cubit/cubit.dart';
import 'package:testandroid/Counter/Cubit/states.dart';

class CounterScreen extends StatelessWidget {
  CounterScreen({super.key});

  int counter = 1;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=> CounterCubit(),
      child: BlocConsumer<CounterCubit,CounterStates>(
        listener: (BuildContext context, state)
        {
          if(state is CounterPlusState) print('plus state ${state.counter}');
          if(state is CounterMinusState) print('minus state  ${state.counter}');
        },
        builder: (BuildContext context, Object? state)
        {
          return Scaffold(
            appBar: AppBar(backgroundColor: Colors.blue, title: Text('COUNTER')),

            body: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      CounterCubit.get(context).minus();
                    },
                    child: Text('MINUS', style: TextStyle(fontSize: 25)),
                  ),
                  Text('${CounterCubit.get(context).counter}', style: TextStyle(fontSize: 30)),
                  TextButton(
                    onPressed: () {
                      CounterCubit.get(context).plus();
                    },
                    child: Text('PLUS', style: TextStyle(fontSize: 25)),
                  ),
                ],
              ),
            ),
          );
        }

      ),
    );
  }
}
