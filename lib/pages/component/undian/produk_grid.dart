import 'package:flutter/material.dart';

class ProdukGrid extends StatefulWidget {
  ProdukGrid({Key key}) : super(key: key);

  @override
  _ProdukGridState createState() => _ProdukGridState();
}

class _ProdukGridState extends State<ProdukGrid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pembelian undian"),
      ),
      body: SafeArea(
        child: Container(),
      ),
    );
  }
}
