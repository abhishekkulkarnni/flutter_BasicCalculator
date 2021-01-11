import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalButton extends StatelessWidget {
  CalButton(
      {this.text,
      this.textColor = Colors.white,
      this.fillColor,
      this.textSize = 28.0,
      this.callback});

  final String text;
  final Color textColor, fillColor;
  final double textSize;
  final Function callback;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: SizedBox(
        width: 65.0,
        height: 65.0,
        child: FlatButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          child: Text(
            text,
            style: TextStyle(
              fontFamily: 'RubikRegular',
              fontSize: textSize,
              fontWeight: FontWeight.normal,
            ),
          ),
          onPressed: () {
            callback(text);
          },
          color: fillColor != null ? fillColor : null,
          textColor: textColor,
        ),
      ),
    );
  }
}
