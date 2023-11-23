// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/shared/cubit/theme_cubit.dart';
import 'package:news_app/shared/network_local/cache_helper.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            color: ThemeCubit.get(context).appDarkMode()
                ? HexColor('#333739')
                : Colors.white,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    'Choose Country',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  RadioListTile(
                    secondary: Icon(
                      Icons.flag,
                      color: ThemeCubit.get(context).appDarkMode()
                          ? Colors.white
                          : Colors.black,
                    ),
                    selected:
                        NewsCubit.get(context).getCountry() == 'eg' ? true : false,
                    title: Text(
                      'Egypt',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    value: 'eg',
                    groupValue: NewsCubit.get(context).getCountry(),
                    onChanged: (val) {
                      CacheHalper.setCountry(
                          selectedCountry: 'selectedCountry', value: val!);
                      NewsCubit.get(context).changeCountry();
                    },
                  ),
                  RadioListTile(
                    secondary: Icon(
                      Icons.flag,
                      color: ThemeCubit.get(context).appDarkMode()
                          ? Colors.white
                          : Colors.black,
                    ),
                    selected:
                        NewsCubit.get(context).getCountry() == 'us' ? true : false,
                    title: Text(
                      'United States',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    value: 'us',
                    groupValue: NewsCubit.get(context).getCountry(),
                    onChanged: (val) {
                      CacheHalper.setCountry(
                          selectedCountry: 'selectedCountry', value: val!);
                      NewsCubit.get(context).changeCountry();
                    },
                  ),
                   RadioListTile(
                    secondary: Icon(
                      Icons.flag,
                      color: ThemeCubit.get(context).appDarkMode()
                          ? Colors.white
                          : Colors.black,
                    ),
                    selected:
                        NewsCubit.get(context).getCountry() == 'tr' ? true : false,
                    title: Text(
                      'Turkey',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    value: 'tr',
                    groupValue: NewsCubit.get(context).getCountry(),
                    onChanged: (val) {
                      CacheHalper.setCountry(
                          selectedCountry: 'selectedCountry', value: val!);
                      NewsCubit.get(context).changeCountry();
                    },
                  ),
                   RadioListTile(
                    secondary: Icon(
                      Icons.flag,
                      color: ThemeCubit.get(context).appDarkMode()
                          ? Colors.white
                          : Colors.black,
                    ),
                    selected:
                        NewsCubit.get(context).getCountry() == 'ae' ? true : false,
                    title: Text(
                      'UAE',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    value: 'ae',
                    groupValue: NewsCubit.get(context).getCountry(),
                    onChanged: (val) {
                      CacheHalper.setCountry(
                          selectedCountry: 'selectedCountry', value: val!);
                      NewsCubit.get(context).changeCountry();
                    },
                  ),
                   RadioListTile(
                    secondary: Icon(
                      Icons.flag,
                      color: ThemeCubit.get(context).appDarkMode()
                          ? Colors.white
                          : Colors.black,
                    ),
                    selected:
                        NewsCubit.get(context).getCountry() == 'sa' ? true : false,
                    title: Text(
                      'Saudi Arabia',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    value: 'sa',
                    groupValue: NewsCubit.get(context).getCountry(),
                    onChanged: (val) {
                      CacheHalper.setCountry(
                          selectedCountry: 'selectedCountry', value: val!);
                      NewsCubit.get(context).changeCountry();
                    },
                  ),
                   RadioListTile(
                    secondary: Icon(
                      Icons.flag,
                      color: ThemeCubit.get(context).appDarkMode()
                          ? Colors.white
                          : Colors.black,
                    ),
                    selected:
                        NewsCubit.get(context).getCountry() == 'ru' ? true : false,
                    title: Text(
                      'Russia',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    value: 'ru',
                    groupValue: NewsCubit.get(context).getCountry(),
                    onChanged: (val) {
                      CacheHalper.setCountry(
                          selectedCountry: 'selectedCountry', value: val!);
                      NewsCubit.get(context).changeCountry();
                    },
                  ),
                   RadioListTile(
                    secondary: Icon(
                      Icons.flag,
                      color: ThemeCubit.get(context).appDarkMode()
                          ? Colors.white
                          : Colors.black,
                    ),
                    selected:
                        NewsCubit.get(context).getCountry() == 'de' ? true : false,
                    title: Text(
                      'Germany',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    value: 'de',
                    groupValue: NewsCubit.get(context).getCountry(),
                    onChanged: (val) {
                      CacheHalper.setCountry(
                          selectedCountry: 'selectedCountry', value: val!);
                      NewsCubit.get(context).changeCountry();
                    },
                  ),
                   RadioListTile(
                    secondary: Icon(
                      Icons.flag,
                      color: ThemeCubit.get(context).appDarkMode()
                          ? Colors.white
                          : Colors.black,
                    ),
                    selected:
                        NewsCubit.get(context).getCountry() == 'fr' ? true : false,
                    title: Text(
                      'France',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    value: 'fr',
                    groupValue: NewsCubit.get(context).getCountry(),
                    onChanged: (val) {
                      CacheHalper.setCountry(
                          selectedCountry: 'selectedCountry', value: val!);
                      NewsCubit.get(context).changeCountry();
                    },
                  ),
                   RadioListTile(
                    secondary: Icon(
                      Icons.flag,
                      color: ThemeCubit.get(context).appDarkMode()
                          ? Colors.white
                          : Colors.black,
                    ),
                    selected:
                        NewsCubit.get(context).getCountry() == 'ca' ? true : false,
                    title: Text(
                      'Canada',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    value: 'ca',
                    groupValue: NewsCubit.get(context).getCountry(),
                    onChanged: (val) {
                      CacheHalper.setCountry(
                          selectedCountry: 'selectedCountry', value: val!);
                      NewsCubit.get(context).changeCountry();
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
