import 'package:flutter/material.dart';

import 'classes/functions.dart';
import 'food_app1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Food App 1',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Builder(
        builder: (context) {
          screenSize = MediaQuery.of(context).size;
          return const FoodApp1();
        },
      ),
    );
  }
}
