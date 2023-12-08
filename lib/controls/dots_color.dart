import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DotColors extends StatelessWidget {
  DotColors({super.key, required this.color});

  Color color = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 20,
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(50),
        color: color,
      ),
    );
  }
}
