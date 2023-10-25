import 'package:flutter/material.dart';

class CardProduct extends StatelessWidget {
  final String imageProduct;
  final String nameProduct;
  final String price;
  CardProduct({required this.imageProduct, required this.nameProduct, required this.price});

  @override
  Widget build(BuildContext context) {
    // final priceFormat = NumberFormat("#,##0", "EN_US");
    return Container(
      decoration: BoxDecoration(
        color: Colors.green.shade100,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Image.asset(
            "assets/img_vitamins.png",
            width: 115,
            height: 76,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "vitamin",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.green.shade700,
              fontWeight: FontWeight.bold,
            ),
            ),
          SizedBox(
            height: 14,
          ),
        ],
      ),
    );
  }
}