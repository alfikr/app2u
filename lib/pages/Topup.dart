import 'package:advertising/domain/metodeTopup.dart';
import 'package:advertising/service/topup_service.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:skeleton_text/skeleton_text.dart';

class TopupPage extends StatefulWidget {
  TopupPage({Key key}) : super(key: key);

  @override
  _TopupPageState createState() => _TopupPageState();
}

class _TopupPageState extends State<TopupPage> {
  Widget _getItem(MetodeTopup tp) {
    return GestureDetector(
      onTap: () {
        print(tp.logo);
      },
      child: InkWell(
        child: Container(
          child: Row(
            children: [
              tp.logo.isNotEmpty
                  ? CachedNetworkImage(
                      imageUrl: tp.logo,
                      imageBuilder: (context, provider) => Container(
                        width: 100,
                        height: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            image: DecorationImage(
                              image: provider,
                            )),
                      ),
                    )
                  : Icon(Icons.ten_k),
              SizedBox(
                width: 5.0,
              ),
              Column(
                children: [
                  Text(tp.nama),
                  Text(tp.rekening),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Top up"),
      ),
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Pilih metode topup :"),
            SizedBox(
              height: 8,
            ),
            Expanded(
              child: Container(
                child: FutureBuilder(
                  future: TopupService().getMetodeTopup(),
                  builder: (context, data) => data.hasData
                      ? data.data.length > 0
                          ? ListView.separated(
                              itemBuilder: (context, index) => Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    child: _getItem(data.data[index]),
                                  ),
                              separatorBuilder: (context, index) => Divider(),
                              itemCount: data.data.length)
                          : Container(
                              child: Center(
                                child: Text("data tidak tersedia"),
                              ),
                            )
                      : ListView.separated(
                          itemBuilder: (context, index) => Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Row(
                                    children: [
                                      SkeletonAnimation(
                                        child: Container(
                                          width: 100,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            color: Colors.grey[300],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Expanded(
                                        child: Container(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: List.generate(
                                              3,
                                              (index) => Padding(
                                                padding:
                                                    EdgeInsets.only(left: 15.0),
                                                child: SkeletonAnimation(
                                                  shimmerColor: Colors.white70,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: Colors.grey[300],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                        20.0,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                          separatorBuilder: (context, index) {
                            return Divider();
                          },
                          itemCount: 4),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
