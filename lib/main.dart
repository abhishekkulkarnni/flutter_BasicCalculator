import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './widgets/CalcButton.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(CalcApp());
}

class CalcApp extends StatefulWidget {
  @override
  CalcAppState createState() => CalcAppState();
}

class CalcAppState extends State<CalcApp> {
  Color appBgColor = Color(0xFF283637);
  double operatorSize = 35.0;

  double expressionSize = 60.0;
  double historyExpressionSize = 40.0;

  String _history = '';
  String _expression = '';

  void numClick(String text) {
    setState(() {
      _expression += text;
    });
  }

  void allClear(String text) {
    setState(() {
      _expression = '';
      _history = '';
    });
  }

  void clear(String text) {
    setState(() {
      _expression = '';
    });
  }

  void evaluate(String text) {
    Parser p = Parser();
    Expression exp = p.parse(_expression);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    setState(() {
      /*
      String temp = eval.toString();
      _history = _expression + '\n' + temp;
       */
      _history = _expression;
      _expression = eval.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator App',
      home: Scaffold(
        backgroundColor: appBgColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.only(right: 12),
              child: Text(
                _history,
                style: GoogleFonts.rubik(
                  textStyle: TextStyle(
                    fontSize: historyExpressionSize,
                  ),
                  color: Color(0xFF545F61),
                ),
              ),
              alignment: Alignment(1.0, 1.0),
            ),
            Container(
              padding: EdgeInsets.all(12),
              child: Text(
                _expression,
                style: GoogleFonts.rubik(
                  textStyle: TextStyle(
                    fontSize: expressionSize,
                  ),
                  color: Colors.white,
                ),
              ),
              alignment: Alignment(1.0, 1.0),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalButton(
                  text: 'AC',
                  fillColor: Color(0xFF6C807F),
                  callback: allClear,
                ),
                CalButton(
                  text: 'C',
                  fillColor: Color(0xFF6C807F),
                  callback: clear,
                ),
                CalButton(
                  text: '%',
                  fillColor: Color(0xFFFFFFFF),
                  textColor: Color(0xFF000000),
                  textSize: operatorSize,
                  callback: numClick,
                ),
                CalButton(
                  text: '/',
                  fillColor: Color(0xFFFFFFFF),
                  textColor: Color(0xFF000000),
                  textSize: operatorSize,
                  callback: numClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalButton(
                  text: '7',
                  fillColor: Color(0xFF30475e),
                  callback: numClick,
                ),
                CalButton(
                  text: '8',
                  fillColor: Color(0xFF30475e),
                  callback: numClick,
                ),
                CalButton(
                  text: '9',
                  fillColor: Color(0xFF30475e),
                  callback: numClick,
                ),
                CalButton(
                  text: '*',
                  fillColor: Color(0xFFFFFFFF),
                  textColor: Color(0xFF000000),
                  textSize: operatorSize,
                  callback: numClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalButton(
                  text: '4',
                  fillColor: Color(0xFF30475e),
                  callback: numClick,
                ),
                CalButton(
                  text: '5',
                  fillColor: Color(0xFF30475e),
                  callback: numClick,
                ),
                CalButton(
                  text: '6',
                  fillColor: Color(0xFF30475e),
                  callback: numClick,
                ),
                CalButton(
                  text: '-',
                  fillColor: Color(0xFFFFFFFF),
                  textColor: Color(0xFF000000),
                  textSize: operatorSize,
                  callback: numClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalButton(
                  text: '1',
                  fillColor: Color(0xFF30475e),
                  callback: numClick,
                ),
                CalButton(
                  text: '2',
                  fillColor: Color(0xFF30475e),
                  callback: numClick,
                ),
                CalButton(
                  text: '3',
                  fillColor: Color(0xFF30475e),
                  callback: numClick,
                ),
                CalButton(
                  text: '+',
                  fillColor: Color(0xFFFFFFFF),
                  textColor: Color(0xFF000000),
                  textSize: operatorSize,
                  callback: numClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalButton(
                  text: '.',
                  fillColor: Color(0xFF30475e),
                  callback: numClick,
                ),
                CalButton(
                  text: '0',
                  fillColor: Color(0xFF30475e),
                  callback: numClick,
                ),
                CalButton(
                  text: '00',
                  fillColor: Color(0xFF30475e),
                  callback: numClick,
                ),
                CalButton(
                  text: '=',
                  fillColor: Color(0xFFFFFFFF),
                  textColor: Color(0xFF000000),
                  textSize: operatorSize,
                  callback: evaluate,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
