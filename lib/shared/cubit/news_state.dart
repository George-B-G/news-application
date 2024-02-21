abstract class NewsAppState {}

class InitialAppState extends NewsAppState {}

class ChangeBottomNavBarIndexState extends NewsAppState {}

class GetApiDataLoadingState extends NewsAppState {}

class GetApiDataSuccessState extends NewsAppState {}

class GetApiDataErrorState extends NewsAppState {
  final String error;
  GetApiDataErrorState(this.error);
}

class GetApiSearchLoadingState extends NewsAppState {}

class GetApiSearchSuccessState extends NewsAppState {}

class GetApiSearchErrorState extends NewsAppState {
  final String error;
  GetApiSearchErrorState(this.error);
}
