import 'package:flutter/material.dart';

class Keypad extends StatelessWidget {
  final value;
  final onTap;

  final label;

  final label2;

  final isInverse;

  final value2;

  final isDeg;

  final longPress;

  final keyLable2;

  final keyLable;

  Keypad({
    Key? key,
    required this.onTap,
    this.value,
    this.label,
    this.label2,
    this.isInverse,
    this.value2,
    this.isDeg,
    this.longPress,
    this.keyLable2,
    this.keyLable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool switchValue =
        value != 'rad' && value2 != null && isInverse != null && isInverse;
    var _isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Container(
      margin: EdgeInsets.all(2),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onLongPress: () {
            longPress();
          },
          onTap: () {
            var passedValue, passedLabel;
            if (switchValue) {
              passedValue = value2;
              passedLabel = label2;
            } else {
              passedValue = value;
              passedLabel = label;
            }
            onTap(passedValue, passedLabel);
          },
          child: Center(
            child: Text(
              switchValue
                  ? (keyLable2 ?? label2)
                  : ((value == 'rad' && !isDeg)
                      ? (keyLable2 ?? label2)
                      : (keyLable ?? label)),
              style: TextStyle(
                fontSize: _isPortrait ? 20 : 15,
                color: Colors.white,
                fontFamily: 'Comic sans',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
