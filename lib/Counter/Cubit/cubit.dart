
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testandroid/Counter/Cubit/states.dart';
import 'package:testandroid/network/local/cache_helper.dart';

class CounterCubit extends Cubit<CounterStates>{

  CounterCubit() : super(CounterInitialState());

  static CounterCubit get(context)=>BlocProvider.of(context);

  int counter =1;

  void plus(){
    counter++;
    emit(CounterPlusState(counter));
  }

  void minus(){
    counter--;
    emit(CounterMinusState(counter));
  }

  bool isDark=false;
  void changeThemeMode({bool? fromShared}){
  if(fromShared != null)
   isDark = fromShared;
  else
    isDark = ! isDark;
    CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value){
      emit(ChangeThemeMode());
    });

  }

}