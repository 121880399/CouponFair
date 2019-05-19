
import 'package:coupon_fair/common/style.dart';
import 'package:coupon_fair/widget/agreement.dart';
import 'package:coupon_fair/widget/flex_button.dart';
import 'package:coupon_fair/widget/input_widget.dart';
import 'package:coupon_fair/widget/verify_code.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  var _userName = "";

  var _registerPassword = "";

  var _verifyCode = "";

  var _invitationCode = "";

  final TextEditingController userController = new TextEditingController();

  final TextEditingController registerPwController =
  new TextEditingController();

  final TextEditingController verifyCodeController =
  new TextEditingController();

  final TextEditingController invitationCodeController =
  new TextEditingController();

  @override
  void initState() {
    super.initState();
    initParams();
  }

  initParams() async {
    userController.value = new TextEditingValue(text: _userName ?? "");
    registerPwController.value = new TextEditingValue(text: _registerPassword ?? "");
    verifyCodeController.value = new TextEditingValue(text: _verifyCode ?? "");
    invitationCodeController.value = new TextEditingValue(text: _invitationCode ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return  new Card(
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
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(padding: EdgeInsets.all(10.0)),
            InputWidget(
              hintText: "请输入手机号",
              iconData: IconFont.LOGIN_USER,
              onChanged: (String value) {
                _userName = value;
              },
              controller: userController,
              inputType: TextInputType.phone,
            ),
            Padding(padding: EdgeInsets.all(10.0)),
            VerifyCodeWidget(
              onTapCallback: () {},
              onChanged: (String value) {},
              controller: verifyCodeController,
              countdown: 60,
              available: true,
              hintText: "请输入验证码",
              iconData: Icons.verified_user,
            ),
            Padding(padding: EdgeInsets.all(10.0)),
            InputWidget(
              hintText: "请输入密码",
              obscureText: true,
              iconData: IconFont.LOGIN_PW,
              onChanged: (String value) {
                _registerPassword = value;
              },
              controller: registerPwController,
            ),
            Padding(padding: EdgeInsets.all(10.0)),
            InputWidget(
              hintText: "请输入邀请码",
              obscureText: true,
              iconData: IconFont.TEAM,
              onChanged: (String value) {
                _invitationCode = value;
              },
              controller: invitationCodeController,
            ),
            Padding(padding: EdgeInsets.all(15.0)),
            FlexButton(
              text: "注册",
              color: Theme.of(context).accentColor,
              textColor: Colors.white,
              onPress: () {
                //判空
                if (_userName == null || _userName.length == 0) {
                  return;
                }
                //请求网络
              },
            ),
            Padding(padding: EdgeInsets.all(10.0)),
            UserAgreementWidget(typeStr:"注册"),
          ],
        ),
      ),
    );
  }
}
