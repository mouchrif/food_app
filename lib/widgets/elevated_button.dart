import 'package:flutter/material.dart';

class ElevatedBtn extends StatelessWidget {
  final String text;
  final MaterialStateProperty<Color> backgroundColor;
  final MaterialStateProperty<Color> shadowColor;
  final Function onPressed;
  ElevatedBtn({
    @required this.text,
    @required this.backgroundColor,
    @required this.shadowColor,
    @required this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(text),
      style: ButtonStyle(
        backgroundColor: backgroundColor,
        padding: MaterialStateProperty.all(EdgeInsets.symmetric(
          vertical: 14.0,
          horizontal: 85.0,
        )),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        )),
        textStyle: MaterialStateProperty.all(TextStyle(
          fontSize: 20.0,
        )),
        elevation: MaterialStateProperty.all(6.0),
        shadowColor: shadowColor, 
      ),
      onPressed: onPressed,
    );
  }
}
