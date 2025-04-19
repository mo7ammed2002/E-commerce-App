// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:e_commerce/components/available_color.dart';
import 'package:e_commerce/views/cart_detail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/available_size.dart';
import '../model/product.dart';
import '../provider/cart_provider.dart';

class ProductDetail extends StatelessWidget {
  final Product product;
  const ProductDetail({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Details',
          style: TextStyle(
              fontSize: 26, color: Colors.white, fontWeight: FontWeight.w400),
        ),
        backgroundColor: Colors.red,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
        elevation: 2,
        centerTitle: true,
      ),
      body: Center(
        child: ListView(
          children: [
            Container(
                margin: EdgeInsets.symmetric(vertical: 0),
                height: 420,
                decoration: BoxDecoration(
                    color: Colors.red.shade700, shape: BoxShape.circle),
                child: Image.asset(
                  product.image.toString(),
                  fit: BoxFit.fill,
                )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Text(
                      product.name,
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                    ),
                  ),
                  Text(
                    r'$' + product.price.toString(),
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Colors.red),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 28.0, vertical: 2),
              child: Text(
                product.description.toString(),
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: Text(
                'Available Size',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AvailableSize(
                  size: '6',
                ),
                AvailableSize(
                  size: '7',
                ),
                AvailableSize(
                  size: '8',
                ),
                AvailableSize(
                  size: '9',
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: Text(
                'Available Colors ',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AvailableColor(color: Colors.red),
                AvailableColor(color: Colors.blue),
                AvailableColor(color: Colors.orange),
                AvailableColor(color: Colors.green),
                AvailableColor(color: Colors.purple),
              ],
            ),
            InkWell(
              onTap: () {
                provider.toggleCart(product);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CartDetail()));
              },
              child: Container(
                height: 65,
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Add to Cart',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Icon(
                      Icons.send,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
