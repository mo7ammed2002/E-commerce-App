// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, prefer_const_literals_to_create_immutables

import 'package:e_commerce/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

import '../components/utils.dart';
import '../main.dart';

class CartDetail extends StatefulWidget {
  const CartDetail({super.key});

  @override
  State<CartDetail> createState() => _CartDetailState();
}

class _CartDetailState extends State<CartDetail> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CartProvider>(context, listen: true);
    final productList = provider.cart;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cart',
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
          ),
        ),
        elevation: 2,
        centerTitle: true,
      ),
      body: productList.isEmpty
          ? Center(
              child: Text(
                'Your cart is empty!',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            )
          : Column(
              children: [
                Consumer<CartProvider>(builder: (context, index, child) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: productList.length,
                      itemBuilder: (context, index) {
                        return Slidable(
                          endActionPane:
                              ActionPane(motion: ScrollMotion(), children: [
                            SlidableAction(
                              onPressed: (context) {
                                provider.toRemove(index);
                              },
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.red,
                              label: "Delete",
                            )
                          ]),
                          child: Card(
                            child: ListTile(
                              leading: Image(
                                  image: AssetImage(
                                productList[index].image,
                              )),
                              title: Text(
                                productList[index].name,
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w700),
                              ),
                              subtitle: Text(
                                productList[index].category,
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w400),
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        // Handle increase quantity
                                        provider.increaseQuantity(index);
                                      },
                                      iconSize: 20,
                                      icon: Icon(Icons.add),
                                      style: IconButton.styleFrom(
                                        backgroundColor: Colors
                                            .red, // Set the button's background color
                                        foregroundColor: Colors
                                            .white, // Set the icon's color
                                      )),
                                  Text(
                                    " " +
                                        productList[index].quantity.toString() +
                                        " ",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      // Handle decrease quantity
                                      provider.decreaseQuantity(index);
                                    },
                                    iconSize: 20,
                                    style: IconButton.styleFrom(
                                      backgroundColor: Colors
                                          .red, // Set the button's background color
                                      foregroundColor:
                                          Colors.white, // Set the icon's color
                                    ),
                                    color: Colors.white,
                                    icon: Icon(Icons.remove),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }),
                Consumer<CartProvider>(builder: (context, index, child) {
                  return Container(
                    height: 80,
                    width: double.infinity,
                    decoration: BoxDecoration(color: Colors.red),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text(
                            r"$" + provider.getTotalPrice().toString(),
                            style: TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            provider.orderProduct();
                            // Fluttertoast();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BottomNavigation()));
                          },
                          child: Text(
                            'Order Now',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        SizedBox(
                          width: 50,
                        )
                      ],
                    ),
                  );
                })
              ],
            ),
    );
  }
}
