import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/search/search.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/shared/network_local/cache_helper.dart';
import '../shared/cubit/theme_cubit.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'News App',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              actions: [
                IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      navigateTo(context, SearchScreen());
                    }),
                IconButton(
                    icon: const Icon(Icons.brightness_4_outlined),
                    onPressed: () {
                      ThemeCubit.get(context).changeAppMode();
                      // ignore: avoid_print
                      print(CacheHalper.getAppMode(isDarkMode: "isDarkMode")
                          .toString());
                    }),
              ],
            ),
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeNavIndex(index);
              },
              items: cubit.navItems,
            ),
          );
        });
  }
}
