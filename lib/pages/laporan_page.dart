import 'package:flutter/material.dart';

class LaporanPage extends StatefulWidget {
  LaporanPage({Key key}) : super(key: key);

  @override
  _LaporanPageState createState() => _LaporanPageState();
}

class _LaporanPageState extends State<LaporanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Laporan transaksi"),
      ),
    );
  }
}
