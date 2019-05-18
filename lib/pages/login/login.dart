import 'package:coupon_fair/common/config.dart';
import 'package:coupon_fair/common/style.dart';
import 'package:coupon_fair/utils/common_utils.dart';
import 'package:coupon_fair/utils/local_storage.dart';
import 'package:coupon_fair/utils/navigator_utils.dart';
import 'package:coupon_fair/widget/flex_button.dart';
import 'package:coupon_fair/widget/input_widget.dart';
import 'package:coupon_fair/widget/verify_code.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  static final String sName = "login";

  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {

  var _userName = "";

  var _LoginPassword = "";

  var _registerPassword = "";

  var _verifyCode = "";

  var _invitationCode = "";

  final TextEditingController userController = new TextEditingController();
  final TextEditingController pwController = new TextEditingController();
  final TextEditingController registerPwController = new
  TextEditingController();
  final TextEditingController verifyCodeController = new
  TextEditingController();
  final TextEditingController invitationCodeController = new
  TextEditingController();

  TabController controller;

  _LoginPageState() : super();

  @override
  void initState() {
    super.initState();
    controller = new TabController(length: 2, vsync: this);
    initParams();
  }

  initParams() async {
    _userName = await LocalStorage.get(Config.USER_NAME_KEY);
    _LoginPassword = await LocalStorage.get(Config.PW_KEY);
    userController.value = new TextEditingValue(text: _userName ?? "");
    pwController.value = new TextEditingValue(text: _LoginPassword ?? "");
    registerPwController.value = new TextEditingValue(text: _registerPassword
        ?? "");
    verifyCodeController.value = new TextEditingValue(text: _verifyCode ?? "");
    invitationCodeController.value = new TextEditingValue(text: _invitationCode ?? "");
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Scaffold(
            body: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      //从左上角到右下角渐变
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Color(0xFFFBB663), Color(0xFFFB6463)]),
                  ),
                ),
                Container(
                  height: 600.0,
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: TabBar(
                          indicatorColor: Color(0x80ffffff),
                          controller: controller,
                          isScrollable: true,
                          tabs: [Tab(text: "登录"), Tab(text: "注册")],
                        ),
                        margin: EdgeInsets.only(top: 150.0),
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [_loginCenter(), _registerCenter()],
                          controller: controller,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
        ),
    );
  }

  Widget _loginCenter() {
    return new Center(
      child: SafeArea(
        child: SingleChildScrollView(
          child: new Card(
            elevation: 5.0,
            shape: new RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            color: Color(0xCCFFFFFF),
            margin: const EdgeInsets.only(left: 30.0, right: 30.0),
            child: new Padding(
              padding: new EdgeInsets.only(
                  left: 30.0, top: 40.0, right: 30.0, bottom: 0.0),
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(padding: EdgeInsets.all(10.0)),
                  InputWidget(
                    hintText: "请输入手机号",
                    iconData: IconFont.LOGIN_USER,
                    onChanged: (String value){
                      _userName = value;
                    },
                    controller: userController,
                  ),
                  Padding(padding: EdgeInsets.all(10.0)),
                  InputWidget(
                    hintText: "请输入密码",
                    obscureText: true,
                    iconData: IconFont.LOGIN_PW,
                    onChanged: (String value){
                      _LoginPassword = value;
                    },
                    controller: pwController,
                  ),
                  Padding(padding: EdgeInsets.all(30.0)),
                  FlexButton(
                    text: "登录",
                    color: Theme.of(context).accentColor,
                    textColor: Colors.white,
                    onPress: (){
                      if (_userName == null || _userName.length == 0) {
                        return;
                      }
                      if (_LoginPassword == null || _LoginPassword.length == 0) {
                        return;
                      }
                      CommonUtils.showLoadingDialog(context);
                      //请求网络，保存到本地，关闭页面
                      NavigatorUtils.finish(context);
                    },
                  ),
                  Padding(padding: EdgeInsets.all(30.0)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _registerCenter() {
    return new Center(
      child: SafeArea(
        child: SingleChildScrollView(
          child: new Card(
            elevation: 5.0,
            shape: new RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            color: Color(0xCCFFFFFF),
            margin: const EdgeInsets.only(left: 30.0, right: 30.0),
            child: new Padding(
              padding: new EdgeInsets.only(
                  left: 30.0, top: 40.0, right: 30.0, bottom: 0.0),
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(padding: EdgeInsets.all(10.0)),
                  InputWidget(
                    hintText: "请输入手机号",
                    iconData: IconFont.LOGIN_USER,
                    onChanged: (String value){
                        _userName = value;
                    },
                    controller: userController,
                  ),
                  Padding(padding: EdgeInsets.all(10.0)),
                  VerifyCodeWidget(
                    onTapCallback: (){

                    },
                    onChanged: (String value){

                    },
                    controller: verifyCodeController,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
