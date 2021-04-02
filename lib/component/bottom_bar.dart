import 'package:flutter/material.dart';

class MyBottomBar extends StatefulWidget {
  var onChangePage;
  int activePage;
  MyBottomBar(this.onChangePage, this.activePage);

  @override
  _MyBottomBarState createState() => _MyBottomBarState();
}

class _MyBottomBarState extends State<MyBottomBar> {
  Widget navIcon(String name, IconData ic, int page) {
    var active = widget.activePage == page;
    return InkWell(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              ic,
              color: active ? Colors.deepOrange : Colors.grey,
            ),
            Text(
              name,
              style: TextStyle(
                color: active ? Colors.deepOrange : Colors.grey,
                fontSize: 7.0,
              ),
            )
          ],
        ),
      ),
      onTap: () {
        widget.onChangePage(page);
      },
    );
  }

  Widget mainIcon(String name, IconData ic, int page) {
    var active = widget.activePage == page;
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            ic,
            size: 40,
            color: active ? Colors.deepOrange : Colors.grey,
          ),
          Text(
            name,
            style: TextStyle(
              color: active ? Colors.blue : Colors.grey,
              fontSize: 7.0,
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          navIcon("Dashboard", Icons.home, 0),
          navIcon("Kupon", Icons.bookmark_outline_rounded, 1),
          navIcon("Pembayaran", Icons.qr_code_outlined, 2),
          navIcon("Laporan", Icons.receipt, 3),
          navIcon("Profil", Icons.account_box, 4),
        ],
      ),
    );
  }
}
