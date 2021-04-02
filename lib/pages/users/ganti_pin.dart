import 'package:flutter/material.dart';

class GantiPin extends StatelessWidget {
  final VoidCallback callback;
  final TextEditingController pinLama;
  final TextEditingController pinBaru;
  final TextEditingController rePin;

  const GantiPin(
      {Key key, this.callback, this.pinBaru, this.pinLama, this.rePin})
      : super(key: key);
  String valid() {
    if (pinLama.text.isEmpty) {
      return "Pin lama tidak boleh kosong";
    } else if (pinBaru.text.isEmpty) {
      return "Pin baru tidak boleh kosong";
    } else if (pinBaru.text != rePin.text) {
      return "Pin baru tidak sesuai";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(8),
      child: Form(
        child: Column(
          children: [
            TextFormField(
              controller: pinLama,
              obscureText: true,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Pin lama",
              ),
            ),
            TextFormField(
              controller: pinBaru,
              keyboardType: TextInputType.number,
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Pin baru",
              ),
            ),
            TextFormField(
              controller: rePin,
              keyboardType: TextInputType.number,
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Ulang pin baru",
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                callback();
              },
              child: InkWell(
                splashColor: Colors.amber,
                child: Container(
                  height: 40.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.greenAccent,
                  ),
                  child: Center(
                    child: Text("Simpan"),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
