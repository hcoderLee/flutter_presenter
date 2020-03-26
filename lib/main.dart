import 'package:flutter/material.dart';
import 'package:presentation/animation/AnimationDemoPage.dart';
import 'package:presentation/async/AsyncDemoPage.dart';
import 'package:presentation/gesture/GestureDemoPage.dart';
import 'package:presentation/layout/LayoutDemoPage.dart';
import 'package:presentation/network/NetworkDemoPage.dart';
import 'package:presentation/routing/RoutingDemoPage.dart';
import 'package:presentation/routing/SecondPage.dart';
import 'package:presentation/state/CartState.dart';
import 'package:presentation/state/ShoppingPage.dart';
import 'package:presentation/storage/StorageDemoPage.dart';
import 'package:presentation/widget/WidgetDemo.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (BuildContext context) => CartState(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        SecondPage.PATH: (context) => SecondPage(),
      },
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
//        tit![ec69c1111f73ec7b781996811c7c77c9.png](evernotecid://9A3B1F95-8C12-4F75-9878-0C11CC587170/appyinxiangcom/27441013/ENResource/p5)le: Text("Flutter Presentation"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.all(0),
          children: <Widget>[
            DrawerHeader(
              child: Text("Flutter Presentation"),
              decoration: BoxDecoration(color: Colors.blue),
            ),
            ListTile(
              title: Text("Layout"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LayoutDemoPage()),
                );
              },
            ),
            ListTile(
              title: Text("Gesture"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GestureDemoPage()),
                );
              },
            ),
            ListTile(
              title: Text("Animation"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AnimationDemoPage()),
                );
              },
            ),
            ListTile(
              title: Text("Routing"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RoutingDemoPage()),
                );
              },
            ),
            ListTile(
              title: Text("Network"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NetworkDemoPage()),
                );
              },
            ),
            ListTile(
              title: Text("Async"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AsyncDemoPage()),
                );
              },
            ),
            ListTile(
              title: Text("StateManagement"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ShoppingPage()),
                );
              },
            ),
            ListTile(
              title: Text("Storage"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StorageDemoPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: WidgetDemo(),
    );
  }
}
