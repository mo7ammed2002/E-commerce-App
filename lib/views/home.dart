// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:e_commerce/model/my_products.dart';
import 'package:e_commerce/views/product_detail.dart';
import 'package:flutter/material.dart';
import '../components/product_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int isSelected = 0; // Tracks selected category
  Widget displayedContent = Container(); // Tracks the current displayed content

  @override
  void initState() {
    super.initState();
    displayedContent = _buildAllProducts(); // Default to "All Products"
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Our Products',
              style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildProductCategory(
                  index: 0,
                  name: "All Products",
                  on_tap: () {
                    setState(() {
                      isSelected = 0;
                      displayedContent = _buildAllProducts();
                    });
                  },
                ),
                _buildProductCategory(
                  index: 1,
                  name: "Jackets",
                  on_tap: () {
                    setState(() {
                      isSelected = 1;
                      displayedContent = _buildJackets();
                    });
                  },
                ),
                _buildProductCategory(
                  index: 2,
                  name: "Sneakers",
                  on_tap: () {
                    setState(() {
                      isSelected = 2;
                      displayedContent = _buildSneakers();
                    });
                  },
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: displayedContent, // Displays the selected content
            ),
          ],
        ),
      ),
    );
  }

  _buildProductCategory({
    required int index,
    required String name,
    required VoidCallback on_tap,
  }) =>
      InkWell(
        onTap: on_tap,
        child: Container(
          height: 40,
          width: 100,
          margin: EdgeInsets.only(right: 5, top: 10),
          padding: EdgeInsets.all(10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected == index ? Colors.red : Colors.grey,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              name,
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        ),
      );

  _buildAllProducts() => GridView.builder(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: 100 / 140,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
    ),
    scrollDirection: Axis.vertical,
    itemCount: MyProducts.allProducts.length,
    itemBuilder: (context, index) {
      final allProduct = MyProducts.allProducts[index];
      return InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(
                builder: (context)=> ProductDetail(
                    product: allProduct)));
          },
          child: ProductCard(product: allProduct));
    },
  );

  _buildSneakers() => GridView.builder(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: 100 / 140,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
    ),
    scrollDirection: Axis.vertical,
    itemCount: MyProducts.sneakerList.length,
    itemBuilder: (context, index) {
      final sneaker = MyProducts.sneakerList[index];
      return InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(
                builder: (context)=> ProductDetail(
                    product: sneaker)));
          },
          child: ProductCard(product: sneaker));
    },
  );

  _buildJackets() => GridView.builder(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 12,
      childAspectRatio: 100 / 140,
      mainAxisSpacing: 12,
    ),
    scrollDirection: Axis.vertical,
    itemCount: MyProducts.jacketList.length,
    itemBuilder: (context, index) {
      final jacket = MyProducts.jacketList[index];
      return InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(
                builder: (context)=> ProductDetail(
                    product: jacket)));
          },
          child: ProductCard(product: jacket));
    },
  );
}
