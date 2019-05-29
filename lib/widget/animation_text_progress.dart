import 'package:flutter/material.dart';

class AnimationTextProgress extends StatefulWidget {
  double percentage =0.0;
  TextStyle style;
  @override
  _AnimationTextProgressState createState() => _AnimationTextProgressState();

  AnimationTextProgress({this.percentage,this.style});
}

class _AnimationTextProgressState extends State<AnimationTextProgress> with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {

  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this,duration: Duration(milliseconds: 1000),
      lowerBound: 0.0 ,upperBound: widget.percentage);
    _controller.addListener((){
      setState(() {

      });
    });
    _controller.forward(from: 0.0);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text("${_controller.value.toInt()}%",style:widget.style,);
  }

  @override
  bool get wantKeepAlive => false;
}
