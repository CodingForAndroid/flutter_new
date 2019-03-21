import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
//  get() async {
//    var httpClient = new HttpClient();
//    var uri = new Uri.http(
//        'example.com', '/path1/path2', {'param1': '42', 'param2': 'foo'});
//    var request = await httpClient.getUrl(uri);
//    var response = await request.close();
//    var responseBody = await response.transform(UTF8.decoder).join();
//  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Startup Name Generator',
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => new _MyHomePageState();

//  @override
//  State<StatefulWidget> createState() {
//    // TODO: implement createState
//    return null;
//  }
}

class _MyHomePageState extends State<MyHomePage> {
  var _ipAddress = '';
  _getIPAddress() async {
    var url = 'https://httpbin.org/ip';
    var httpClient = new HttpClient();
    String result;

    try {
      var request = await httpClient.getUrl(Uri.parse(url));
      var response = await request.close();
      if (response.statusCode == HttpStatus.ok) {
        var jsonDecode = await response.transform(utf8.decoder).join();
        //TODO: dart:convert 升级 将原来大写的变成了小写 JSON.decode => json.decode(')
        var data = json.decode(jsonDecode);
        result = data['origin'];
        print('result = ' + result);
      } else {
        result =
            'Error getting IP address:\nHttp status ${response.statusCode}';
      }
    } catch (exception) {
      result = 'Failed getting IP address';
    }

    setState(() {
      _ipAddress = result;
    });
  }
  _postIPAddress() async{
    var url = 'http://cache.video.iqiyi.com/jp/avlist/202861101/1/';
    var httpClient = new HttpClient();
    String result;

    try {
      var request = await  httpClient.postUrl(Uri.parse(url));
      var response = await request.close();
      if (response.statusCode == HttpStatus.ok) {
        var jsonDecode = await response.transform(utf8.decoder).join();
        //TODO: dart:convert 升级 将原来大写的变成了小写 JSON.decode => json.decode(')
        var data = json.decode(jsonDecode);
        result = data['origin'];
        print('result = ' + result);
      } else {
        result =
        'Error getting IP address:\nHttp status ${response.statusCode}';
      }
    } catch (exception) {
      result = 'Failed getting IP address';
    }

    setState(() {
      _ipAddress = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    var spacer = new SizedBox(height: 32.0);
    return new Scaffold(
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text('Your current IP address is:'),
            new Text('$_ipAddress.'),
            spacer,
            new RaisedButton(
              onPressed: _postIPAddress,
              child: new Text('Get IP address'),
            ),
          ],
        ),
      ),
    );
  }
}
