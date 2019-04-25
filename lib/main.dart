import 'package:annotation_route/route.dart';
import 'package:flutter/material.dart';

import 'widget/tabbar/demo.dart';
import 'ui/top250.dart';
import 'ui/list.dart';
import 'ui/integral.dart';
import 'ui/tabbar.dart';
import 'ui/route_home.dart';
import 'ui/static_navigator_page.dart';
import 'component/platform_channel.dart';
import 'route/router.dart';
import 'dart:ui' as ui;
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: <String, WidgetBuilder>{
        '/a': (BuildContext context) => StaticNavPage(title: 'page A'),
        '/b': (BuildContext context) => StaticNavPage(title: 'page B'),
        '/c': (BuildContext context) => StaticNavPage(title: 'page C'),
    },
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

//  MyHomePage({Key key, this.title}) : super(key: key);

  MyHomePage({Key key, this.title}){
  print(  ui.window.defaultRouteName);
  }
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var router = new Router();

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
              child: Text('测试TabBar1'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return TabDemo();
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
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){

                var option = new MyRouteOption(urlpattern: 'myapp://pagea');
                option.urlpattern = 'myapp://pagea';
                option.params = Map<String, dynamic> ();
                print(option.urlpattern) ;
                ARouterResult routerResult = router.getPage(option);
                print(routerResult.widget ==null);
                return routerResult.widget;
              }));
              },
            ),
          ],
        ),
      ),
    );
  }
}
