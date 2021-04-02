import 'package:advertising/pages/HomeScreen.dart';
import 'package:advertising/pages/Topup.dart';
import 'package:advertising/pages/Transaksi.dart';
import 'package:advertising/pages/auth/login_user.dart';
import 'package:advertising/pages/test/youtube_player.dart';
import 'package:advertising/utils/animation_helper.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

void main() async {
  // await Permission.camera.request();
  // await Permission.microphone.request();
  // WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  await Permission.camera.request();
  await Permission.microphone.request();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Advertising',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/home': (context) => HomeScreen(),
        '/login': (context) => LoginUser(),
        '/topup': (context) => TopupPage(),
        '/transfer': (context) => TransaksiPage(
              tipeTransaksi: TipeTransaksi.Transfer,
            ),
        '/tarik': (context) => TransaksiPage(
              tipeTransaksi: TipeTransaksi.Tarik,
            ),
        '/test': (context) => YoutubePlayer()
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/home') {
          return PageRouteBuilder(
            pageBuilder: (a, b, c) => HomeScreen(),
            transitionsBuilder: (a, b, c, d) =>
                AnimationHelper.getTransisi(a, b, c, d),
          );
        }
      },
      initialRoute: '/home',
    );
  }
}
