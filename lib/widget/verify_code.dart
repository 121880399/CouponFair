import 'dart:async';

import 'package:coupon_fair/common/style.dart';
import 'package:coupon_fair/widget/input_widget.dart';
import 'package:flutter/material.dart';

class VerifyCodeWidget extends StatefulWidget {
  ///倒计时的秒数，默认为60秒
  final int countdown;

  ///用户点击时的回调函数
  final Function onTapCallback;

  ///是否可以获取验证码，默认为false
  final bool available;

  ///用户更改验证码的回调
  final ValueChanged<String> onChanged;

  final TextEditingController controller;

  VerifyCodeWidget(
      {this.countdown: 60,
      this.onTapCallback,
      this.available: false,
      this.onChanged,
      this.controller});

  @override
  _VerifyCodeWidgetState createState() => _VerifyCodeWidgetState();
}

class _VerifyCodeWidgetState extends State<VerifyCodeWidget> {
  ///倒计时的计时器
  Timer _timer;

  ///当前倒计时的秒数
  int _seconds;

  ///当前墨水瓶的字体样式
  TextStyle inkWellStyle = Constant.availableStyle;

  ///当前墨水瓶的文本
  String _verifyStr = "获取验证码";

  @override
  void initState() {
    super.initState();
    _seconds = widget.countdown;
  }

  ///开始倒计时
  void _startTime() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_seconds == 0) {
        _cancelTimer();
        _seconds = widget.countdown;
        inkWellStyle = Constant.availableStyle;
        setState(() {});
        return;
      }
      _seconds--;
      _verifyStr = '已发送$_seconds' + 's';
      setState(() {});
      if (_seconds == 0) {
        _verifyStr = '重新发送';
      }
    });
  }

  ///取消倒计时
  void _cancelTimer() {
    _timer?.cancel();
  }

  @override
  void dispose() {
    super.dispose();
    _timer = null;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        InputWidget(
          hintText: '请输入验证码',
          iconData: Icons.verified_user,
          onChanged: widget.onChanged,
          controller: widget.controller,
        ),
        widget.available
            ? InkWell(
                child: Text(
                  ' $_verifyStr ',
                  style: inkWellStyle,
                ),
                onTap: (_seconds == widget.countdown)
                    ? () {
                        _startTime();
                        inkWellStyle = Constant.unavailableStyle;
                        _verifyStr = "已发送$_seconds" + "s";
                        setState(() {});
                        widget.onTapCallback();
                      }
                    : null,
              )
            : InkWell(
                child: Text(
                  " 获取验证码 ",
                  style: Constant.unavailableStyle,
                ),
              )
      ],
    );
  }
}
