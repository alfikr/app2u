import 'package:flutter/material.dart';

class PerjanjianPeserta extends StatefulWidget {
  PerjanjianPeserta({Key key}) : super(key: key);

  @override
  _PerjanjianPesertaState createState() => _PerjanjianPesertaState();
}

class _PerjanjianPesertaState extends State<PerjanjianPeserta> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: SingleChildScrollView(
          child: Text("long text"),
        ),
      ),
    );
  }
}
