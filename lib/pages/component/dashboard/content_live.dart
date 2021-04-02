import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class ContentLive extends StatefulWidget {
  YoutubePlayerController controller;
  ContentLive({
    Key key,
    this.controller,
  }) : super(key: key);

  @override
  _ContentLiveState createState() => _ContentLiveState();
}

class _ContentLiveState extends State<ContentLive> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var player = YoutubePlayerIFrame(
      aspectRatio: 3 / 4,
    );
    return Container(
      padding: EdgeInsets.all(8),
      child: player,
      // child: YoutubePlayerControllerProvider(
      //   controller: widget.controller,
      //   child: ListView(
      //     children: [
      //       player,
      //     ],
      //   ),
      // ),
    );
  }
}
