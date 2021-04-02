import 'dart:async';

import 'package:advertising/domain/loginvm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpPage extends StatefulWidget {
  final LoginVM loginVM;
  OtpPage({
    Key key,
    @required this.loginVM,
  }) : super(key: key);

  @override
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  bool _counterKirimUlang = false;
  int _proses = 0;
  GlobalKey<FormState> _otpForm = GlobalKey();
  TextEditingController _otpController = TextEditingController();
  int _selesai = DateTime.now().millisecondsSinceEpoch + 1000 * 10;

  void _showProgress() {
    Timer(Duration(seconds: 2), () {
      setState(() {
        _proses = 0;
      });
      Navigator.pushNamedAndRemoveUntil(context, "/home", (route) => false);
    });
    if (_proses == 1) {
      showDialog(
        context: context,
        child: Container(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    CountdownTimerController _countDown() {
      return CountdownTimerController(
        endTime: _selesai,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("OTP"),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text("Mohon tunggu otp yang kami kirimkan"),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Text("Kami telah mengirimkan OTP ke " +
                    widget.loginVM.nomorPonsel),
              ),
              SizedBox(
                height: 20,
              ),
              Form(
                key: _otpForm,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 20.0,
                    horizontal: 40.0,
                  ),
                  child: PinCodeTextField(
                    length: 6,
                    controller: _otpController,
                    appContext: context,
                    autoFocus: true,
                    pastedTextStyle: TextStyle(
                      color: Colors.green.shade600,
                      fontWeight: FontWeight.bold,
                    ),
                    onChanged: (value) {
                      print(value);
                    },
                    onCompleted: (value) {
                      setState(() {
                        _proses = 1;
                      });
                      _showProgress();
                    },
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(),
                  ),
                  Text("Tidak terima otp?"),
                  SizedBox(
                    width: 20,
                  ),
                  CountdownTimer(
                    controller: _countDown(),
                    endWidget: _getButtonResend(),
                    onEnd: () {
                      setState(() {
                        _counterKirimUlang = true;
                      });
                    },
                  ),
                  SizedBox(
                    width: 20,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getButtonResend() {
    return GestureDetector(
      onTap: () {
        if (_counterKirimUlang) {
          //TODO Resend
          print("resend");
        }
      },
      child: InkWell(
        splashColor: Colors.purpleAccent,
        child: Container(
          height: 40,
          width: 160,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: _counterKirimUlang ? Colors.grey : Colors.deepOrange,
          ),
          child: Center(
            child: Text(
              "Kirim ulang",
              style: TextStyle(
                color: _counterKirimUlang ? Colors.white54 : Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
