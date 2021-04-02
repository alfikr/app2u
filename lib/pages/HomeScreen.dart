import 'package:advertising/component/circular_progress.dart';
import 'package:advertising/domain/Users.dart';
import 'package:advertising/pages/component/dashboard/content_live.dart';
import 'package:advertising/pages/component/dashboard/content_tugas.dart';
import 'package:advertising/pages/component/laporan/laporan_payment.dart';
import 'package:advertising/pages/component/payment/payment_page.dart';
import 'package:advertising/pages/component/profile/profile_page.dart';
import 'package:advertising/pages/component/undian/produk_grid.dart';
import 'package:advertising/component/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentState = 0;
  int _tabContent = 0;
  double _isiRp = 0.0;
  YoutubePlayerController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: '4A3A80ZRjak',
      params: const YoutubePlayerParams(
        // playlist: [
        //   'nPt8bK2gbaU',
        //   'K18cpp_-gP8',
        //   'iLnmTe5Q2Qw',
        //   '_WoCV4c6XOE',
        //   'KmzdUe0RSJo',
        //   '6jZDSSZZxjQ',
        //   'p2lYr3vM_1w',
        //   '7QUtEmBT_-w',
        //   '34_PXCzGw1M',
        // ],
        // startAt: const Duration(minutes: 1, seconds: 36),
        // showControls: true,
        // showFullscreenButton: true,
        desktopMode: true,
        // privacyEnhanced: true,
      ),
    );
    requestPer();
  }

  requestPer() async {
    await Permission.camera.request();
    await Permission.microphone.request();
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  Widget _getContent() {
    switch (_currentState) {
      case 1:
        return ProdukGrid();
      case 2:
        return PaymentPage();
      case 3:
        return LaporanPayment();
      case 4:
        return ProfilePage(
          user: User.instance(
              "082133693119",
              "Danang Puspito",
              "Jati",
              "jfjlksdajflkasjfl",
              "https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png",
              ""),
        );
      default:
        var player = YoutubePlayerIFrame(
          aspectRatio: 3 / 4,
        );
        return Stack(
          children: [
            //TODO video
            Container(
              color: Colors.black,
              child: Center(
                child: GestureDetector(
                  onPanUpdate: (details) {
                    if (details.delta.dy > 0) {
                      print('swipe');
                    }
                  },
                  child: player,
                ),
                // child: _tabContent == 1
                //     ? ContentLive(this._controller)
                //     : TugasContent(this._controller),
              ),
            ),
            //TODO screen
            Container(
              color: Colors.white12,
            ),
            //TODO tab atas
            Positioned(
              left: MediaQuery.of(context).size.width / 3,
              right: MediaQuery.of(context).size.width / 3,
              child: Container(
                alignment: Alignment.center,
                height: 40.0,
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.all(8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _tabContent = 1;
                        });
                      },
                      child: InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: _tabContent == 1
                                ? Colors.white60
                                : Colors.white10,
                          ),
                          child: Text(
                            "Live",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(child: SizedBox()),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _tabContent = 0;
                        });
                      },
                      child: InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: _tabContent == 0
                                ? Colors.white60
                                : Colors.white10,
                          ),
                          child: Text(
                            "Tugas",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            //TODO progress income
            Positioned(
              top: MediaQuery.of(context).size.height * .2,
              left: 20.0,
              child: YoutubeValueBuilder(
                builder: (context, value) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.white,
                  ),
                  child: CircularPercentIndicator(
                    radius: 40.0,
                    progressColor: Colors.deepOrange,
                    center: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        "Rp.\n400",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ),
                    percent: _isiRp,
                  ),
                ),
              ),
            ),
            //TODO tombol share
            Positioned(
              right: 20.0,
              bottom: MediaQuery.of(context).size.height / 2 - 200,
              child: Container(
                child: GestureDetector(
                  child: InkWell(
                    child: CircleAvatar(
                      child: Icon(
                        Icons.share_rounded,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerControllerProvider(
      controller: _controller,
      child: Scaffold(
        body: SafeArea(
          child: _getContent(),
        ),
        bottomNavigationBar: MyBottomBar((page) {
          setState(() {
            this._currentState = page;
          });
        }, this._currentState),
      ),
    );
  }
}
