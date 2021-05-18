import 'package:flutter/material.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/widgets/article_item.dart';

class ArticleBuilder extends StatelessWidget {
  final list;
  final isSearch;

  ArticleBuilder({this.list, this.isSearch = false});

  @override
  Widget build(BuildContext context) {
    if (list.length > 0) {
      return ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) => ArticleItem(list[index]),
          separatorBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Divider(),
              ),
          itemCount: AppCubit.get(context).business.length);
    } else {
      return isSearch
          ? Container()
          : Center(child: CircularProgressIndicator());
    }
    // return ConditionalBuilder(
    //   condition: list.length > 0,
    //   builder: (context) => ListView.separated(
    //       physics: BouncingScrollPhysics(),
    //       itemBuilder: (context, index) => ArticleItem(list[index]),
    //       separatorBuilder: (context, index) => Padding(
    //             padding: const EdgeInsets.all(8.0),
    //             child: Divider(),
    //           ),
    //       itemCount: AppCubit.get(context).business.length),
    //   fallback: (context) => Center(child: CircularProgressIndicator()),
    // );
  }
}
