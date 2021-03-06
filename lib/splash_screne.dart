import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/com/navigation/page/login.dart';
import 'package:flutter_app/com/navigation/utils/file_handler.dart'
    as fileHandler;
import 'package:flutter_app/com/navigation/utils/utils.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  final int seconds;
  final Text title;
  final Color backgroundColor;
  final TextStyle styleTextUnderTheLoader;
  final double photoSize;
  final dynamic onClick;
  final Color loaderColor;
  final Image image;
  SplashScreen(
      {this.loaderColor,
      @required this.seconds,
      this.photoSize,
      this.onClick,
      this.title = const Text('畅聊'),
      this.backgroundColor = Colors.white,
      this.styleTextUnderTheLoader = const TextStyle(
          fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black),
      this.image});
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.backgroundColor,
      body: new InkWell(
        onTap: widget.onClick,
        child: new Stack(
          fit: StackFit.expand,
          children: <Widget>[
            new Container(
              decoration: BoxDecoration(color: widget.backgroundColor),
            ),
            new Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new Expanded(
                  flex: 2,
                  child: new Container(
                      child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new CircleAvatar(
                        backgroundColor: Colors.transparent,
                        child: new Container(child: widget.image),
                        radius: widget.photoSize,
                      ),
                      new Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                      ),
                      widget.title
                    ],
                  )),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  ///
  /// 程序初始化
  ///
  ///
  void _loadData() async {
    try {
      await fileHandler.initFileState();
      await fileHandler.initDataBases();
      await fileHandler.obtainUsers();
      await fileHandler.readConfig();
      await fileHandler.loadImageFile();
      Navigator
          .of(context)
          .push(MaterialPageRoute(builder: (BuildContext context) => Login()));
    } catch (e) {
      showToast("程序出错了,正在退出.....");
      Timer(Duration(seconds: 2), () {
        SystemNavigator.pop();
      });
    }
  }
}
