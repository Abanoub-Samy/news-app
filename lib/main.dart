import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/cubit/bloc_observer.dart';
import 'package:news_app/cubit/cache_helper.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/dio_helper.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/screens/search_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  bool? isDark = CacheHelper.getData('isDark');
  runApp(BlocProvider(
      create: (BuildContext ctx) => AppCubit()..getBusiness()..changeAppMode(fromShared: isDark),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (ctx, state) {},
        builder: (ctx, state) {
          return MyApp(isDark!);
        },
      )));
}

class MyApp extends StatelessWidget {
  final bool isDark ;

  MyApp(this.isDark) ;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.purple,
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.purple,
          ),
          textTheme: TextTheme(
            headline1: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          iconTheme: IconThemeData()),
      darkTheme: ThemeData(
          primaryColor: Colors.deepOrange,
          appBarTheme: AppBarTheme(
            backwardsCompatibility: false,
            color: Colors.deepOrange,
          ),
          scaffoldBackgroundColor: HexColor('333739'),
          primarySwatch: Colors.deepOrange,
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.deepOrange,
          ),
          textTheme: TextTheme(
            headline1: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          iconTheme: IconThemeData()
      ),
      themeMode:
          AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      routes: {
        SearchScreen.routeName :(ctx) => SearchScreen(),
      },
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
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, SearchScreen.routeName);
            },
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              AppCubit.get(context).changeAppMode();
            },
            icon: cubit.isDark
                ? Icon(Icons.brightness_4_outlined)
                : Icon(
                    Icons.brightness_4_outlined,
                    color: Colors.black,
                  ),
          ),
        ],
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
