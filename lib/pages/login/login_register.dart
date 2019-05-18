import 'package:coupon_fair/pages/login/login.dart';
import 'package:coupon_fair/pages/login/register.dart';
import 'package:flutter/material.dart';

class LoginRegisterPage extends StatefulWidget {
  @override
  _LoginRegisterPageState createState() => _LoginRegisterPageState();
}

class _LoginRegisterPageState extends State<LoginRegisterPage> {
  PageController _pageController;

  PageView _pageView;

  ///当前页
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = new PageController();
    _pageView = new PageView(
      controller: _pageController,
      children: <Widget>[
        LoginPage(),
        RegisterPage(),
      ],
      onPageChanged: (index) {
        setState(() {
          _currentPage = index;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        /**
       * SafeArea，让内容显示在安全的可见区域
       * SafeArea，可以避免一些屏幕有刘海或者凹槽的问题
       */
        body: SingleChildScrollView(
          child: new Container(
              /**这里要手动设置container的高度和宽度，不然显示不了
             * 利用MediaQuery可以获取到跟屏幕信息有关的数据
             */
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              //设置渐变的背景
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                    //从左上角到右下角渐变
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFFFBB663), Color(0xFFFB6463)]),
              ),
              child: new Column(
                children: <Widget>[
                  new SizedBox(
                    height: 75,
                  ),
                  /**
                   * 可以用SizeBox这种写法代替Padding：在Row或者Column中单独设置一个方向的间距的时候
                   */
                  //中间的Indicator指示器
                  new Container(
                    width: 300,
                    height: 50,
                    child: new Row(
                      children: <Widget>[
                        Expanded(
                            child: new Container(
                          /**
                               * TODO:暂时不会用Paint去自定义indicator，所以暂时只能这样实现了
                               */

                          child: new Center(
                            child: new FlatButton(
                              onPressed: () {
                                _pageController.animateToPage(0,
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.decelerate);
                              },
                              child: _currentPage == 0 ?new Text(
                                "登陆",
                                style: TextStyle(fontSize: 16,
                                  color: Colors.white
                                ),
                              ):new Text(
                                "登陆",
                                style: TextStyle(fontSize: 16,
                                  color: Colors.black
                                ),
                              ),
                            ),
                          ),
                        )),
                        Expanded(
                            child: new Container(
                          child: new Center(
                            child: new FlatButton(
                              onPressed: () {
                                _pageController.animateToPage(1,
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.decelerate);
                              },
                              child:_currentPage == 1? new Text(
                                "注册",
                                style: TextStyle(fontSize: 16,
                                color: Colors.white
                                ),
                              ): new Text(
                                "注册",
                                style: TextStyle(fontSize: 16,
                                    color: Colors.black
                                ),
                              ),
                            ),
                          ),
                        )),
                      ],
                    ),
                  ),
                  new Expanded(
                    child: _pageView,
                  )
                ],
              )),
        ));
  }
}
