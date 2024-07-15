import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:route_task/view/home_screen.dart';
import 'package:route_task/view_model/bloc/bloc_observer.dart';

void main(){
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      routes: {
        HomeScreen.routeName :(context)=>const HomeScreen()
      },
    );
  }
}
