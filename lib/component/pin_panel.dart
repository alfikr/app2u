import 'package:flutter/material.dart';
import 'package:slide_popup_dialog/slide_dialog.dart';

class PinPanel extends StatelessWidget {
  const PinPanel({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlideDialog(
      child: Container(),
      pillColor: Colors.grey,
      backgroundColor: Color(0xFFF9FF99),
    );
  }
}
