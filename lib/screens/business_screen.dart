import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/widgets/article_builder.dart';
import 'package:news_app/widgets/article_item.dart';

class BusinessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (ctx, state) {},
      builder: (ctx, state) {
        var list = AppCubit.get(context).business;
        return ArticleBuilder(
          list: list,
        );
      },
    );
  }
}
