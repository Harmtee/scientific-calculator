import 'package:flutter/material.dart';

class Display extends StatelessWidget {
  final backgroundColor;

  final value;

  Display({
    Key? key,
    required this.value,
    this.backgroundColor = Colors.white,
    this.scrollController,
  }) : super(key: key);
  final scrollController;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: Alignment.centerRight,
        color: backgroundColor,
        child: SingleChildScrollView(
          controller: scrollController,
          scrollDirection: Axis.horizontal,
          child: Text(
            value,
            style: TextStyle(fontSize: 40),
          ),
        ),
      ),
    );
  }
}
