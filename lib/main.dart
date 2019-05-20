import 'package:coupon_fair/pages/earnings/earnings.dart';
import 'package:coupon_fair/pages/login/login.dart';
import 'package:coupon_fair/pages/login/login_register.dart';
import 'package:coupon_fair/pages/share/share.dart';
import 'package:flutter/material.dart';
import 'package:coupon_fair/pages/home/home.dart';
import 'package:coupon_fair/pages/category/category.dart';
import 'package:coupon_fair/pages/my/my.dart';
import 'package:coupon_fair/common/style.dart';

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
          primaryColor: Color(0xFFFB6463), accentColor: Color(0xFFFBB663)),
      home: MyHomePage(),
      routes: <String, WidgetBuilder>{
        "login_register": (_) => LoginRegisterPage()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  PageController controller;

  //当前第几页
  int currentPage = 0;

  String home = "assets/images/3.0x/home.png";
  String category = "assets/images/3.0x/category.png";
  String share = "assets/images/3.0x/share.png";
  String earnings = "assets/images/3.0x/earnings.png";
  String my = "assets/images/3.0x/my.png";

  String home_selected = "assets/images/3.0x/home_selected.png";
  String category_selected = "assets/images/3.0x/category_selected.png";
  String share_selected = "assets/images/3.0x/share_selected.png";
  String earnings_selected = "assets/images/3.0x/earnings_selected.png";
  String my_selected = "assets/images/3.0x/my_selected.png";

  @override
  void initState() {
    controller = new PageController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: new PageView(
          controller: controller,
          onPageChanged: onPageChanged,
          children: <Widget>[
            new HomePage(),
            new CategoryPage(),
            new SharePage(),
            new EarningsPage(),
            new MyPage()
          ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            currentPage = 2;
          });
        },
        backgroundColor: Colors.white,
        child: currentPage == 2
            ? Image.asset(
                share_selected,
                height: 20.0,
                width: 20.0,
              )
            : Image.asset(
                share,
                height: 20.0,
                width: 20.0,
              ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
        height: 60.0,
        child: BottomAppBar(
            shape: CircularNotchedRectangle(),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      onPressed: () {
                        setState(() {
                          currentPage = 0;
                        });
                      },
                      icon: currentPage == 0
                          ? Image.asset(
                              home_selected,
                              height: 20.0,
                              width: 20.0,
                            )
                          : Image.asset(
                              home,
                              height: 20.0,
                              width: 20.0,
                            ),
                    ),
                    Text("首页",
                        style: currentPage == 0
                            ? TextStyle(
                                color: Color(0xfff683a2),
                                fontSize: Constant.minTextSize)
                            : TextStyle(fontSize: Constant.minTextSize)),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      onPressed: () {
                        setState(() {
                          currentPage = 1;
                        });
                      },
                      icon: currentPage == 1
                          ? Image.asset(
                              category_selected,
                              height: 20.0,
                              width: 20.0,
                            )
                          : Image.asset(
                              category,
                              height: 20.0,
                              width: 20.0,
                            ),
                    ),
                    Text("分类",
                        style: currentPage == 1
                            ? TextStyle(
                                color: Color(0xfff683a2),
                                fontSize: Constant.minTextSize)
                            : TextStyle(fontSize: Constant.minTextSize)),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      onPressed: () {
                        setState(() {
                          currentPage = 3;
                        });
                      },
                      icon: currentPage == 3
                          ? Image.asset(
                              earnings_selected,
                              height: 20.0,
                              width: 20.0,
                            )
                          : Image.asset(
                              earnings,
                              height: 20.0,
                              width: 20.0,
                            ),
                    ),
                    Text("收益",
                        style: currentPage == 3
                            ? TextStyle(
                                color: Color(0xfff683a2),
                                fontSize: Constant.minTextSize)
                            : TextStyle(fontSize: Constant.minTextSize)),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      onPressed: () {
                        setState(() {
                          currentPage = 4;
                        });
                      },
                      icon: currentPage == 4
                          ? Image.asset(
                              my_selected,
                              height: 20.0,
                              width: 20.0,
                            )
                          : Image.asset(
                              my,
                              height: 20.0,
                              width: 20.0,
                            ),
                    ),
                    Text("我的",
                        style: currentPage == 4
                            ? TextStyle(
                                color: Color(0xfff683a2),
                                fontSize: Constant.minTextSize)
                            : TextStyle(fontSize: Constant.minTextSize)),
                  ],
                )
              ],
            )),
      ),
    );
  }

  void onPageChanged(int page) {
    setState(() {
      this.currentPage = page;
    });
  }

  void onTap(int index) {
    controller.jumpToPage(index);
  }
}
