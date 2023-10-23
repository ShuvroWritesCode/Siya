import 'package:flutter/material.dart';

class CardCategory extends StatelessWidget {
  final String imageCategory;
  final String nameCategory;

  CardCategory({required this.imageCategory, required this.nameCategory});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          imageCategory,
          width: 65,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          nameCategory,
          style: TextStyle(
            color: Colors.green.shade700,
            fontSize: 20,
            fontWeight:
            FontWeight.w500,
          ),
        )
      ],
    );
  }
}