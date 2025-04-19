// ignore_for_file: prefer_interpolation_to_compose_strings, prefer_const_constructors

import 'package:flutter/material.dart';

class AvailableColor extends StatefulWidget {
  final Color color;
  const AvailableColor({super.key, required this.color});

  @override
  State<AvailableColor> createState() => _AvailableColorState();
}

class _AvailableColorState extends State<AvailableColor> {
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
        margin: EdgeInsets.only(top: 5, right: 10, left: 10, bottom: 10),
        decoration: BoxDecoration(
            color: widget.color,
            shape: BoxShape.circle),
        height: 25,
        width: 25,
        child: isSelected? Icon(Icons.check,color: Colors.white,): Text('')
      ),
    );
  }
}
