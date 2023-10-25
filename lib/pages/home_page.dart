import 'package:flutter/material.dart';
import 'package:siya/constants.dart';
import 'package:siya/widgets/card_product.dart';
import '../model/product_model.dart';

class HomePage extends StatefulWidget {

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
    return const Scaffold(
      body: Center(
        child: Text("my home",style: TextStyle(color: kGreenSecondaryColor),),
      ),
    );
  }
}
