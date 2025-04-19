// ignore_for_file: prefer_interpolation_to_compose_strings, prefer_const_constructors

import 'package:flutter/material.dart';

class AvailableSize extends StatefulWidget {
  final String size;
  const AvailableSize({super.key, required this.size});

  @override
  State<AvailableSize> createState() => _AvailableSizeState();
}

class _AvailableSizeState extends State<AvailableSize> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(top: 5, right: 10, left: 10, bottom: 10),
        decoration: BoxDecoration(
            color: isSelected ? Colors.red : Colors.grey,
            borderRadius: BorderRadius.circular(8)),
        height: 25,
        width: 50,
        child: Center(
            child: Text(
          'US' + widget.size,
          style: TextStyle(fontSize: 12,color: Colors.white, fontWeight: FontWeight.w600),
        )),
      ),
    );
  }
}
