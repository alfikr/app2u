import 'package:flutter/material.dart';

class GantiNama extends StatelessWidget {
  final VoidCallback callback;
  final TextEditingController txtFirstName;
  final TextEditingController txtLastName;
  const GantiNama({
    Key key,
    @required this.callback,
    this.txtFirstName,
    this.txtLastName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(8),
      child: Form(
          child: Column(
        children: [
          TextFormField(
            controller: txtFirstName,
            decoration: InputDecoration(
              hintText: "First name",
            ),
          ),
          TextFormField(
            controller: txtLastName,
            decoration: InputDecoration(
              hintText: "Last name",
            ),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            child: Container(
              height: 40.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.green,
              ),
              child: Center(
                child: Text("Submit"),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
