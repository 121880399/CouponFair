import 'package:flutter/material.dart';

class ShareImage extends StatefulWidget {
  var images;

  ShareImage({this.images});

  @override
  _ShareImageState createState() => new _ShareImageState();
}

class _ShareImageState extends State<ShareImage> {
  bool _isAddGradient = false;

  @override
  Widget build(BuildContext context) {
    var decorationBox = DecoratedBox(
      decoration: _isAddGradient
          ? BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset.bottomRight,
          end: FractionalOffset.topLeft,
          colors: [
            Color(0x00000000).withOpacity(0.9),
            Color(0xff000000).withOpacity(0.01),
          ],
        ),
      )
          : BoxDecoration(),
    );

    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 450.0,
          child: PageView.builder(
            controller: PageController(viewportFraction: 0.8),
            itemCount: widget.images.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 16.0,
                  horizontal: 8.0,
                ),
                child: GestureDetector(
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(8.0),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.network(
                          widget.images[index],
                          fit: BoxFit.fill,
                        ),
                        decorationBox,
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}