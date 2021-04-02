import 'package:advertising/pages/users/ganti_nama.dart';
import 'package:flutter/material.dart';
import 'package:advertising/domain/Users.dart';
import 'package:advertising/pages/users/ganti_pin.dart';
import 'package:advertising/pages/users/ganti_telp.dart';

class UserForm extends StatefulWidget {
  final TipeForm form;
  final User user;
  UserForm({
    Key key,
    @required this.form,
    @required this.user,
  }) : super(key: key);

  @override
  _UserFormState createState() => _UserFormState();
}

enum TipeForm { PIN, TELP, NAMA }

class _UserFormState extends State<UserForm> {
  Widget _getBody() {
    switch (widget.form) {
      case TipeForm.PIN:
        TextEditingController pinL = TextEditingController();
        TextEditingController pinB = TextEditingController();
        TextEditingController pinC = TextEditingController();
        return GantiPin(
          pinBaru: pinB,
          pinLama: pinL,
          rePin: pinC,
          callback: () {},
        );
      case TipeForm.NAMA:
        TextEditingController txtFirst = TextEditingController();
        TextEditingController txtLast = TextEditingController();
        return GantiNama(
          callback: () {},
          txtLastName: txtLast,
          txtFirstName: txtFirst,
        );
        break;
      default:
        return GantiTelp();
    }
  }

  @override
  Widget build(BuildContext context) {
    return _getBody();
  }
}
