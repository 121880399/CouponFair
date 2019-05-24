import 'package:coupon_fair/common/style.dart';
import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  @override
  MyPageState createState() => MyPageState();
}

class MyPageState extends State<MyPage> {
  String avatar = "https://timgsa.baidu"
      ".com/timg?image&quality=80&size=b9999_10000&sec=1558431538745&di=d992b4428d62d9b54109e0917ef49907&imgtype=0&src=http%3A%2F%2Ftupian.qqjay.com%2Ftou2%2F2018%2F0724%2F696a864cb3385854e4f2f650e49d60a1.jpg";
  String level = "assets/images/3.0x/diamond.png";
  String drawings = "assets/images/3.0x/drawings.png";
  String order = "assets/images/3.0x/order.png";
  String team = "assets/images/3.0x/team.png";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffededed),
        body: Stack(
      children: <Widget>[
        ClipPath(
          clipper: BgClipper(),
          child: Container(
            color: Theme.of(context).primaryColor,
            height: 200.0,
          ),
        ),
        CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              actions: <Widget>[
                Container(
                    margin: EdgeInsets.only(right: 20.0),
                    child: Icon(
                      Icons.message,
                      color: Color(0x80ffffff),
                    ))
              ],
              backgroundColor: Colors.transparent,
              expandedHeight: 40.0,
              floating: true,
            ),
            SliverToBoxAdapter(
              child: _personInfo(),
            ),
            SliverToBoxAdapter(
              child: _detailInfo(),
            ),
            SliverToBoxAdapter(
              child: _currentTarget(),
            )
          ],
        )
      ],
    ));
  }

  Widget _personInfo() {
    return Card(
      elevation: 5.0,
      shape: new RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      color: Color(0xCCFFFFFF),
      margin: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Padding(
        padding: new EdgeInsets.only(
            left: 10.0, top: 10.0, right: 10.0, bottom: 10.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "周正一",
                    style: TextStyle(
                        fontSize: Constant.bigTextSize,
                        color: Color(0xff222222),
                        fontWeight: FontWeight.w700),
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        height: 20.0,
                        width: 20.0,
                        child: Image(
                          image: AssetImage(level),
                        ),
                      ),
                      SizedBox(
                        width: 2.0,
                      ),
                      Text(
                        "合伙人",
                        style: TextStyle(
                          fontSize: Constant.smallTextSize,
                          color: Color(0xffcd7f32),
                        ),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(top: 20.0)),
                  Text(
                    "邀请码:BA450",
                    style: TextStyle(
                      fontSize: Constant.smallTextSize,
                      color: Color(0xff222222),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 5.0)),
                  Text(
                    "手机:18101260507",
                    style: TextStyle(
                      fontSize: Constant.smallTextSize,
                      color: Color(0xff222222),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                height: 90.0,
                width: 90.0,
                alignment: Alignment.bottomRight,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: FadeInImage.assetNetwork(
                    placeholder: avatar,
                    image: avatar,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _detailInfo() {
    return Container(
      padding: EdgeInsets.all(20.0),
      margin: EdgeInsets.only(top: 2.0),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("会员中心",style: TextStyle(
            color: Color(0xff222222),
            fontWeight: FontWeight.w700,
            fontSize: Constant.middleTextWhiteSize
          ),),
          SizedBox(
            height: 10.0,
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  children: <Widget>[
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset(drawings,height: 30.0, width: 30.0, fit:
                      BoxFit.cover,),
                    ),
                    Text("提现",
                        style: TextStyle(
                            color: Color(0xff222222),
                            fontSize: Constant.smallTextSize)),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset(team,height: 30.0, width: 30.0, fit:
                      BoxFit.cover,),
                    ),
                    Text("团队",
                        style: TextStyle(
                            color: Color(0xff222222),
                            fontSize: Constant.smallTextSize)),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset(order,height: 30.0, width: 30.0, fit:
                      BoxFit.cover,),
                    ),
                    Text("订单",
                        style: TextStyle(
                            color: Color(0xff222222),
                            fontSize: Constant.smallTextSize)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _currentTarget(){
      return Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("当前目标",
                  style: TextStyle(
                      color: Color(0xff222222),
                      fontWeight: FontWeight.w700,
                      fontSize: Constant.middleTextWhiteSize
                  ),
                ),
                Text("邀请20个有效用户",
                  style: TextStyle(
                      color: Color(0xff222222),
                      fontSize: Constant.middleTextWhiteSize
                  ),
                ),
              ],
            ),
            Card(
              child: Column(
                children: <Widget>[
                    Text("还差2人升级到VIP会员",

                    )
                ],
              ),
            )
          ],
        ),
      );
  }
}

///贝塞尔曲线
class BgClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    var path = Path();
    path.lineTo(0, size.height - 20);
    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstEndPoint = Offset(size.width / 2.25, size.height - 30);

    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint = Offset(size.width / 4 * 3, size.height - 80);
    var secondEndPoint = Offset(size.width, size.height - 40);

    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height - 40);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}
