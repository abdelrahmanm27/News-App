import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/business/business_screen.dart';
import 'package:news_app/modules/science/science_screen.dart';
import 'package:news_app/modules/settings/settings_screen.dart';
import 'package:news_app/modules/sports/sports_screen.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/shared/network_local/cache_helper.dart';

import '../network_remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  String country = 'eg';

  List<BottomNavigationBarItem> navItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: 'Business',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: 'Sports',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: 'Science',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: 'Settings',
    ),
  ];

  List<Widget> screens = [
    const BusinessScreen(),
    const SportsScreen(),
    const ScienceScreen(),
    const SettingsScreen(),
  ];

  void changeNavIndex(int index) {
    currentIndex = index;
    if (index == 1) {
      getSports();
    } else if (index == 2) {
      getScience();
    }
    emit(NewsBottomNavState());
  }

  List<dynamic> business = [];
  List<dynamic> sports = [];
  List<dynamic> science = [];
  List<dynamic> search = [];

  void getBusiness() {
    emit(NewsGetBusinessLoadingState());

    if (business.isEmpty) {
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country': getCountry(),
        'category': 'business',
        'apikey': 'a155e510dbaa49d48f378dbabd7120e1',
      }).then((value) {
        // ignore: avoid_print
        // print(value.data.toString());
        business = value.data['articles'];
        // ignore: avoid_print
        print(business[0]['title'].toString());
        emit(NewsGetBusinessSuccessState());
      }).catchError((error) {
        // ignore: avoid_print
        print(error.toString());
        emit(NewsGetBusinessErrorState(error.toString()));
      });
    } else {
      emit(NewsGetBusinessSuccessState());
    }
  }

  void getSports() {
    emit(NewsGetSportsLoadingState());

    if (sports.isEmpty) {
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country': getCountry(),
        'category': 'sports',
        'apikey': 'a155e510dbaa49d48f378dbabd7120e1',
      }).then((value) {
        // ignore: avoid_print
        // print(value.data.toString());
        sports = value.data['articles'];
        // ignore: avoid_print
        print(business[0]['sports'].toString());
        emit(NewsGetSportsSuccessState());
      }).catchError((error) {
        // ignore: avoid_print
        print(error.toString());
        emit(NewsGetSportsErrorState(error.toString()));
      });
    } else {
      emit(NewsGetSportsSuccessState());
    }
  }

  void getScience() {
    emit(NewsGetScienceLoadingState());

    if (science.isEmpty) {
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country': getCountry(),
        'category': 'science',
        'apikey': 'a155e510dbaa49d48f378dbabd7120e1',
      }).then((value) {
        // ignore: avoid_print
        // print(value.data.toString());
        science = value.data['articles'];
        // ignore: avoid_print
        print(business[0]['science'].toString());
        emit(NewsGetScienceSuccessState());
      }).catchError((error) {
        // ignore: avoid_print
        print(error.toString());
        emit(NewsGetScienceErrorState(error.toString()));
      });
    } else {
      emit(NewsGetScienceSuccessState());
    }
  }

  void getSearch(String value) {
    emit(NewsGetSearchLoadingState());

    //if (search.isEmpty) {
    DioHelper.getData(url: 'v2/everything', query: {
      'q': value,
      'apikey': 'a155e510dbaa49d48f378dbabd7120e1',
    }).then((value) {
      // ignore: avoid_print
      // print(value.data.toString());
      search = value.data['articles'];
      // ignore: avoid_print
      emit(NewsGetSearchSuccessState());
    }).catchError((error) {
      // ignore: avoid_print
      print(error.toString());
      emit(NewsGetSearchErrorState(error.toString()));
    });
    // } else {
    //   emit(NewsGetSearchSuccessState());
    // }
  }

  String getCountry() {
    if (CacheHalper.getCountry(selectedCountry: 'selectedCountry') != null) {
      country = CacheHalper.getCountry(selectedCountry: 'selectedCountry')!;
    }
    return country;
  }

  void changeCountry() {
    emit(ChangeCountryState());
  }
}
