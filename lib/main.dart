import 'package:flutter/material.dart';
import 'package:intro_page/pages/home_page.dart';
import 'package:intro_page/pages/intro_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: IntroPage(),
      routes: {
        HomePage.id: (context) => HomePage(),
        IntroPage.id: (context) => IntroPage(),
      },
    );
  }
}
