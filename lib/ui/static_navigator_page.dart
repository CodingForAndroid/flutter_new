import 'package:flutter/material.dart';

///静态路由
class StaticNavPage extends StatefulWidget {
  @override
  _StaticNavPageState createState() => _StaticNavPageState();
}
///StatefulWidget
class _StaticNavPageState extends State<StaticNavPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("静态路由页"),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: new Text("返回"),
      ),
      body: new Center(
        child: Text("静态路由可以传入一个routes参数来定义路由。但是这里定义的路由是静态的，"
            "它不可以向下一个页面传递参数，利用push到一个新页面,pushNamed方法是有一个Future的返回值的"
            "，所以静态路由也是可以接收下一个页面的返回值的。但是不能向下一个页面传递参数"),
      ),
    );

  }

}
