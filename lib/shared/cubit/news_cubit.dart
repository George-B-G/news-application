import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_application/module/business_screen.dart';
import 'package:news_application/module/home.dart';
import 'package:news_application/module/science_screen.dart';
import 'package:news_application/module/settings_screen.dart';
import 'package:news_application/module/sports_screen.dart';
import 'package:news_application/shared/cubit/news_state.dart';
import 'package:news_application/shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsAppState> {
  NewsCubit() : super(InitialAppState());
  static NewsCubit get(context) => BlocProvider.of(context);

  // Home Layout
  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomNavBarItem = const [
    BottomNavigationBarItem(icon: Icon(Icons.newspaper), label: 'Home'),
    BottomNavigationBarItem(
        icon: Icon(Icons.business_outlined), label: 'Business'),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: 'Science'),
    BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'Sports'),
    BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
  ];
  List<Widget> screenList = const [
    HomeScreen(),
    BusinessScreen(),
    ScienceScreen(),
    SportsScreen(),
    SettingsScreen(),
  ];
  List<Color> bottomNavBarColor = [
    Colors.indigo,
    Colors.deepPurple,
    Colors.blue,
    Colors.red,
    Colors.teal,
  ];
  List<String> appbarTitle = [
    'Home',
    'Business',
    'Science',
    'Sports',
    'Settings',
  ];
  void changeBottomNavBarIndex(int index) {
    currentIndex = index;
    if (index == 1) {
      getApiDataFunction(category: 'business');
    } else if (index == 2) {
      getApiDataFunction(category: 'science');
    } else if (index == 3) {
      getApiDataFunction(category: 'sports');
    }
    emit(ChangeBottomNavBarIndexState());
  }

  // interact with api
  List apiDataList = [];
  List apiBusinessList = [];
  List apiScienceList = [];
  List apiSportsList = [];
  List searchList = [];
  getApiDataFunction({
    required String category,
  }) {
    emit(GetApiDataLoadingState());
    DioHelper.getData(
      url: 'news',
      query: {
        'apikey': 'pub_3821058726f843db39ca54db40e2d654507ee',
        'q': 'news',
        'category': category,
      },
    ).then((value) {
      // print(value.data['results']);
      apiDataList = value.data['results'];
      if (category == 'business') {
        apiBusinessList = value.data['results'];
      } else if (category == 'science') {
        apiScienceList = value.data['results'];
      } else if (category == 'sports') {
        apiSportsList = value.data['results'];
      }
      emit(GetApiDataSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetApiDataErrorState(error.toString()));
    });
  }

  getSearchNews({required String searchValue}) {
    emit(GetApiSearchLoadingState());
    DioHelper.getData(
      url: 'news',
      query: {
        'apikey': 'pub_3821058726f843db39ca54db40e2d654507ee',
        'q': searchValue,
      },
    ).then(
      (value) {
        searchList = value.data['results'];
        emit(GetApiSearchSuccessState());
      },
    ).catchError((error) {
      print(error.toString());
      emit(GetApiSearchErrorState(error.toString()));
    });
  }
}
