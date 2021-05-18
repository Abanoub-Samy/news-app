abstract class AppStates {}

class InitialState extends AppStates {}

class NewBottomNavState extends AppStates {}

class NewsGetBusinessSuccessState extends AppStates {}

class NewsGetBusinessErrorState extends AppStates {
  final String error;

  NewsGetBusinessErrorState(this.error);
}

class NewsGetBusinessLoadingState extends AppStates {}

class NewsGetSportsSuccessState extends AppStates {}

class NewsGetSportsErrorState extends AppStates {
  final String error;

  NewsGetSportsErrorState(this.error);
}

class NewsGetSportsLoadingState extends AppStates {}

class NewsGetScienceLoadingState extends AppStates {}

class NewsGetScienceSuccessState extends AppStates {}

class NewsGetScienceErrorState extends AppStates {
  final String error;

  NewsGetScienceErrorState(this.error);
}

class AppChangeMode extends AppStates {}

class NewsGetSearchLoadingState extends AppStates {}

class NewsGetSearchSuccessState extends AppStates {}

class NewsGetSearchErrorState extends AppStates {
  final String error;

  NewsGetSearchErrorState(this.error);
}