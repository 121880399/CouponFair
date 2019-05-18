import 'package:coupon_fair/common/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

///编写通用逻辑
class CommonUtils{


  static Future<Null> showLoadingDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return new Material(
              color: Colors.transparent,
              child: WillPopScope(
                onWillPop: () => new Future.value(false),
                child: Center(
                  child: new Container(
                    width: 200.0,
                    height: 200.0,
                    padding: new EdgeInsets.all(4.0),
                    decoration: new BoxDecoration(
                      color: Colors.transparent,
                      //用一个BoxDecoration装饰器提供背景图片
                      borderRadius: BorderRadius.all(Radius.circular(4.0)),
                    ),
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Container(child: SpinKitCubeGrid(color: Color
                          (0xffffff))),
                        new Container(height: 10.0),
                        new Container(child: new Text("努力加载中···", style: Constant.normalTextWhite)),
                      ],
                    ),
                  ),
                ),
              ));
        });
  }
}