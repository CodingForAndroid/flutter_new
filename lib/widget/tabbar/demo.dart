/// @Author: 一凨
/// @Date: 2018-12-22 20:38:01
/// @Last Modified by: 一凨
/// @Last Modified time: 2018-12-22 20:51:47

import 'package:flutter/material.dart';

class TabDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500.0,
      child: MyTabbedPage(),
    );
  }
}

class MyTabbedPage extends StatefulWidget {
  const MyTabbedPage({Key key}) : super(key: key);
  @override
  _MyTabbedPageState createState() => _MyTabbedPageState();
}

class _MyTabbedPageState extends State<MyTabbedPage>
    with SingleTickerProviderStateMixin {
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'LEFT'),
    Tab(text: 'RIGHT'),
    Tab(text: 'RIGHT'),
    Tab(text: 'LEFT'),
    Tab(text: 'RIGHT'),
    Tab(text: 'RIGHT'),
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
//        bottom: TabBar(
//          controller: _tabController,
//          tabs: myTabs,
//        ),
          ),
      body: Column(
        children: <Widget>[
          Container(
            child: TabBar(
              unselectedLabelColor: Colors.black,
              labelColor: Colors.green,
              indicatorColor: Colors.green,
              //指示器颜色 如果和标题栏颜色一样会白色
              tabs: myTabs,
              //是否可以滑动，如果是 true 优先居中展示，
//              isScrollable: true,
              //是否可以滑动
              controller: _tabController,

            ),
          ),
          Container(
            child: Expanded(
              child: TabBarView(
                controller: _tabController,
                children: myTabs.map((Tab tab) {
                  return Center(child: Text(tab.text));
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
