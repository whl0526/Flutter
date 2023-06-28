import 'package:flutter/material.dart';
import 'package:flutter_lab/ch2/test.dart';
import 'one_screen.dart';
import 'two_screen.dart';
import 'three_screen.dart';
import 'four_screen.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/one',
      routes: {
        '/one' : (context) => OneScreen(),
        '/two' : (context) => TwoScreen(),
        '/three' : (context) => ThreeScreen(),
        '/four' : (context) => FourScreen(),
      },
    );
  }
}