import 'package:simple_articles_api/Controller/Cubit/app_cubit.dart';
import 'package:simple_articles_api/Controller/bloc_observer.dart';
import 'package:simple_articles_api/DataSource/Dio_Helper.dart';
import 'package:simple_articles_api/Presentaion/Screens/home_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Controller/Cubit/app_cubit.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  FinalDioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => AppCubit())],
      child: MaterialApp(
        title: 'Eng.Ahmed Tark Task',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
