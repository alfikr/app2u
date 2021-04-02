import 'package:advertising/domain/produkVM.dart';
import 'package:advertising/pages/component/payment/banks/bank_page.dart';
import 'package:flutter/material.dart';

class TransaksiPage extends StatefulWidget {
  final TipeTransaksi tipeTransaksi;
  final ProdukVM produkVM;
  TransaksiPage({
    Key key,
    @required this.tipeTransaksi,
    this.produkVM,
  }) : super(key: key);

  @override
  _TransaksiPageState createState() => _TransaksiPageState();
}

enum TipeTransaksi { Transfer, Tarik, Prepaid, Postpaid }

class _TransaksiPageState extends State<TransaksiPage> {
  String _getTitle() {
    switch (widget.tipeTransaksi) {
      case TipeTransaksi.Postpaid:
        return "Pasca bayar";
      case TipeTransaksi.Prepaid:
        return "Prabayar";
      case TipeTransaksi.Tarik:
        return "Tarik saldo";
      default:
        return "Transfer tunai";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_getTitle()),
      ),
      body: SafeArea(
        child: BankPage(),
      ),
    );
  }
}
