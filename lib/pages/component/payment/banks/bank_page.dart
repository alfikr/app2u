import 'package:flutter/material.dart';

class BankPage extends StatefulWidget {
  BankPage({Key key}) : super(key: key);

  @override
  _BankPageState createState() => _BankPageState();
}

class _BankPageState extends State<BankPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(8),
      child: Column(
        children: [
          Text("Pilih bank:"),
        ],
      ),
    );
  }
}
