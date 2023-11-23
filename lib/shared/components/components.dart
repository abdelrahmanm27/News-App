// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/web_view/web_view.dart';
import 'package:news_app/shared/cubit/theme_cubit.dart';
import 'package:news_app/shared/cubit/theme_states.dart';

Widget divider() => Padding(
      padding: const EdgeInsets.all(10),
      // ignore: sized_box_for_whitespace
      child: Container(
        width: double.infinity,
        height: 0.5,
        color: Colors.grey[400],
      ),
    );

Widget buildArticleItem(article, context) =>
    BlocConsumer<ThemeCubit, ThemeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return InkWell(
          onTap: () {
            navigateTo(context, WebViewScreen(article['url']));
          },
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: article['urlToImage'] == null
                          ? DecorationImage(
                              image: AssetImage(
                                  'assets/img/no_image_available.PNG'),
                              fit: BoxFit.cover,
                            )
                          : DecorationImage(
                              image: NetworkImage(article['urlToImage']),
                              fit: BoxFit.cover,
                            )),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  // ignore: sized_box_for_whitespace

                  // ignore: sized_box_for_whitespace
                  child: Container(
                    height: 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            '${article['title']}',

                            // 'Title',

                            style: Theme.of(context).textTheme.bodyLarge,

                            maxLines: 3,

                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          '${article['publishedAt']}',

                          //  'Date 12-06-2023',

                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );

void navigateTo(BuildContext context, Widget widget) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => widget));
}
