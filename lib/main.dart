// import 'package:animation1/home_page.dart';
import 'package:flutter/material.dart';

import 'home_page2.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.light),
      home: HomePage2(),
    );
  }
}
