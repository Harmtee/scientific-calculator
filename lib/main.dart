import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:scientific_calculator/widgets/numpad.dart';
import 'package:scientific_calculator/widgets/scipad.dart';
import 'package:scientific_calculator/widgets/screen.dart';
import 'package:scientific_calculator/widgets/signpad.dart';
import 'package:vector_math/vector_math.dart' as Vec;
import 'dart:math' as Math;

void main() {
  runApp(Calculator());
}

class Calculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  Home({key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _screenInput = '';
  String _inputToEval = '';
  String _screenOutput = '';
  bool _isScience = false;
  bool _isInverse = false;
  bool _isDeg = false;

  var _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    var _deviceWidth = MediaQuery.of(context).size.width;
    var _isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Screen(
              isDeg: _isDeg,
              input: _screenInput,
              output: _screenOutput,
              scrollController: _scrollController,
            ),
          ),
          Expanded(
            flex: _isPortrait ? 2 : 1,
            child: Container(
              color: Color(0xFFE7E7E7),
              constraints: BoxConstraints.expand(),
              child: _isPortrait ? portraitBody(_deviceWidth) : landScapeBody(),
            ),
          ),
        ],
      ),
    );
  }

  Widget landScapeBody() {
    return Container(
      height: double.maxFinite,
      child: Row(
        children: [
          Expanded(
            flex: 3,
            // child: Container(),
            child: NumPad(
              isDeg: _isDeg,
              isInverse: _isInverse,
              keyTap: displayValue,
            ),
          ),
          Expanded(
            flex: 2,
            child: SignPad(
              longPress: clearInput,
              isDeg: _isDeg,
              isInverse: _isInverse,
              onTap: displayValue,
            ),
          ),
          Expanded(
            flex: 3,
            child: SciPad(
              isInverse: _isInverse,
              keyTap: displayValue,
              isDeg: _isDeg,
            ),
          ),
        ],
      ),
    );
  }

  Widget portraitBody(double _deviceWidth) {
    return Stack(
      children: [
        Positioned(
          width: ((_deviceWidth - 30) * 3 / 4),
          left: 0,
          top: 0,
          bottom: 0,
          child: NumPad(
            isInverse: _isInverse,
            keyTap: displayValue,
          ),
        ),
        Positioned(
          right: 30,
          top: 0,
          bottom: 0,
          width: (_deviceWidth - 30) / 4,
          child: SignPad(
            longPress: clearInput,
            isDeg: _isDeg,
            onTap: displayValue,
            isInverse: _isInverse,
          ),
        ),
        AnimatedPositioned(
          duration: Duration(milliseconds: 400),
          left: _isScience ? 50 : _deviceWidth - 30,
          top: 0,
          bottom: 0,
          width: _deviceWidth - 50,
          child: GestureDetector(
            onTap: () {
              setState(() {
                _isScience = true;
              });
            },
            onHorizontalDragUpdate: (details) {
              print(details.primaryDelta);
              setState(() {
                _isScience = details.primaryDelta! < 0;
              });
            },
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AnimatedOpacity(
                  opacity: _isScience ? 0 : 1,
                  duration: Duration(milliseconds: 200),
                  child: Container(
                    color: Color(0xFFFD7200),
                    constraints:
                        BoxConstraints.expand(width: _isScience ? 0 : 30),
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: RotatedBox(
                      quarterTurns: 1,
                      child: Icon(
                        Icons.expand_more_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: SciPad(
                    isInverse: _isInverse,
                    keyTap: displayValue,
                    isDeg: _isDeg,
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          child: GestureDetector(
            onTap: () {
              setState(() {
                _isScience = !_isScience;
              });
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 400),
              width: _isScience ? 50 : 0,
              color: Color(0x52000000),
            ),
          ),
        ),
      ],
    );
  }

  void displayValue(value, label) {
    switch (value) {
      case 'inv':
        setState(() {
          _isInverse = !_isInverse;
        });
        break;
      case '=':
        result();
        break;
      case 'deg':
      case 'rad':
        setState(() {
          _isDeg = !_isDeg;
        });
        break;
      case 'del':
        var evalDigit = 1, screenDigit = 1;
        if (_screenInput.endsWith('sin(') ||
            _screenInput.endsWith('cos(') ||
            _screenInput.endsWith('tan('))
          screenDigit = evalDigit = 4;
        else if (_screenInput.endsWith('sin⁻¹(') ||
            _screenInput.endsWith('cos⁻¹(') ||
            _screenInput.endsWith('tan⁻¹(')) {
          evalDigit = 7;
          screenDigit = 6;
        } else if (_screenInput.endsWith('ⁿ√')) {
          evalDigit = 3;
          screenDigit = 2;
        } else if (_screenInput.endsWith('√')) {
          evalDigit = 4;
        } else if (_screenInput.endsWith('ln(')) {
          screenDigit = evalDigit = 3;
        } else if (_screenInput.endsWith('e\u02e3') ||
            _screenInput.endsWith('xⁿ')) {
          screenDigit = 2;
          evalDigit = 1;
        } else if (_screenInput.endsWith('x²')) {
          evalDigit = screenDigit = 2;
        } else if (_screenInput.endsWith('10\u02e3')) {
          evalDigit = screenDigit = 2;
        } else if (_screenInput.endsWith('𝝅')) {
          evalDigit = 2;
          screenDigit = 1;
        }
        setState(() {
          _screenInput = _screenInput.substring(
              0, Math.max(_screenInput.length - screenDigit, 0));
          _inputToEval = _inputToEval.substring(
              0, Math.max(_inputToEval.length - evalDigit, 0));
        });
        try {
          solve();
        } catch (e) {}
        break;
      default:
        setState(() {
          _screenInput += label;
          _inputToEval += value;
        });
        break;
    }

    try {
      solve();
    } catch (e) {
      print(e);
    }
    _scrollController.animateTo(_scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 500), curve: Curves.ease);
  }

  void solve() {
    if (_inputToEval != '') {
      Parser p = Parser();
      ContextModel cm = ContextModel();
      Variable x = Variable('x');
      Variable pi = Variable('pi');
      cm.bindVariable(x, Number(Math.e));
      cm.bindVariable(pi, Number(Math.pi));
      var source = _inputToEval;
      var pattern = RegExp(
          r"(\d+[.]?\d*)(sin\(|cos\(|tan\(|arcsin\(|arccos\(|arctan\(|ln\(|log\(|x|pi)");
      if (pattern.hasMatch(source)) {
        print('Match here 1');
        source = source.replaceAllMapped(pattern, (match) {
          var res = match.group(0)?.replaceFirstMapped(RegExp(r"(\d]*[.])?\d+"),
              (mat) {
            return "${mat.group(0)}*";
          });
          return "$res";
        });
      }
      pattern = RegExp(r"((\d*[.])?\d+)!");
      if (pattern.hasMatch(source)) {
        source = source.replaceAllMapped(pattern, (match) {
          dynamic res = match.group(0);
          res = res.substring(0, res.length - 1);
          return factorial(int.parse("$res")).toString();
        });
      }
      if (_isDeg) {
        pattern = RegExp(r"(arcsin\(|arccos\(|arctan\()(.*?\))");
        if (pattern.hasMatch(source)) {
          source = source.replaceAllMapped(pattern, (match) {
            Parser arcP = Parser();
            ContextModel cmd2 = ContextModel();
            dynamic mch2 = match.group(0);
            Expression expr = arcP.parse(mch2);
            double arcEvl2 = expr.evaluate(EvaluationType.REAL, cmd2);
            double arcDegEvl = Vec.degrees(arcEvl2);
            return "$arcDegEvl";
          });
        }
        pattern = RegExp(r"(sin\(|cos\(|tan\()(.*?\))");
        if (pattern.hasMatch(source)) {
          source = source.replaceAllMapped(pattern, (match) {
            var evaluated =
                match.group(0)?.replaceFirstMapped(RegExp(r"\((.*?)\)"), (mat) {
              dynamic deg = mat.group(0);
              Parser ps = Parser();
              ContextModel cmd = ContextModel();
              Expression expr = ps.parse(deg);
              double evl = expr.evaluate(EvaluationType.REAL, cmd);
              double degEvl = Vec.radians(evl);
              return "$degEvl";
            });
            return "$evaluated";
          });
        }
      }
      Expression exp = p.parse(source);
      double eval = exp.evaluate(EvaluationType.REAL, cm);
      _screenOutput = eval.toString();
      if (_screenOutput.endsWith('.0'))
        _screenOutput = _screenOutput.substring(0, _screenOutput.length - 2);
    } else {
      _screenOutput = '';
    }
    setState(() {
      _screenOutput = _screenOutput;
    });
  }

  void result() {
    try {
      solve();
      setState(() {
        print(_screenOutput);
        _screenInput = _screenOutput;
        _inputToEval = _screenInput;
      });
    } catch (e) {
      setState(() {
        _screenOutput = 'Invalid input';
      });
      _screenOutput = '';
    }
  }

  void clearInput() {
    reset();
    _screenOutput = '';
  }

  void reset() {
    setState(() {
      _screenInput = '';
      _inputToEval = '';
    });
  }

  int factorial(int value) {
    if (value == 1) return 1;
    return value * factorial(value - 1);
  }
}
