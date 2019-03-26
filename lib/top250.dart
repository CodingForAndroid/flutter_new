import 'package:flutter/material.dart';
import 'http.dart'; // make dio as global top-level variable
//import 'bean/movies.dart';
import 'bean/movies_new.dart';
import 'dart:convert' show json;
import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'dart:ui';

class DouBan250 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DouBanPage();
}

class _DouBanPage extends State<DouBan250> {
  List<Subject> list = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getListData();
  }

  //async 与 await 不可分割
  _getListData() async {
    const url = 'https://api.douban.com/v2/movie/top250';
    var response = await NetUtil.get(url);
    Map<String, dynamic> jsonStr = response;
    list = MoviesNew.fromJson(jsonStr).subjects;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("豆瓣250"),
      ),
      body: Center(
        child: list.isEmpty
            ? CircularProgressIndicator()
            : new ListView.builder(
                itemCount: list.length, itemBuilder: _getListItem),
      ),
    );
  }

  Widget _getListItem(BuildContext context, int position) {
    if (list != null) {
      Subject subject = list[position];
      return new Container(
        decoration: new BoxDecoration(
          color: Colors.red,
        ),
        child: new Row(
          children: <Widget>[
            new Expanded(
              child: new Container(
                child: new Image.network(
                  subject.images.small,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            new Column(
//              MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
//              MainAxisSize mainAxisSize = MainAxisSize.max,
//              CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
//              TextDirection textDirection,

              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(subject.title),
                new Text(
                  subject.year,
                  style: new TextStyle(fontSize: 14.0),
                ),
              ],
            ),
          ],
        ),
      );
//      return GestureDetector(
//        child: new Column(
//          children: <Widget>[
//            new Row(
//              children: <Widget>[
//                new Expanded(
//                  child: new Container(
//                    padding: const EdgeInsets.fromLTRB(3.0, 6.0, 3.0, 6.0),
//                    child: new Image.network(
//                      subject.images.medium,
//                      fit: BoxFit.cover,
//                    ),
//                    height: 100.0,
//                  ),
//                  flex: 1,
//                ),
//                new Expanded(
//                  child: new Column(
//                    mainAxisSize: MainAxisSize.max,
//                    crossAxisAlignment: CrossAxisAlignment.start,
//                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                    children: <Widget>[
//                      new Padding(
//                        padding: new EdgeInsets.fromLTRB(8.0, 6.0, 0.0, 3.0),
//                        child: new Text(subject.title),
//                      ),
//                      new Padding(
//                        padding: new EdgeInsets.fromLTRB(8.0, 6.0, 0.0, 3.0),
//                        child: new Text(
//                          subject.year,
//                          style: new TextStyle(fontSize: 14.0),
//                        ),
//                      ),
//                    ],
//                  ),
//                  flex: 2,
//                ),
//              ],
//            )
//          ],
//        ),
//      );
    }
  }
}
