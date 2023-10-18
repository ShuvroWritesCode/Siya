import 'package:flutter/material.dart';

class GeneralLogoSpace extends StatelessWidget {
  final Widget? child; // Make child nullable

  GeneralLogoSpace({this.child});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Image.asset(
            "assets/logo.png",
            width: 115,
          ),
          if (child != null) child!, // Use "if" condition to render child if it's not null
        ],
      ),
    );
  }
}
