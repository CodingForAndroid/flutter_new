import 'package:flutter/material.dart';

class DynamicNavPage extends StatefulWidget {

   var username ;
   var password;

  DynamicNavPage({Key key, this.username, this.password})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _DynamicNavPageState(username,password);
}

class _DynamicNavPageState extends State<DynamicNavPage> {
  var username ;
  var password;
  _DynamicNavPageState(this.username, this.password);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("动态路由"),
      ),
      body: new Center(
        child: new Column(
          children: <Widget>[
            new MaterialButton(
              onPressed: () {
                Navigator.pop(context, " 回传的数据 aaa");
              },
              child: new Text("点我返回"),
              color: Colors.lightGreen,
            ),
            new Text("上页传递过来的username   $username"),
            new Text("上页传递过来的password   $password"),
          ],
        ),
      ),
    );
  }
}
