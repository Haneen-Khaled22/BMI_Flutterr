abstract class NewsStates{}


class NewsInitialState extends NewsStates{}
class BottomNavChange extends NewsStates{}


class GetBusinessSuccessState extends NewsStates{}

class GetBusinessLoadingState extends NewsStates{}

class GetBusinessErrorState extends NewsStates{
   String error;
   GetBusinessErrorState(
    this.error
);
}

class GetSportsSuccessState extends NewsStates{}

class GetSportsLoadingState extends NewsStates{}

class GetSportsErrorState extends NewsStates{
   String error;
   GetSportsErrorState(
       this.error
       );
}

class GetScienceSuccessState extends NewsStates{}

class GetScienceLoadingState extends NewsStates{}

class GetScienceErrorState extends NewsStates{
   String error;
   GetScienceErrorState(
       this.error
       );
}
