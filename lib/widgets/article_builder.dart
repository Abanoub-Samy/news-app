import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/widgets/article_item.dart';

class ArticleBuilder extends StatelessWidget {
  final list;

  ArticleBuilder({this.list});

  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
      condition: list.length > 0,
      builder: (context) => ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) => ArticleItem(list[index]),
          separatorBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Divider(),
              ),
          itemCount: AppCubit.get(context).business.length),
      fallback: (context) => Center(child: CircularProgressIndicator()),
    );
  }
}
