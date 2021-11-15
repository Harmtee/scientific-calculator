import 'package:flutter/material.dart';
import 'package:scientific_calculator/widgets/keypad.dart';

class NumPad extends StatelessWidget {
  final keyTap;

  final isInverse;

  final isDeg;

  NumPad({Key? key, this.keyTap, this.isInverse, this.isDeg}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Container(
      color: Colors.black87,
      child: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Keypad(
                    label: '7',
                    value: '7',
                    onTap: keyTap,
                    isInverse: isInverse,
                    isDeg: isDeg,
                  ),
                ),
                Expanded(
                  child: Keypad(
                    label: '8',
                    value: '8',
                    onTap: keyTap,
                    isInverse: isInverse,
                    isDeg: isDeg,
                  ),
                ),
                Expanded(
                  child: Keypad(
                    label: '9',
                    value: '9',
                    onTap: keyTap,
                    isInverse: isInverse,
                    isDeg: isDeg,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Keypad(
                    label: '4',
                    value: '4',
                    onTap: keyTap,
                    isInverse: isInverse,
                    isDeg: isDeg,
                  ),
                ),
                Expanded(
                  child: Keypad(
                    label: '5',
                    value: '5',
                    onTap: keyTap,
                    isInverse: isInverse,
                    isDeg: isDeg,
                  ),
                ),
                Expanded(
                  child: Keypad(
                    label: '6',
                    value: '6',
                    onTap: keyTap,
                    isInverse: isInverse,
                    isDeg: isDeg,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Keypad(
                    label: '1',
                    value: '1',
                    onTap: keyTap,
                    isInverse: isInverse,
                    isDeg: isDeg,
                  ),
                ),
                Expanded(
                  child: Keypad(
                    label: '2',
                    value: '2',
                    onTap: keyTap,
                    isInverse: isInverse,
                    isDeg: isDeg,
                  ),
                ),
                Expanded(
                  child: Keypad(
                    label: '3',
                    value: '3',
                    onTap: keyTap,
                    isInverse: isInverse,
                    isDeg: isDeg,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Keypad(
                    label: '.',
                    value: '.',
                    onTap: keyTap,
                    isInverse: isInverse,
                    isDeg: isDeg,
                  ),
                ),
                Expanded(
                  child: Keypad(
                    label: '0',
                    value: '0',
                    onTap: keyTap,
                    isInverse: isInverse,
                    isDeg: isDeg,
                  ),
                ),
                _isPortrait
                    ? Expanded(
                        child: Keypad(
                          label: '=',
                          value: '=',
                          onTap: keyTap,
                          isInverse: isInverse,
                          isDeg: isDeg,
                        ),
                      )
                    : Expanded(child: Container()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
