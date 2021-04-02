import 'package:flutter/material.dart';

class GantiTelp extends StatelessWidget {
  const GantiTelp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(8),
      child: Form(
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(hintText: "Nomor Telp Baru"),
            ),
            SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () {
                //TODO show pin
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
            )
          ],
        ),
      ),
    );
  }
}
