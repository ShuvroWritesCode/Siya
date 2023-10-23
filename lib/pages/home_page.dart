import 'package:flutter/material.dart';
import 'package:siya/widgets/card_category.dart';
import 'package:siya/widgets/card_product.dart';
import '../model/product_model.dart';
import '../widgets/card_product.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryWithProduct> listCategory = [];

  void populateListCategory() {
    listCategory = [
      CategoryWithProduct(
        idCategory: 'vitamin',
        category: 'vitamin',
        image: 'assets/img_cough.png',
        status: 'available',
        product: [],
      ),
    ];
  }

  @override
  void initState() {
    super.initState();
    populateListCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(24, 30, 24, 30),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Find a medicine or vitamins \nat SIYA!",
                      style: TextStyle(
                        color: Colors.green.shade700,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.green.shade100,
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.green.shade700,
                  ),
                  hintText: "Search medicine...",
                  hintStyle: TextStyle(
                    color: Colors.green.shade700,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Text(
              "Medicine & Vitamins by Category",
              style: TextStyle(
                color: Colors.green.shade700,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            CardProduct(
              imageProduct: "assets/img_vitamins.png",
              nameProduct: "vitamin",
              price: "225",
            ),
            CardProduct(
              imageProduct: "assets/img_vitamins.png",
              nameProduct: "vitamin",
              price: "225",
            ),
            CardProduct(
              imageProduct: "assets/img_vitamins.png",
              nameProduct: "vitamin",
              price: "225",
            ),
            const SizedBox(
              height: 14,
            ),
          ],
        ),
      ),
    );
  }
}