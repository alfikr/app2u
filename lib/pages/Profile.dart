import 'package:advertising/domain/Users.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:advertising/pages/users/user_form.dart';
import 'package:advertising/utils/animation_helper.dart';

class Profile extends StatefulWidget {
  User user;
  Profile({Key key, @required this.user}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profil"),
      ),
      body: Container(
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl: widget.user.bannerUrl.isNotEmpty
                  ? widget.user.bannerUrl
                  : 'https://ffp4g1ylyit3jdyti1hqcvtb-wpengine.netdna-ssl.com/firefox/files/2020/05/Zoom-background-2.jpg',
              progressIndicatorBuilder: (context, url, progress) => Container(
                child: Center(
                  child: CircularProgressIndicator(
                    value: progress.progress,
                  ),
                ),
              ),
              imageBuilder: (context, provider) => Container(
                height: MediaQuery.of(context).size.height * .3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(80.0),
                  ),
                  image: DecorationImage(
                    image: provider,
                    fit: BoxFit.fill,
                  ),
                ),
                child: Center(
                  child: widget.user.imageUrl.isEmpty
                      ? CircleAvatar(
                          child: Icon(Icons.verified_user),
                        )
                      : CachedNetworkImage(
                          imageUrl: widget.user.imageUrl,
                          progressIndicatorBuilder: (context, url, progress) =>
                              Container(
                            child: Center(
                              child: CircularProgressIndicator(
                                value: progress.progress,
                              ),
                            ),
                          ),
                          imageBuilder: (context, provider) => CircleAvatar(
                            child: Image(image: provider),
                          ),
                        ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: ListView(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: 40,
                        left: 10,
                        right: 10,
                      ),
                      child: Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    transitionsBuilder: (context, animation,
                                            secondaryAnimation, child) =>
                                        AnimationHelper.getTransisi(
                                            context,
                                            animation,
                                            secondaryAnimation,
                                            child),
                                    pageBuilder: (context, animation,
                                            secondaryAnimation) =>
                                        UserForm(
                                      form: TipeForm.PIN,
                                      user: widget.user,
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                padding: EdgeInsets.all(8),
                                height: 40,
                                child: Row(
                                  children: [
                                    Text("Ganti Pin"),
                                    Expanded(
                                      child: SizedBox(),
                                    ),
                                    Icon(Icons.arrow_right),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: Container(
                                padding: EdgeInsets.all(8),
                                height: 5.0,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    transitionsBuilder: (context, animation,
                                            secondaryAnimation, child) =>
                                        AnimationHelper.getTransisi(
                                            context,
                                            animation,
                                            secondaryAnimation,
                                            child),
                                    pageBuilder: (context, animation,
                                            secondaryAnimation) =>
                                        UserForm(
                                      form: TipeForm.TELP,
                                      user: widget.user,
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                padding: EdgeInsets.all(8),
                                height: 40,
                                child: Row(
                                  children: [
                                    Text("Ganti nomor telp"),
                                    Expanded(
                                      child: SizedBox(),
                                    ),
                                    Icon(Icons.arrow_right),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: Container(
                                padding: EdgeInsets.all(8),
                                height: 5.0,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    transitionsBuilder: (context, animation,
                                            secondaryAnimation, child) =>
                                        AnimationHelper.getTransisi(
                                            context,
                                            animation,
                                            secondaryAnimation,
                                            child),
                                    pageBuilder: (context, animation,
                                            secondaryAnimation) =>
                                        UserForm(
                                      form: TipeForm.NAMA,
                                      user: widget.user,
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                padding: EdgeInsets.all(8),
                                height: 40,
                                child: Row(
                                  children: [
                                    Text("Ganti nama"),
                                    Expanded(
                                      child: SizedBox(),
                                    ),
                                    Icon(Icons.arrow_right),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: 20,
                        left: 10,
                        right: 10,
                      ),
                      child: Card(
                        child: Container(
                          child: Column(
                            children: [
                              GestureDetector(
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  child: Row(
                                    children: [
                                      Text("Reference Status"),
                                      Expanded(
                                        child: SizedBox(),
                                      ),
                                      Icon(Icons.arrow_right)
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  height: 5.0,
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
