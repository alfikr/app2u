import 'dart:async';

import 'package:advertising/domain/loginvm.dart';
import 'package:advertising/pages/auth/otp_page.dart';
import 'package:advertising/utils/animation_helper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class LoginUser extends StatefulWidget {
  LoginUser({Key key}) : super(key: key);

  @override
  _LoginUserState createState() => _LoginUserState();
}

class _LoginUserState extends State<LoginUser> {
  TextEditingController _txtNomorTelp = TextEditingController();

  GlobalKey<FormState> _keyForm = GlobalKey();
  void _prosesData() {
    LoginVM vm = LoginVM();
    vm.nomorPonsel = _txtNomorTelp.text;
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (a, b, c) => OtpPage(
          loginVM: vm,
        ),
        transitionsBuilder: (a, b, c, d) =>
            AnimationHelper.getTransisi(a, b, c, d),
      ),
    );
  }

  Widget _getContent() {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(8),
      child: Column(
        children: [
          Expanded(
            child: SizedBox(),
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            clipBehavior: Clip.antiAlias,
            child: Container(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Form(
                key: _keyForm,
                child: Column(
                  children: [
                    TextFormField(
                      autofocus: true,
                      maxLength: 14,
                      keyboardType: TextInputType.number,
                      controller: _txtNomorTelp,
                      decoration: InputDecoration(
                        // contentPadding: EdgeInsets.fromLTRB(20, 2, 20, 2),
                        hintText: "Masukkan nomor telp anda",
                      ),
                      onFieldSubmitted: (value) {
                        if (_keyForm.currentState.validate()) {
                          if (value.substring(0, 1) == "0") {
                            //TODO ganti angka 0 didepan
                            value = value.replaceFirst(RegExp(r'0'), '62');
                          } else if (value.substring(0, 2) != "62") {
                            value = "62" + value;
                          }
                          setState(() {
                            _txtNomorTelp.text = value;
                            _txtNomorTelp.selection =
                                TextSelection.fromPosition(
                              TextPosition(
                                offset: _txtNomorTelp.text.length,
                              ),
                            );
                          });
                          _prosesData();
                        }
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Nomor hp tidak boleh kosong";
                        }
                        if (value.length < 8) {
                          return "Nomor hp sepertinya tidak valid, periksa kembali";
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 80,
          ),
        ],
      ),
    );
  }

  Widget _getBackground() {
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Stack(
            children: [
              _getBackground(),
              _getContent(),
            ],
          ),
        ),
      ),
    );
  }
}
