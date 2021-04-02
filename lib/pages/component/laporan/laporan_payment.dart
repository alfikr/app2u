import 'package:flutter/material.dart';
import 'package:advertising/service/laporan_service.dart';

class LaporanPayment extends StatefulWidget {
  LaporanPayment({Key key}) : super(key: key);

  @override
  _LaporanPaymentState createState() => _LaporanPaymentState();
}

class _LaporanPaymentState extends State<LaporanPayment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Laporan"),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(8),
          margin: EdgeInsets.all(8),
          child: FutureBuilder(
            future: LaporanService().getLaporan(DateTime.now(), DateTime.now()),
            builder: (BuildContext context, AsyncSnapshot snapshot) =>
                snapshot.hasData
                    ? Card()
                    : ListView.builder(
                        itemCount: 4,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            child: Container(),
                          );
                        },
                      ),
          ),
        ),
      ),
    );
  }
}
