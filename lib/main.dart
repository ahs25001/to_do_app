import 'package:flutter/material.dart';
import 'package:to_do/layout/homeLayout.dart';
import 'package:to_do/styles/myThem.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MyThem.light,
      routes: {
        HomeLayout.routName:(context) => HomeLayout()
      },
      initialRoute: HomeLayout.routName,
      debugShowCheckedModeBanner: false,
    );
  }
}
