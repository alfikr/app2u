import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTheme {
  TextStyle getTitle() {
    return TextStyle(
      // fontFamily:
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
    );
  }

  Color getButtonColor() {
    return Colors.deepOrange;
  }

  Color getButtonHeaderColor() {
    return Color(0x70d6ff);
  }

  Color getBackground() {
    return Color(0x233d4d);
  }
}
