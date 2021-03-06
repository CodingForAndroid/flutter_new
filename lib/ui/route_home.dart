import 'package:flutter/material.dart';
import 'static_navigator_page.dart';
import 'dynamic_navigator_page.dart';
import 'package:annotation_route/route.dart';
import 'package:flutter_new/route/router.dart';
///静态路由
///
@ARoute(url: 'myapp://pagea')
class RouteHome extends StatefulWidget {

  RouteHome(MyRouteOption  option) : super();
  @override
  _RouteHomeState createState() => _RouteHomeState();
}

///StatefulWidget
class _RouteHomeState extends State<RouteHome> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('静态路由'),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => StaticNavPage()));
              },
            ),
            RaisedButton(
              child: Text('动态路由传参'),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DynamicNavPage(
                            username: 'zhangsan',
                            password: '121'
                            ))).then((onValue) {//then  接收回传的数据
                  showDialog(
                      context: context,
                      child: new AlertDialog(
                        content: new Text(onValue),
                      ));
                });
              },
            ),
            RaisedButton(
              child: Text('静态路由接收上一页面返回值'),
              onPressed: () {
                Navigator.of(context).pushNamed('/a').then((onValue)=>
                    showDialog(
                    context: context,
                    child: new AlertDialog(
                      content: new Text(onValue),
                    ))
                );
              },
            ),
            RaisedButton(
              child: Text('返回'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
