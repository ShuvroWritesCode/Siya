import 'package:flutter/material.dart';

class GeneralLogoSpace extends StatelessWidget {
  final Widget? child;

  GeneralLogoSpace({this.child});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Vertically center the content
        children: [
          SizedBox(
            height: 20,
          ),
          Image.asset(
            "assets/logo.png",
            width: 115,
          ),
          if (child != null) ...[
            SizedBox(height: 20), // Add some spacing
            child!, // Render child if it's not null
          ],
        ],
      ),
    );
  }
}
