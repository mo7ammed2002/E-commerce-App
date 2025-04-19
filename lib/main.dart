// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:e_commerce/provider/cart_provider.dart';
import 'package:e_commerce/provider/favourite_provider.dart';
import 'package:e_commerce/views/favourite.dart';
import 'package:e_commerce/views/home.dart';
import 'package:e_commerce/views/profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> FavouriteProvider()),
        ChangeNotifierProvider(create: (_)=> CartProvider())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: BottomNavigation(),
      ),
    );
  }
}
class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
 int selectedIndex = 0;
 List screen = [
   Home(),
   Favourite(),
   Profile()
  ];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('E-commerce',style: TextStyle(
            fontSize: 26,
            color: Colors.white,
            fontWeight: FontWeight.w400
        ),),
        backgroundColor: Colors.red,
        automaticallyImplyLeading: false,
        elevation: 2,
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value){
            setState(() => selectedIndex = value);
          },
          currentIndex: selectedIndex,
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.grey,
          items: [
        BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favourite'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile')
      ]),
      body: screen[selectedIndex],
    );
  }
}
