 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:siya/pages/splash_screen.dart';
import 'package:siya/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
    theme: ThemeData(
      scaffoldBackgroundColor: Colors.green.shade50,
    )
    );
  }
}