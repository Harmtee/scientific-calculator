import 'package:flutter/material.dart';

import 'package:scientific_calculator/widgets/display.dart';

class Screen extends StatelessWidget {
  final scrollController;

  final isDeg;

  Screen({
    Key? key,
    required this.scrollController,
    required this.input,
    required this.output,
    this.isDeg,
  }) : super(key: key);

  final String input;
  final String output;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 40, left: 8),
            alignment: Alignment.topLeft,
            height: 20,
            child: Text(isDeg ? 'deg' : 'rad'),
          ),
          Display(
            scrollController: scrollController,
            value: input,
          ),
          Display(
            backgroundColor: Colors.blueGrey[50],
            value: output,
          ),
        ],
      ),
    );
  }
}
