import 'package:flutter/material.dart';
import 'package:siya/theme.dart';

class WidgetIllustration extends StatelessWidget {
  final Widget? child;
  final String? image;
  final String? title;
  final String? subtitle1;
  final String? subtitle2;

  WidgetIllustration({this.child, this.image, this.title, this.subtitle1, this.subtitle2});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          image!,
          width: 250,
        ),
        SizedBox(
          height: 70,
        ),
        Text(
          title!,
          style: TextStyle(
            color: Colors.green.shade900,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 16,
        ),
        Column(
          children: [
            Text(subtitle1!,
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Colors.green.shade900,
                    fontSize: 16
                )
            ),
            SizedBox(
              height: 8,
            ),
            Text(subtitle2!,
                style: TextStyle(
                    color: Colors.green.shade900,
                    fontSize: 16
                )
            ),
            SizedBox(
              height: 50,
            ),
            child ?? SizedBox(),
          ],
        )
      ],
    );
  }
}
