import 'package:flutter/material.dart';

class Constant{
  //字号
  static const lagerTextSize = 30.0;
  static const bigTextSize = 23.0;
  static const normalTextSize = 18.0;
  static const middleTextWhiteSize = 16.0;
  static const smallTextSize = 14.0;
  static const minTextSize = 12.0;

  static const normalTextWhite = TextStyle(
    color: Color(0xffffff),
    fontSize: normalTextSize,
  );

  ///墨水瓶可用时使用的字体样式。
  static const availableStyle = TextStyle(
    color: const Color(0xFF00CACE),
    fontSize: middleTextWhiteSize,
  );

  ///墨水瓶不可用时使用的字体样式。
  static const unavailableStyle = TextStyle(
    color: const Color(0xFFCCCCCC),
    fontSize: middleTextWhiteSize,
  );
}

class IconFont{
  static const String FONT_FAMILY = 'IconFont';

  static const IconData LOGIN_USER = const IconData(0xe666, fontFamily:
  IconFont.FONT_FAMILY);

  static const IconData LOGIN_PW = const IconData(0xe60e, fontFamily: IconFont.FONT_FAMILY);
}