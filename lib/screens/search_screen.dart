import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/widgets/article_builder.dart';

class SearchScreen extends StatelessWidget {


  static String routeName = '/search-screen';

  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController();
    return BlocConsumer<AppCubit, AppStates>(
        builder: (ctx, state) {
          var list = AppCubit.get(context).search;
          return Scaffold(
            appBar: AppBar(
              title: const Text('Search Screen'),
            ),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    controller: searchController,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Please enter word to search';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Search',
                      prefix: Icon(Icons.search,color: Colors.white,),
                    ),
                    onChanged: (value) {
                      AppCubit.get(context).getSearch(value);
                    },
                  ),
                ),
                Expanded(
                  child: ArticleBuilder(list: list,),
                )
              ],
            ),
          );
        },
        listener: (ctx, state) {});
  }
}
