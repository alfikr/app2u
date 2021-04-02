import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class TugasContent extends StatefulWidget {
  YoutubePlayerController controller;
  TugasContent({
    Key key,
    this.controller,
  }) : super(key: key);

  @override
  _TugasContentState createState() => _TugasContentState();
}

class _TugasContentState extends State<TugasContent> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _controller = YoutubePlayerController(
    //   initialVideoId: YoutubePlayerController.convertUrlToId(
    //       "https://www.youtube.com/watch?v=i-8vGYVoRUo"),
    //   params: YoutubePlayerParams(
    //     autoPlay: true,
    //     showControls: true,
    //     showFullscreenButton: true,
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    var player = YoutubePlayerIFrame(
      aspectRatio: 3 / 4,
    );
    return YoutubePlayerControllerProvider(
      controller: widget.controller,
      child: Container(
        padding: EdgeInsets.all(8.0),
        child: ListView(
          children: [
            player,
          ],
        ),
      ),
    );
  }
}
