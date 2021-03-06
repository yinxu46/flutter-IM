import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/com/navigation/utils/constant.dart' as constants;
import 'package:flutter_app/com/navigation/utils/application.dart'
    as application;

///
///
/// @_message代表一条消息判其是否以{[|@#\$%|]}结尾来区分发送者身份
///

class ChartMessageItem extends StatefulWidget {
  final String _message;

  ChartMessageItem(this._message);

  @override
  ChartMessageItemState createState() => ChartMessageItemState();
}

class ChartMessageItemState extends State<ChartMessageItem> {
  ChartMessageItemState();

  @override
  Widget build(BuildContext context) {
    return widget._message.endsWith(constants.messageOwn)
        ? _ownSend()
        : _friendSend();
  }

  Widget _friendSend() {
    return Row(
      children: <Widget>[
        CircleAvatar(
          backgroundColor: Colors.grey,
          child: application.images["sender"],
        ),
        Container(
          foregroundDecoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.lightBlue),
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
          ),
          margin: EdgeInsets.only(top: 15.0),
          alignment: Alignment.center,
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Color.fromRGBO(250, 250, 210, 1.0),
            borderRadius: BorderRadius.all(
              Radius.circular(20.00),
            ),
          ),
          width:
              (ui.window.physicalSize.width / ui.window.devicePixelRatio) * 0.7,
          child: Text(
            widget._message,
            style: TextStyle(fontSize: 20.0),
          ),
        ),
      ],
    );
  }

  Widget _ownSend() {
    final message = widget._message.split(constants.messageOwn)[0];
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Container(
          foregroundDecoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.lightBlue),
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
          ),
          margin: EdgeInsets.only(top: 15.0),
          alignment: Alignment.center,
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Color.fromRGBO(250, 250, 210, 1.0),
            borderRadius: BorderRadius.all(
              Radius.circular(20.00),
            ),
          ),
          width:
              (ui.window.physicalSize.width / ui.window.devicePixelRatio) * 0.7,
          child: Text(
            message,
            style: TextStyle(fontSize: 20.0),
          ),
        ),
        CircleAvatar(
          backgroundColor: Colors.grey,
          child: application.images["receiver"],
        ),
      ],
    );
  }
}
