import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';


class AnimationCircleProgress extends StatefulWidget {

  double percentage = 0.0;

  //圆环粗细
  double strokeWidth;

  //圆环颜色
  Color circleColor;

  //进度条颜色
  Color progressColor;

  @override
  _AnimationCircleProgressState createState() => _AnimationCircleProgressState();

  AnimationCircleProgress({this.percentage,this.strokeWidth=1.0,this.circleColor,this.progressColor});
}

class _AnimationCircleProgressState extends State<AnimationCircleProgress> with TickerProviderStateMixin , AutomaticKeepAliveClientMixin {


  AnimationController controller;



  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this,duration: Duration(milliseconds: 1000),
    lowerBound: 0.0,upperBound: widget.percentage,
    );
    controller.addListener((){
      setState(() {

      });
    });
    controller.forward(from: 0.0);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomPaint(
        foregroundPainter: ProgressPainter(
            strokeWidth: widget.strokeWidth,
            completePercent: controller.value,
            circleColor: widget.circleColor,
            progressColor: widget.progressColor,
        ),
        size: Size(100.0, 100.0),
      ),
    );
  }

  @override
  bool get wantKeepAlive => false;
}

class ProgressPainter extends CustomPainter{

  //圆环粗细
  double strokeWidth;

  //完成比例
  double completePercent;

  //圆环颜色
  Color circleColor;

  //进度条颜色
  Color progressColor;

  ProgressPainter({this.strokeWidth,this.completePercent,this.circleColor,this.progressColor});

  @override
  void paint(Canvas canvas,Size size){
    //圆环画笔
    Paint circlePaint = Paint()
      ..color = circleColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    Paint progressPaint = Paint()
      ..color = progressColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    Offset center = Offset(size.width/2, size.height/2);  //  坐标中心

    double radius = min(size.width/2, size.height/2);  //  半径

    //画背景圆
    canvas.drawCircle(center, radius, circlePaint);

    //计算圆弧角度
    double arcAngle = 2*pi*(completePercent / 100);

    canvas.drawArc(Rect.fromCircle(center: center,radius: radius), -pi/2, arcAngle, false, progressPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

}
