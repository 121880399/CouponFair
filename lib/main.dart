
import 'package:flutter/material.dart';
import 'package:coupon_fair/pages/home/home.dart';
import 'package:coupon_fair/pages/category/category.dart';
import 'package:coupon_fair/pages/my/my.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '券集',
      theme: ThemeData(
        primaryColor: Color(0xFFFB6463),
            accentColor: Color(0xFFFBB663)
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyHomePageState() ;
  }
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{

  TabController controller ;


  @override
  void initState() {
    controller = new TabController(length: 3, vsync: this);
  }


  @override
  void dispose() {
    controller.dispose();
    super.dispose() ;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: new TabBarView(
          controller: controller,
          children: <Widget>[
            new HomePage(),
            new CategoryPage(),
            new MyPage()
          ]
      ),

      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            gradient: const LinearGradient(
              //从左上角到右下角渐变
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFFFBB663), Color(0xFFFB6463)]),
        ),
        child : new TabBar(
            controller: controller,
            tabs: <Tab>[
              new Tab(text: "首页",icon: new Icon(Icons.home)),
              new Tab(text: "分类",icon: new Icon(Icons.message)),
              new Tab(text: "我的",icon: new Icon(Icons.cloud)),
            ],
          ),
        ),
    ) ;
  }
}

