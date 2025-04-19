// ignore_for_file: prefer_const_constructors

import 'package:e_commerce/provider/favourite_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

class Favourite extends StatefulWidget {
  const Favourite({super.key});

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  @override
  Widget build(BuildContext context) {
    // Access the provider
    final provider = Provider.of<FavouriteProvider>(context, listen: true);

    // Get the list of favourites
    List favourites = provider.favourites;

    return Scaffold(
      body: favourites.isEmpty
          ? Center(
        child: Text(
          "No favourites yet!",
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      )
          : ListView.builder(
        itemCount: favourites.length,
        itemBuilder: (context, index) {
          final item = favourites[index];
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Slidable(
              endActionPane: ActionPane(motion: ScrollMotion(), children: [
                SlidableAction(
                  onPressed: (context){
                    favourites.removeAt(index);
                    setState(() {});
                  },
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                  label: "Delete",
                )
              ]),
              child: ListTile(
                leading: Image.asset(
                  item.image, // Assuming `item` has an `image` property
                  width: 50,
                  height: 100,
                  fit: BoxFit.values.last,
                ),
                title: Text(item.name,style: TextStyle(fontWeight: FontWeight.bold),), // Assuming `item` has a `name` property
                subtitle: Text(item.category), // Assuming `item` has a `category` property
                trailing:Text(
                  r'$' + favourites[index].price.toString(),
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700,color: Colors.red),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
