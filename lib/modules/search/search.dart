import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';

import '../../shared/components/components.dart';

// ignore: must_be_immutable
class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).search;

        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: searchController,
                  keyboardType: TextInputType.text,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Search must not be empty!';
                    }
                    return null;
                  },
                  onChanged: (val) {
                    NewsCubit.get(context).getSearch(val);
                  },
                  decoration: const InputDecoration(
                      label: Text('Search',),
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder()),
                ),
              ),
              Expanded(
                child: ConditionalBuilder(
                  condition: NewsCubit.get(context).search.isNotEmpty,
                  builder: (context) => ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) =>
                          buildArticleItem(list[index], context),
                      separatorBuilder: (context, index) => divider(),
                      itemCount: list.length),
                  fallback: (context) => Center(child: Container()),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
