import 'package:flutter/material.dart';

class StorageDemoPage extends StatelessWidget {
  final titleStyle = TextStyle(fontSize: 15);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Storage")),
      body: Column(
        children: <Widget>[
          Text("SharedPreference", style: titleStyle),
          Text("SharedPreference", style: titleStyle),
          Text("SharedPreference", style: titleStyle),
        ],
      ),
    );
  }

  Widget buildSP() {
    return Container();
  }

  Widget buildSQL() {
    return Container();
  }

  Widget buildFile() {
    return Container();
  }
}
