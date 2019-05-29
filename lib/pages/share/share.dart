import 'package:coupon_fair/common/style.dart';
import 'package:coupon_fair/utils/common_utils.dart';
import 'package:coupon_fair/widget/share_image_.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class SharePage extends StatefulWidget {
  @override
  _SharePageState createState() => _SharePageState();
}

class _SharePageState extends State<SharePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[_getImageShare(), _getTextShare(), _getShareChannel()],
    ));
  }

  ///返回分享的图片
  Widget _getImageShare() {
    var images = [
      "http://oss2.lanlanlife.com/3bd964229ed3d4866cd04d4c683231a8_1646x1080.jpg",
      "http://oss2.lanlanlife.com/77f2d4ab6a924217940bf28acb068938_1646x1080.jpg",
      "http://oss1.lanlanlife.com/0ab50d49bb29922d44f056f3f91dc661_1646x1080.jpg",
      "http://oss2.lanlanlife.com/4804f109df14fdc557cbf4cc5e8c5473_1646x1080.jpg",
      "http://oss2.lanlanlife.com/28f77bef2acf40ebeda47efe47c714f3_1646x1080.jpg"
    ];
//    return Expanded(child: ShareImage(images: images,));
    return Container(
      height: 450.0,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return new Image.network(
            images[index],
            alignment: AlignmentDirectional.center,
            fit: BoxFit.scaleDown,
          );
        },
        itemCount: images.length,
        viewportFraction: 0.8,
        scale: 0.9,
        autoplay: false,
        loop: false,
      ),
    );
  }

  ///返回分享的文案
  Widget _getTextShare() {
    String textShare = "周正一邀请您加入享购APP，享购APP自购省钱，分享赚钱。先领券，再购物，更划算！\n-----"
        "\n下载链接:http://t.cn/E1234 \n----\n复制这条消息，打开享购APP，输入邀请码AB231注册领取优惠券！";
    return Card(
      margin: EdgeInsets.only(top: 10.0),
      color: Colors.white,
      child: Padding(
    padding: const EdgeInsets.all(20.0),
    child: Column(
      children: <Widget>[
        Text(
          textShare,
          style: TextStyle(
              color: Color(0xff222222), fontSize: Constant.smallTextSize),
        ),
        SizedBox(
          height: 10.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              height: 40.0,
              width: 100.0,
              padding: EdgeInsets.all(2.0),
              child: new OutlineButton(
                borderSide: BorderSide(color: Colors.redAccent),
                onPressed: () {
                  CommonUtils.copyToClipboard(textShare);
                },
                child: new Text(
                  "复制文本",
                  style: TextStyle(
                      color: Colors.redAccent,
                      fontSize: Constant.smallTextSize),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
      ),
    );
  }

  ///返回分享的渠道
  Widget _getShareChannel() {
    return Container();
  }
}
