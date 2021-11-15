import 'package:flutter/material.dart';
import 'package:scientific_calculator/widgets/keypad.dart';

class SciPad extends StatelessWidget {
  final keyTap;

  final isInverse;

  final isDeg;

  SciPad({
    Key? key,
    this.keyTap,
    this.isInverse,
    this.isDeg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFFD7200),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Keypad(
                    label: 'INV',
                    value: 'inv',
                    onTap: keyTap,
                    isInverse: isInverse,
                    isDeg: isDeg,
                  ),
                ),
                Expanded(
                  child: Keypad(
                    label: 'RAD',
                    value: 'rad',
                    onTap: keyTap,
                    label2: 'DEG',
                    value2: 'deg',
                    isInverse: isInverse,
                    isDeg: isDeg,
                  ),
                ),
                Expanded(
                  child: Keypad(
                    label: '%',
                    value: '%',
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Keypad(
                    keyLable: 'sin',
                    label: 'sin(',
                    value: 'sin(',
                    onTap: keyTap,
                    keyLable2: 'sin⁻¹',
                    label2: 'sin⁻¹(',
                    value2: 'arcsin(',
                    isInverse: isInverse,
                    isDeg: isDeg,
                  ),
                ),
                Expanded(
                  child: Keypad(
                    keyLable: 'cos',
                    label: 'cos(',
                    value: 'cos(',
                    onTap: keyTap,
                    keyLable2: 'cos⁻¹',
                    label2: 'cos⁻¹(',
                    value2: 'arccos(',
                    isInverse: isInverse,
                    isDeg: isDeg,
                  ),
                ),
                Expanded(
                  child: Keypad(
                    keyLable: 'tan',
                    label: 'tan(',
                    value: 'tan(',
                    onTap: keyTap,
                    keyLable2: 'tan⁻¹',
                    label2: 'tan⁻¹(',
                    value2: 'arctan(',
                    isInverse: isInverse,
                    isDeg: isDeg,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Keypad(
                    keyLable: 'ln',
                    label: 'ln(',
                    value: 'ln(',
                    onTap: keyTap,
                    label2: 'e\u02e3',
                    value2: 'e',
                    isInverse: isInverse,
                    isDeg: isDeg,
                  ),
                ),
                Expanded(
                  child: Keypad(
                    keyLable: 'log',
                    label: 'log(',
                    value: 'log(',
                    onTap: keyTap,
                    label2: '10\u02e3',
                    value2: '10^',
                    isInverse: isInverse,
                    isDeg: isDeg,
                  ),
                ),
                Expanded(
                  child: Keypad(
                    label: '!',
                    value: '!',
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Keypad(
                    label: '𝝅',
                    value: 'pi',
                    onTap: keyTap,
                    isInverse: isInverse,
                    isDeg: isDeg,
                  ),
                ),
                Expanded(
                  child: Keypad(
                    label: 'e',
                    value: 'x',
                    onTap: keyTap,
                    isInverse: isInverse,
                    isDeg: isDeg,
                  ),
                ),
                Expanded(
                  child: Keypad(
                    keyLable: 'xⁿ',
                    label: '^',
                    value: '^',
                    keyLable2: 'ⁿ√',
                    label2: '√',
                    value2: 'nrt',
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Keypad(
                    label: '(',
                    value: '(',
                    onTap: keyTap,
                    isInverse: isInverse,
                    isDeg: isDeg,
                  ),
                ),
                Expanded(
                  child: Keypad(
                    label: ')',
                    value: ')',
                    onTap: keyTap,
                    isInverse: isInverse,
                    isDeg: isDeg,
                  ),
                ),
                Expanded(
                  child: Keypad(
                    label: '√',
                    value: 'sqrt',
                    onTap: keyTap,
                    label2: 'x²',
                    value2: '^2',
                    isInverse: isInverse,
                    isDeg: isDeg,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
