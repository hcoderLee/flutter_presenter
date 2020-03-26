import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  static final PATH = "/second";
  String param;
  TextEditingController _controller;

  // param 可在构造函数中被赋值
  SecondPage({Key key, this.param}) : super(key: key) {
    _controller = TextEditingController();
  }

  // 带参数返回上一页
  void _backWithResult(BuildContext context) {
    Navigator.pop(context, _controller.value.text);
  }

  @override
  Widget build(BuildContext context) {
    if (param == null) {
      // 构造函数未传入参数，尝试从路由参数中获取
      param = ModalRoute.of(context).settings.arguments;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("SecondPage"),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(height: 100),
            if (param != null && param.isNotEmpty)
              Text("Received from last page: $param"),
            SizedBox(height: 10),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  width: 100,
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(hintText: "input param"),
                  ),
                ),
                SizedBox(width: 10),
                RaisedButton(
                  onPressed: () => this._backWithResult(context),
                  child: Text("Back"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
