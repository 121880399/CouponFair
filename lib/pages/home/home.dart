import 'package:coupon_fair/model/commission_list_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {

  List<CommissionListData> listData;

  @override
  Widget build(BuildContext context) {
     _getData();
    return new Scaffold(
      backgroundColor: Color(0x22FBB663),
        body:Column(
          children: <Widget>[
            header(),
            commissionStr(),
            ListView.builder(
                itemCount: listData == null ? 0 : listData.length,
                itemBuilder: (BuildContext context,int position){
                  return _getView(context,position);
                }
            )
          ],
        )
    );
  }

  List<CommissionListData> _getData(){
    listData =new List<CommissionListData>();
    for(int i =0 ; i < 10 ; i++){
      CommissionListData data = new CommissionListData();
      data.imageUrl="http://img14.360buyimg.com/n1/jfs/t1/2805/7/11143/227984/5bcd2e31E74de6ffd/aac0fd578665d311.jpg";
      data.goodsName="日本直邮 龙角散润喉糖 蜂蜜牛奶 88g/包";
      data.isSelfSupport = true;
      data.originalPrice = "19.3";
      data.discounts = "4";
      data.commission = "4";
      data.surplusNum = "333444";
      data.goodsId = "1";
      listData.add(data);
    }
  }

  ///这里返回每一个item视图
  Widget _getView(BuildContext context,int position){
    if(null != listData){
        return Column(
          children: <Widget>[
            Container(
              child: Image(
                image: NetworkImage(listData[position].imageUrl),
              ),
            ),
            Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Offstage(
                        offstage: listData[position].isSelfSupport,
                        child: Image(
                            image: AssetImage('assets/images/3.0x/self_support.png'),
                        ),
                      ),
                      Text(listData[position].goodsName,
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xff222222)
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text("原价：¥${listData[position].originalPrice}",
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff222222),
                        fontWeight: FontWeight.w400
                        )
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10.0),
                        child: Text("优惠：¥${listData[position].discounts}",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.red,
                          ),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Image.asset('assets/images/3.0x/ic_commision.png'),
                      Text("佣金：¥${listData[position].commission}",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.red,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10.0),
                        child: Text("剩余:${listData[position].surplusNum}张",
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xff222222)
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10.0),
                        child: Icon(Icons.share,color: Colors.red,),
                      )
                    ],
                  ),
                ],
            )
          ],
        );
    }
  }
}


///头部：包括搜索框，广告轮播图
header(){
  var images = [
    "http://images.huasheng100.com/public/1557398620019481.jpg",
    "http://images.huasheng100.com/public/1557587672254042.jpg",
    "http://images.huasheng100.com/public/1557564456528952.jpg",
  ];

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
        margin: EdgeInsets.fromLTRB(00.0, 80.0, 00.0, 00.0),
        height: 200,
        child:Swiper(
          itemBuilder: (BuildContext context,int index){
            return new Image.network(
              images[index],
              fit: BoxFit.fill,
            );
          },
          itemCount: images.length,
          viewportFraction: 0.8,
          scale: 0.9,
          pagination: new SwiperPagination(),
          autoplay : true,
          loop: true,
        ),
      )
    ],
  );
}

///佣金文案
commissionStr(){
  return Column(
    children: <Widget>[
      Container(
        margin: EdgeInsets.only(top: 20),
          child: Row(
            mainAxisAlignment:  MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                height: 1.0,
                width: 3.0,
                decoration: BoxDecoration(color: Color(0xFFFB6463),
                shape: BoxShape.circle),
              ),
              Container(
                height: 1.0,
                width: 50.0,
                decoration : BoxDecoration(color: Color(0xFFFB6463)),
              ),
              Text("佣金排行榜",
                style: TextStyle(
                    fontSize: 18.0,
                    color:  Color(0xFFFB6463),
                  fontWeight: FontWeight.w500
                ),
              ),
              Container(
                height: 1.0,
                width: 50.0,
                decoration : BoxDecoration(color: Color(0xFFFB6463)),
              ),
              Container(  height: 1.0,
                width: 3.0,
                decoration: BoxDecoration(color: Color(0xFFFB6463),
                    shape: BoxShape.circle),
              ),
            ],
          )
      ),
    ],
  );
}
