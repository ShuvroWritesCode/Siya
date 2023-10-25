import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:siya/pages/home_page.dart';
import 'package:siya/pages/splash_screen.dart';
import 'package:siya/pages/profile_page.dart';
import 'package:siya/main_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.green.shade50,
      ),
    );
  }
}