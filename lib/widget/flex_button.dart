import 'package:flutter/material.dart';

/**
 * 圆角BUtton
 * Created by 周正一
 * Date: 2019/5/19
 */
class FlexButton extends StatelessWidget {
  final String text;

  final Color color;

  final Color textColor;

  final VoidCallback onPress;

  final double fontSize;
  final int maxLines;

  final MainAxisAlignment mainAxisAlignment;

  FlexButton(
      {Key key, this.text, this.color, this.textColor, this.onPress, this.fontSize = 20.0, this.mainAxisAlignment = MainAxisAlignment.center, this.maxLines = 1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new RaisedButton(
        padding: new EdgeInsets.only(left: 20.0, top: 10.0, right: 20.0, bottom: 10.0),
        textColor: textColor,
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30))
        ),
        child: new Flex(
          mainAxisAlignment: mainAxisAlignment,
          direction: Axis.horizontal,
          children: <Widget>[new Text(text, style: new TextStyle(fontSize: fontSize), maxLines: maxLines, overflow:TextOverflow.ellipsis)],
        ),
        onPressed: () {
          this.onPress?.call();
        });
  }
}
