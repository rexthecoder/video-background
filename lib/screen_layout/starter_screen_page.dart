import 'dart:async';

import 'package:africanflutterrdeveloper/screen_const/animation.dart';
import 'package:africanflutterrdeveloper/screen_const/const_assets.dart';
import 'package:africanflutterrdeveloper/screen_const/const_date_time.dart';
import 'package:africanflutterrdeveloper/screen_const/const_horizontal.dart';
import 'package:africanflutterrdeveloper/screen_const/const_video_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:video_player/video_player.dart';

class StarterScreenPage extends StatefulWidget {
  static const String starterScreen = '/';

  @override
  _StarterScreenPageState createState() => _StarterScreenPageState();
}

class _StarterScreenPageState extends State<StarterScreenPage>
    with TickerProviderStateMixin {
//! setting up video controller
  VideoPlayerController _videoController;
  String _timeString;

  AnimationController animation;
  Animation<double> _fadeInFadeOut;

  @override
  void initState() {
    super.initState();
    // loading up our video player assets
    _videoController = VideoPlayerController.asset(Video.videoPath)
      ..initialize().then((_) {
        _videoController.play();
        _videoController.setLooping(true);
        setState(() {});
      });
    animation = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    _fadeInFadeOut = Tween<double>(begin: 0.0, end: 0.5).animate(animation);

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animation.reverse();
      } else if (status == AnimationStatus.dismissed) {
        animation.forward();
      }
    });
    animation.forward();
    _timeString = formatDateTime(DateTime.now());
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          videoScreen(_videoController),
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomLeft,
                    colors: [Colors.black.withAlpha(1), Colors.black],
                    stops: [0.3, 1])),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 390, bottom: 40),
                  child: VerticalDivider(
                    color: Colors.white,
                    thickness: 3,
                    width: 40,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 45),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child: Text(
                              GreetUser.greeting(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w100),
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                  child: Text(
                                      "${StarterTimer.todayDate.toUpperCase()}",
                                      style: TextStyle(
                                          color: Colors.orangeAccent,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700))),
                              Container(
                                child: Text(
                                  "  &",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w100),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            child: Text.rich(TextSpan(
                                text: "${StarterTimer.month.toUpperCase()}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w100),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: ' ' + StarterTimer.day,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700)),
                                  TextSpan(
                                    text: " at",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w100),
                                  ),
                                  TextSpan(
                                      text: ' ' + _timeString,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700)),
                                ])),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            child: Text(
                              "Allow bountied questions to be closed by  \n to be closed by regular users closed by   ",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w100),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                            width: 80,
                            height: 30,
                            margin: EdgeInsets.only(bottom: 10),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.orangeAccent,
                                gradient: LinearGradient(
                                  colors: [Colors.black, Colors.orangeAccent],
                                )),
                            child: Text("More",
                                style: TextStyle(color: Colors.white))),
                        SizedBox(
                          width: 60,
                        ),
                        Row(
                          children: <Widget>[
                            FaIcon(
                              FontAwesomeIcons.facebookF,
                              color: Colors.white,
                              size: 15,
                            ),
                            SizedBox(
                              width: 9,
                            ),
                            FaIcon(FontAwesomeIcons.googlePlusG,
                                color: Colors.white, size: 15),
                            SizedBox(
                              width: 9,
                            ),
                            FaIcon(FontAwesomeIcons.twitter,
                                color: Colors.white, size: 15)
                          ],
                        )
                      ],
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 40.0, left: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          FadeTransition(
                            opacity: _fadeInFadeOut,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: Colors.transparent,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.orange,
                                        blurRadius: 2,
                                        spreadRadius: 5)
                                  ]),
                              width: 40,
                              height: 40,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.orangeAccent,
                            ),
                            width: 40,
                            height: 40,
                            child: Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      horizontalColumn(),
                      SizedBox(
                        height: 5,
                      ),
                      horizontalColumn(),
                      SizedBox(
                        height: 5,
                      ),
                      horizontalColumn(),
                      SizedBox(
                        height: 5,
                      ),
                      horizontalColumn()
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formatDateTimeNow = formatDateTime(now);
    setState(() {
      _timeString = formatDateTimeNow;
    });
  }
}
