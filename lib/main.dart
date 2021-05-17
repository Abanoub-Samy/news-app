import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/bloc_observer.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/dio_helper.dart';
import 'package:news_app/cubit/states.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext ctx) => AppCubit()..getBusiness(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (ctx, state) {},
        builder: (ctx, state) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                primarySwatch: Colors.purple,
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.deepOrange,
                ),
                iconTheme: IconThemeData()),
            home: MyHomePage(title: 'Flutter Demo Home Page'),
          );
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: cubit.bottomItems,
        currentIndex: cubit.currentIndex,
        onTap: (index) {
          cubit.changeBottomNavBar(index);
        },
      ),
      body: cubit.screens[cubit.currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
