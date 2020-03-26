import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class GestureDemoPage extends StatefulWidget {
  @override
  _GestureDemoPageState createState() => _GestureDemoPageState();
}

class _GestureDemoPageState extends State<GestureDemoPage> {
  var x = 0.0;
  var y = 0.0;
  var isMove = false;

  var startX = 0.0;
  var startY = 0.0;

  final radius = 25.0;

  void _updatePosition(Offset offset) {
    setState(() {
      x = offset.dx + startX;
      y = offset.dy + startY;
      isMove = true;
    });
  }

  void _onMoveEnd() {
    startX = x;
    startY = y;
    setState(() => isMove = false);
  }

  @override
  Widget build(BuildContext context) {
    final size = radius * 2;

    return Scaffold(
      appBar: AppBar(title: Text("GestureDemo")),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: y,
            left: x,
            child: GestureDetector(
              onTap: () => Fluttertoast.showToast(msg: "tap"),
              onDoubleTap: () => Fluttertoast.showToast(msg: "double tap"),
              onLongPress: () => Fluttertoast.showToast(msg: "long press"),
              onPanUpdate: (event) => _updatePosition(event.localPosition),
              onPanEnd: (event) => _onMoveEnd(),
              child: Container(
                width: size,
                height: size,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.all(Radius.circular(radius)),
                ),
              ),
            ),
          ),
          if (isMove)
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  "x: ${x.toStringAsFixed(2)}, y:${y.toStringAsFixed(2)}",
                ),
              ),
            )
        ],
      ),
    );
  }
}
