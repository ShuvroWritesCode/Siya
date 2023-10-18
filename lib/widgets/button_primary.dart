import 'package:flutter/material.dart';
import 'package:siya/theme.dart';

class ButtonPrimary extends StatelessWidget {
  final String text;
  final Function? onTap;

  ButtonPrimary({required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 100,
      height: 50,
      child: ElevatedButton(
        onPressed: onTap as void Function()?,
        child: Text(text),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green.shade600,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
