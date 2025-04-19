// ignore_for_file: prefer_const_constructors

import 'package:e_commerce/model/product.dart';
import 'package:e_commerce/provider/favourite_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      width: MediaQuery.of(context).size.width / 2.5,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.19),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Consumer<FavouriteProvider>(
                builder: (context, provider, child) {
                  return GestureDetector(
                    onTap: () {
                      provider.toggleFavourites(product);
                    },
                    child: Icon(
                      provider.isExist(product)
                          ? Icons.favorite
                          : Icons.favorite_border_outlined,
                      color: Colors.red,
                    ),
                  );
                },
              ),
            ],
          ),
          SizedBox(
            height: 115,
            width: double.infinity,
            child: Image.asset(
              product.image,
              fit: BoxFit.values.last,
              errorBuilder: (context, error, stackTrace) {
                return Icon(Icons.broken_image, size: 100);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Text(
              product.name,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
            ),
          ),
          Text(
            product.category,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
          ),
          Text(
            r'$' + product.price.toString(),
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
