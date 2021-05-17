import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/dio_helper.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/screens/business_screen.dart';
import 'package:news_app/screens/science_screen.dart';
import 'package:news_app/screens/sport_screen.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: 'Business',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports_volleyball_rounded),
      label: 'Sport',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: 'Science',
    ),
  ];
  List<Widget> screens = [
    BusinessScreen(),
    SportScreen(),
    ScienceScreen(),
  ];

  void changeBottomNavBar(index) {
    currentIndex = index;
    emit(NewBottomNavState());
  }
  List<dynamic> business =[];
  List<dynamic> sports =[];
  List<dynamic> science =[];
  void  getBusiness(){
    emit(NewsGetBusinessLoadingState());
    DioHelper.getDate('v2/top-headlines', {
      'country':'eg',
      'category':'business',
      'apiKey':'65f7f556ec76449fa7dc7c0069f040ca',
    },).then((value){
      //print(value.data['articles'][0]['title'].toString());
      business = value.data['articles'] ;
      print(business[0]['title']);
      emit(NewsGetBusinessSuccessState());
    }).catchError((onError){
      print(onError.toString());
      emit(NewsGetBusinessErrorState(onError.toString()));
    });
  }

  void  getSports(){
    emit(NewsGetSportsLoadingState());
    DioHelper.getDate('v2/top-headlines', {
      'country':'eg',
      'category':'sports',
      'apiKey':'65f7f556ec76449fa7dc7c0069f040ca',
    },).then((value){
      //print(value.data['articles'][0]['title'].toString());
      sports = value.data['articles'] ;
      print(sports[0]['title']);
      emit(NewsGetSportsSuccessState());
    }).catchError((onError){
      print(onError.toString());
      emit(NewsGetSportsErrorState(onError.toString()));
    });
  }

  void  getScience(){
    emit(NewsGetScienceLoadingState());
    DioHelper.getDate('v2/top-headlines', {
      'country':'eg',
      'category':'science',
      'apiKey':'65f7f556ec76449fa7dc7c0069f040ca',
    },).then((value){
      //print(value.data['articles'][0]['title'].toString());
      science = value.data['articles'] ;
      print(science[0]['title']);
      emit(NewsGetScienceSuccessState());
    }).catchError((onError){
      print(onError.toString());
      emit(NewsGetScienceErrorState(onError.toString()));
    });
  }
}
