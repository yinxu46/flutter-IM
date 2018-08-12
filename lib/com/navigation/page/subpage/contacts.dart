import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/com/navigation/component/contacts_list_item.dart';
import 'package:flutter_app/com/navigation/netwok/socket_handler.dart' as handler;

///
/// 联系人界面
///
///
class Contacts extends StatefulWidget {
  @override
  ContactsState createState() => ContactsState();
}

class ContactsState extends State<Contacts> {
  @override
  Widget build(BuildContext context) {
    return Tab(
        child: RefreshIndicator(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(3.0),
            decoration: BoxDecoration(color: Colors.grey),
            child: TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search), hintText: "搜索"),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) =>
                  ContactItem(handler.contactsList[index]),
              itemCount: handler.contactsList.length,
            ),
          ),
        ],
      ),
      onRefresh: () => TickerFuture.complete(),
    ));
  }
}