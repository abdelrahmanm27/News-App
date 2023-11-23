import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/theme_cubit.dart';
import 'package:news_app/shared/cubit/theme_states.dart';
import 'package:news_app/shared/network_local/cache_helper.dart';
import 'package:news_app/shared/network_remote/dio_helper.dart';
import 'layout/news_layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHalper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeCubit(),
        ),
        BlocProvider(
          create: (context) => NewsCubit()..getBusiness(),
        ),
      ],
      child: BlocConsumer<ThemeCubit, ThemeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "News App",
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              primarySwatch: Colors.deepOrange,
              appBarTheme: const AppBarTheme(
                  // backwardsCompatibility: false,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    // status bar
                    statusBarColor: Colors.white,
                    statusBarIconBrightness: Brightness.dark,
                  ),
                  backgroundColor: Colors.white,
                  iconTheme: IconThemeData(color: Colors.black),
                  elevation: 0.0,
                  titleTextStyle: TextStyle(color: Colors.black)),
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.deepOrange,
                  backgroundColor: Colors.white),
              textTheme: const TextTheme(
                bodyLarge: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
            ),
            darkTheme: ThemeData(
              scaffoldBackgroundColor: HexColor('#333739'),
              primarySwatch: Colors.deepOrange,
              appBarTheme: AppBarTheme(
                  // backwardsCompatibility: false,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    // status bar
                    statusBarColor: HexColor('#333739'),
                    statusBarIconBrightness: Brightness.light,
                  ),
                  backgroundColor: HexColor('#333739'),
                  iconTheme: const IconThemeData(color: Colors.white),
                  elevation: 0.0,
                  titleTextStyle: const TextStyle(color: Colors.white)),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepOrange,
                unselectedItemColor: Colors.grey,
                backgroundColor: HexColor('#222628'),
              ),
              textTheme: const TextTheme(
                bodyLarge: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ),
            themeMode: ThemeCubit.get(context).appDarkMode()
                ? ThemeMode.dark
                : ThemeMode.light,
            home: const NewsLayout(),
          );
        },
      ),
    );
  }
}
