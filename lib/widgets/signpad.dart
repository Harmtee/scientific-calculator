import 'package:flutter/material.dart';
import 'package:scientific_calculator/widgets/keypad.dart';

class SignPad extends StatelessWidget {
  final onTap;

  final isInverse;

  final isDeg;

  final longPress;

  const SignPad(
      {Key? key, this.onTap, this.isInverse, this.isDeg, this.longPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Container(
      color: Colors.black45,
      child: _isPortrait ? portrait() : landscape(),
    );
  }

  Column portrait() {
    return Column(
      children: [
        Expanded(
          child: Keypad(
            longPress: longPress,
            onTap: onTap,
            isDeg: isDeg,
            label: '⇦',
            value: "del",
          ),
        ),
        Expanded(
          child: Keypad(
            onTap: onTap,
            isDeg: isDeg,
            label: '÷',
            value: "/",
          ),
        ),
        Expanded(
          child: Keypad(
            onTap: onTap,
            isDeg: isDeg,
            label: '×',
            value: "*",
          ),
        ),
        Expanded(
          child: Keypad(
            onTap: onTap,
            isDeg: isDeg,
            label: '-',
            value: "-",
          ),
        ),
        Expanded(
          child: Keypad(
            onTap: onTap,
            isDeg: isDeg,
            label: '+',
            value: "+",
          ),
        ),
      ],
    );
  }

  Column landscape() {
    return Column(
      children: [
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Keypad(
                  longPress: longPress,
                  onTap: onTap,
                  isDeg: isDeg,
                  label: '⇦',
                  value: "del",
                ),
              ),
              Expanded(
                child: Keypad(
                  onTap: onTap,
                  isDeg: isDeg,
                  label: '÷',
                  value: "/",
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Keypad(
                  onTap: onTap,
                  isDeg: isDeg,
                  label: '×',
                  value: "*",
                ),
              ),
              Expanded(child: Container()),
            ],
          ),
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Keypad(
                  onTap: onTap,
                  isDeg: isDeg,
                  label: '-',
                  value: "-",
                ),
              ),
              Expanded(child: Container()),
            ],
          ),
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Keypad(
                  onTap: onTap,
                  isDeg: isDeg,
                  label: '+',
                  value: "+",
                ),
              ),
              Expanded(
                child: Keypad(
                  onTap: onTap,
                  isDeg: isDeg,
                  label: '=',
                  value: "=",
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
