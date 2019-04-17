import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'dart:convert';

//import 'package:flutter_new/integral.dart';
import '../bean/integral.dart';
/**
 * 1.继承StatefulWidget 复写 createState() 方法
 * 2. 继承State<> ,复写  Widget build(BuildContext context) 方法
 */

///积分明细
class IntegralDetails extends StatefulWidget {
  final String title;

  IntegralDetails({Key key, this.title}) : super(key: key);

  @override
  createState() => _IntegralDetail();
}

final List<Tab> myTabs = <Tab>[
  new Tab(text: '全部'),
  new Tab(text: '获得'),
  new Tab(text: '消耗'),
];

class _IntegralDetail extends State<IntegralDetails>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        title: new Text("积分明细"),
      ),
      body: Column(
        children: <Widget>[
          _createHeader(),
//          _createList(),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                TabBar(
                  unselectedLabelColor: Colors.black,
                  labelColor: Colors.green,
                  indicatorColor: Colors.green,
                  //指示器颜色 如果和标题栏颜色一样会白色
                  tabs: myTabs,
                  //绑定数据
                  isScrollable: true,
                  //是否可以滑动
                  controller: _tabController,
                ),
              ],
            ),

          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: myTabs.map((item) {
                return Container(
                  child: _buildSuggestions(),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  final _suggestions = <WordPair>[];

  Widget _buildSuggestions() {
    return new ListView.builder(
      itemBuilder: (context, i) {
        if (i.isOdd) return new Divider();

        final index = i ~/ 2;
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      },
    );
  }

  Widget _buildRow(WordPair pair) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Text(
                  '每日签到送积分',
                  style: TextStyle(
                    //颜色
                    color: Colors.red,
                    //字体大小
                    fontSize: 13,
                    //字体加粗
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),

              Text('2017-17-11 10：10:10'),
            ],
          ),
          Container(
            child: Text('-20.00'),
          ),
        ],
      ),
    );
  }

  Widget _createList() {
    return new Container(
      child: Column(
        children: <Widget>[
          Container(
            child: TabBar(
              unselectedLabelColor: Colors.black,
              labelColor: Colors.green,
              indicatorColor: Colors.green,
              //指示器颜色 如果和标题栏颜色一样会白色
              tabs: myTabs,
              //绑定数据
              isScrollable: true,
              //是否可以滑动
              controller: _tabController,
            ),
          ),
          Container(
            child: TabBarView(
              controller: _tabController,
              children: myTabs.map((item) {
                return Container(
                  color: Colors.green,
                  child: _buildSuggestions(),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _createHeader() {
    return new Container(
      child: Column(
        children: <Widget>[
          Row(
            //把剩余空间平分n+1份，然后平分所有的空间
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                color: Colors.red,
//                margin:EdgeInsets.fromLTRB(5,50,5,50),//设置外边距
                padding: EdgeInsets.all(10), //内边距
                child: Text("我的积分"),
              ),
              Container(
                color: Colors.red,
                width: 17,
                height: 17,
                margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                child: Image.asset('images/icon_6.png'),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
//                color: Colors.red,
//                margin:EdgeInsets.fromLTRB(5,50,5,50),//设置外边距
                padding: EdgeInsets.all(10), //内边距
                child: Text(
                  "2421",
                  style: TextStyle(
                    //颜色
                    color: Colors.red,
                    //字体大小
                    fontSize: 21,
                    //字体加粗
                    fontWeight: FontWeight.bold,
                    //文本背景颜色
//                      background: pg
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  //设置边框
                  //背景色
                  color: Colors.redAccent,
                  //圆角
                  borderRadius: BorderRadius.circular(6),
                ),
//              color: Colors.red,
                height: 30,
                width: 77,
                margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                //设置外边距
//                padding: EdgeInsets.all(10), //内边距
                child: Center(
                  child: Text(
                    "积分宝典",
                    style: TextStyle(
                      //颜色
                      color: Colors.white,
                      //字体大小
                      fontSize: 14,
                      //字体加粗
                      fontWeight: FontWeight.normal,
                      //文本背景颜色
//                      background: pg
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                color: Colors.black,
                margin: EdgeInsets.fromLTRB(10, 0, 10, 0), //设置外边距
                child: Text(
                  "您有2300积分将于2017年12月31日清零",
                  style: TextStyle(
                    //颜色
                    color: Colors.red,
                    //字体大小
                    fontSize: 13,
                    //字体加粗
                    fontWeight: FontWeight.normal,
                    //文本背景颜色
//                      background: pg
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
