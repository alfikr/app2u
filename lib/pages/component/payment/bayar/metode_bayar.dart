import 'package:flutter/material.dart';

class MetodeBayar extends StatefulWidget {
  MetodeBayar({Key key}) : super(key: key);

  @override
  _MetodeBayarState createState() => _MetodeBayarState();
}

class _MetodeBayarState extends State<MetodeBayar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Metode bayar"),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Text("Pilih metode bayar"),
              Expanded(
                  child: Container(
                child: ListView(
                  children: [
                    GestureDetector(
                      child: InkWell(
                        child: Card(
                          child: Container(
                            child: Text("Saldo"),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
