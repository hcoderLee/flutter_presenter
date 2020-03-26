import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:presentation/routing/SecondPage.dart';

class RoutingDemoPage extends StatelessWidget {
  TextEditingController _controller;

  RoutingDemoPage() {
    _controller = TextEditingController();
  }

  // 页面构造函数中传参
  void _goWithPageParam(BuildContext context) async {
    final String res = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => SecondPage(param: _controller.value.text)),
    );
    if (res != null && res.isNotEmpty) {
      Fluttertoast.showToast(msg: res);
    }
  }

  // 路由中传参
  void _goWithRoutingParam(BuildContext context) async {
    final String res = await Navigator.push(
      context,
      MaterialPageRoute(
          settings: RouteSettings(arguments: _controller.value.text),
          builder: (context) => SecondPage()),
    );
    if (res != null && res.isNotEmpty) {
      Fluttertoast.showToast(msg: res);
    }
  }

  // 根据页面名跳转
  void _goByName(BuildContext context) async {
    final res = await Navigator.pushNamed(
      context,
      SecondPage.PATH,
      arguments: this._controller.value.text,
    );
    if (res != null && res.toString().isNotEmpty) {
      Fluttertoast.showToast(msg: res);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("RoutingDemo")),
      body: Align(
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(height: 100),
            SizedBox(
              width: 150,
              child: TextField(
                decoration: InputDecoration(hintText: "input param"),
                controller: _controller,
                autofocus: false,
              ),
            ),
            SizedBox(height: 10),
            RaisedButton(
              onPressed: () => this._goWithPageParam(context),
              child: Text("PageParam"),
            ),
            SizedBox(height: 10),
            RaisedButton(
              onPressed: () => this._goWithRoutingParam(context),
              child: Text("RouteParam"),
            ),
            SizedBox(height: 10),
            RaisedButton(
              onPressed: () => this._goByName(context),
              child: Text("PageName"),
            )
          ],
        ),
      ),
    );
  }
}
