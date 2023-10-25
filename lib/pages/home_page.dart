import 'package:flutter/material.dart';
import 'package:siya/widgets/card_product.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("my home"),
      ),
    );
  }
}
