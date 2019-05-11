import 'package:coupon_fair/components/pagination.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: header()
    );
  }
}
///头部：包括搜索框，广告轮播图
header(){
  return Stack(
    children: <Widget>[
      Container(
        height: 200,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            //从左上角到右下角渐变
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [ Color(0xFFFBB663), Color(0xFFFB6463)]),
        ),
      ),
      Container(
        padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
        margin: EdgeInsets.fromLTRB(50.0, 30.0, 50.0, 30.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color(0x66FFFFFF),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Icon(Icons.search,color:  Color(0xFFFFFFFF),size: 20,),
            Text(
              '请输入商品名称',
              style : TextStyle(color: Color(0xFFFFFFFF),
                fontSize: 12.00,
              ),
              textAlign: TextAlign.left,
            )
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.fromLTRB(10.0, 80.0, 10.0, 10.0),
        child:Pagination(),
      )
    ],
  );
}
