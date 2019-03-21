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

//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//
//    return  new MaterialApp(
//      title: '豆瓣250',
//      home: new Scaffold(
//        appBar: new AppBar(
//          title: new Text("豆瓣250"),
//        ),
//      ),
//    );
//  }

}

class _DouBanPage extends State<DouBan250> {
//  Movies list  ;
  List<Subject> list = [];
//  var listLength = [];
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
//    list = Movies.fromJson(jsonStr).subjects;

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

//      body: new ListView.builder(
//          itemCount: list.length, itemBuilder: _getListItem),
    );
  }

  Widget _getListItem(BuildContext context, int position) {
    if (list != null) {
      Subject subject = list[position];
      return GestureDetector(
//        onTap: () {
//          showMessage(list[position]);
//        },
        //只展示文字
//        child: Center(
//            child: new Container(
//                width: window.physicalSize.width,
//                decoration: BoxDecoration(
//                  color: Colors.white,
//                ),
//                margin: EdgeInsets.only(top: 2.0),
//                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
//                child: Center(child: new Text(subject.title)))),

//        child: new Container(
//          width: window.physicalSize.width,
//          decoration: BoxDecoration(
//            color: Colors.white,
//          ),
//
//          padding: const EdgeInsets.all(10.0),
//          child: new Image.network(subject.images.medium),
//          height: 100.0,
//        ),

        child: new Column(
          children: <Widget>[
            new Row(
              children: <Widget>[

                new Expanded(
                  child: new Container(
                    padding: const EdgeInsets.fromLTRB(3.0, 6.0, 3.0, 6.0),
                    child: new Image.network(
                      subject.images.medium,
                      fit: BoxFit.cover,
                    ),
                    height: 100.0,
                  ),
                  flex: 1,
                ),
                new Expanded(
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      new Padding(
                        padding: new EdgeInsets.fromLTRB(8.0, 6.0, 0.0, 3.0),
                        child: new Text(subject.title),
                      ),

                      new Padding(
                        padding: new EdgeInsets.fromLTRB(8.0, 6.0, 0.0, 3.0),
                        child: new Text(
                          subject.year,
                          style: new TextStyle(fontSize: 14.0),
                        ),
                      ),
//                      new Padding(
//                        padding: new EdgeInsets.fromLTRB(8.0, 6.0, 0.0, 3.0),
//                        child: botRow(listBean),
//                      ),
                    ],
                  ),
                  flex: 2,
                ),
//                new Expanded(
//                    child: new Column(
//                  crossAxisAlignment: CrossAxisAlignment.start,
//                  mainAxisSize: MainAxisSize.min,
//                  children: <Widget>[
//                    new Image.network(subject.images.medium),
//                  ],
//                )),
              ],
            )
          ],
        ),
      );
    }
  }
}
