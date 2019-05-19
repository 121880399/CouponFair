import 'package:coupon_fair/common/config.dart';
import 'package:coupon_fair/common/style.dart';
import 'package:coupon_fair/utils/common_utils.dart';
import 'package:coupon_fair/utils/local_storage.dart';
import 'package:coupon_fair/utils/navigator_utils.dart';
import 'package:coupon_fair/widget/agreement.dart';
import 'package:coupon_fair/widget/flex_button.dart';
import 'package:coupon_fair/widget/input_widget.dart';
import 'package:flutter/gestures.dart';
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

  var _loginPassword = "";

  final TextEditingController userController = new TextEditingController();
  final TextEditingController pwController = new TextEditingController();

  _LoginPageState() : super();

  @override
  void initState() {
    super.initState();
    initParams();
  }

  initParams() async {
    _userName = await LocalStorage.get(Config.USER_NAME_KEY);
    _loginPassword = await LocalStorage.get(Config.PW_KEY);
    userController.value = new TextEditingValue(text: _userName ?? "");
    pwController.value = new TextEditingValue(text: _loginPassword ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return new Card(
      elevation: 5.0,
      shape: new RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      color: Color(0xCCFFFFFF),
      margin: const EdgeInsets.only(left: 30.0, right: 30.0),
      child: new Padding(
        padding: new EdgeInsets.only(
            left: 30.0, top: 10.0, right: 30.0, bottom: 0.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(padding: EdgeInsets.all(10.0)),
            InputWidget(
              hintText: "请输入手机号",
              iconData: IconFont.LOGIN_USER,
              onChanged: (String value) {
                _userName = value;
              },
              controller: userController,
            ),
            Padding(padding: EdgeInsets.all(10.0)),
            InputWidget(
              hintText: "请输入密码",
              obscureText: true,
              iconData: IconFont.LOGIN_PW,
              onChanged: (String value) {
                _loginPassword = value;
              },
              controller: pwController,
            ),
            Padding(padding: EdgeInsets.all(8.0)),
            Container(
              alignment: Alignment.bottomRight,
              child: Text.rich(
                TextSpan(
                  text: "忘记密码？",
                  style: TextStyle(
                      fontSize: Constant.smallTextSize,
                      color: Theme.of(context).primaryColor),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      print('点击了“忘记密码”');
                    },
                ),
              ),
            ),
            Padding(padding: EdgeInsets.all(20.0)),
            FlexButton(
              text: "登录",
              color: Theme.of(context).accentColor,
              textColor: Colors.white,
              onPress: () {
                if (_userName == null || _userName.length == 0) {
                  return;
                }
                if (_loginPassword == null || _loginPassword.length == 0) {
                  return;
                }
                CommonUtils.showLoadingDialog(context);
                //请求网络，保存到本地，关闭页面
                NavigatorUtils.finish(context);
              },
            ),
            Padding(padding: EdgeInsets.all(10.0)),
            UserAgreementWidget(),
          ],
        ),
      ),
    );
  }
}
