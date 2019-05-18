import 'package:coupon_fair/pages/home/home.dart';
import 'package:coupon_fair/pages/login/login.dart';
import 'package:flutter/material.dart';

class NavigatorUtils{

  ///替换
  static pushReplacementNamed(BuildContext context, String routeName) {
    Navigator.pushReplacementNamed(context, routeName);
  }

  ///切换无参数页面
  static pushNamed(BuildContext context, String routeName) {
    Navigator.pushNamed(context, routeName);
  }

  ///主页
  static goHome(BuildContext context) {
    Navigator.pushReplacementNamed(context, HomePage.sName);
  }

  ///登录页
  static goLogin(BuildContext context) {
    Navigator.pushReplacementNamed(context, LoginPage.sName);
  }

  ///关闭当前页面
  static finish(BuildContext context){
    Navigator.maybePop(context);
  }
}