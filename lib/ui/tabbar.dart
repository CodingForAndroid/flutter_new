import 'package:flutter/material.dart';

///积分明细
class TabBarDemo extends StatefulWidget {
  final String title;

  TabBarDemo({Key key, this.title}) : super(key: key);

  @override
  createState() => _TabBarDemo();
}

class _TabBarDemo extends State<TabBarDemo>
    with SingleTickerProviderStateMixin {
  TabController mController;
  List<Tab> tabList;
  @override
  void initState() {
    super.initState();
    initTabData();
    mController = TabController(
      length: tabList.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    mController.dispose();
  }

  initTabData() {
    tabList = [
      new Tab(text: '推荐'),
      new Tab(text: '热点'),
      new Tab(text: '社会'),
      new Tab(text: '娱乐'),
      new Tab(text: '体育'),
//      new Tab(text:'美文'),
//      new Tab(text:'科技'),
//      new Tab(text:'财经'),
//      new Tab(text:'时尚')
    ];
  }

  List<Widget> tabLists = [
    new Container(
      child: Text("推荐"),
    ),
    new Container(
      child: Text("热点"),
    ),
    new Container(
      child: Text("社会"),
    )
  ];
  final List<Tab> myTabs = <Tab>[
    new Tab(text: '推荐'),
    new Tab(text: '热点'),
    new Tab(text: '社会'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
        backgroundColor: Color(0xff4F94CD),
        bottom: TabBar(controller: mController, tabs: myTabs),
      ),
//      floatingActionButton: FloatingActionButton(
//        child: Icon(Icons.all_inclusive),
//        backgroundColor: Color(0xffd43d3d),
//        elevation: 2.0,
//        highlightElevation: 2.0,
//        onPressed: () {},
//      ),
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            children: <Widget>[
              TabBar(
                  isScrollable: true,
                  //是否可以滚动
                  controller: mController,
                  labelColor: Colors.red,
                  unselectedLabelColor: Color(0xff666666),
                  labelStyle: TextStyle(fontSize: 16.0),
                  tabs: tabLists)
            ],
//            child: TabBar(
//              isScrollable: true,
//              //是否可以滚动
//              controller: mController,
//              labelColor: Colors.red,
//              unselectedLabelColor: Color(0xff666666),
//              labelStyle: TextStyle(fontSize: 16.0),
//              tabs: myTabs
//            ),
          ),
          Expanded(
            child: TabBarView(
              controller: mController,
              children: tabLists.map((item) {
                return Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topCenter,
                      child: Text("aaaa"),
                    ),
                  ],
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}
