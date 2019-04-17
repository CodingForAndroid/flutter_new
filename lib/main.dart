import 'package:flutter/material.dart';

import 'ui/top250.dart';
import 'ui/list.dart';
import 'ui/integral.dart';
import 'ui/tabbar.dart';
import 'ui/route_home.dart';
import 'component/platform_channel.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('跳到ListView'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return RandomWords();
                }));
              },
            ),
            RaisedButton(
              child: Text('跳到豆瓣Top250'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DouBan250();
                }));
              },
            ),
            RaisedButton(
              child: Text('积分明细'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return IntegralDetails();
                }));
              },
            ),
            RaisedButton(
              child: Text('测试TabBar'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return TabBarDemo();
                }));
              },
            ),
            RaisedButton(
              child: Text('PlatformChannel'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return PlatformChannel();
                }));
              },
            ),
            RaisedButton(
              child: Text('Route'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => RouteHome()
               ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
