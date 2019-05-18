import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  @override
  MyPageState createState() => MyPageState();
}

class MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("我的"),
      ),
      body: new Center(
        child: new RaisedButton(
          onPressed: () {
            Navigator.of(context).pushNamed("login_register");
          },
          child: new Text("点我跳转"),
          color: Colors.blue,
          highlightColor: Colors.lightBlue,
        ),
      ),
    );
  }
}
