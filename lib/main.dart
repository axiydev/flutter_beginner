import 'package:flutter/material.dart';
import 'package:flutter_beginner/pages/first_page/first_page.dart';
import 'package:flutter_beginner/pages/second_page/second_page.dart';
import 'package:flutter_beginner/pages/third_page/third_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        FirstPage.path: (context) => const FirstPage(),
        SecondPage.path: (context) => const SecondPage(),
        ThirdPage.path: (context) => const ThirdPage()
      },
      initialRoute: FirstPage.path,
    );
  }
}
