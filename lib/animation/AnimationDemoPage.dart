import 'package:flutter/material.dart';

const HERO_TAG = "hero";

class AnimationDemoPage extends StatefulWidget {
  @override
  _AnimationDemoPageState createState() => _AnimationDemoPageState();
}

class _AnimationDemoPageState extends State<AnimationDemoPage>
    with SingleTickerProviderStateMixin {
  final _duration = const Duration(seconds: 1);
  final MAX_MOVE = 300.0;

  var _moveTo = 0.0;
  CurvedAnimation _curve;

  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: _duration, vsync: this);
    _curve = CurvedAnimation(parent: _controller, curve: Curves.easeInSine);
    _setCustomStart();
  }

  //设置custom动画组件移动到终点
  void _setCustomStart() {
    _controller.reset();
    _animation = Tween<double>(begin: 0, end: MAX_MOVE).animate(_curve)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((state) {
        if (state == AnimationStatus.completed) {
          _setCustomReset();
          _controller.forward();
        }
      });
  }

  //设置custom动画组件回到起点
  void _setCustomReset() {
    _controller.reset();
    _animation = Tween<double>(begin: MAX_MOVE, end: 0).animate(_curve)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((state) {
        if (state == AnimationStatus.completed) {
          _setCustomStart();
        }
      });
  }

  // implicit动画组件回到起点
  void _implicitReset() {
    setState(() {
      _moveTo = 0;
    });
  }

  // implicit动画组件移动到终点
  void _implicitStart() {
    setState(() {
      _moveTo = MAX_MOVE;
    });
  }

  // 自定义动画
  Widget _customMovingBox() {
    return GestureDetector(
      onTap: () => _controller.forward(),
      child: Container(
        width: 50,
        height: 50,
        color: Colors.blue,
        margin: EdgeInsets.only(left: _animation.value),
      ),
    );
  }

  // implicit 动画组件
  Widget _implicitAnimMovingBox() {
    return GestureDetector(
      onTap: _implicitStart,
      child: AnimatedContainer(
        color: Colors.blue,
        margin: EdgeInsets.only(left: _moveTo),
        width: 50,
        height: 50,
        duration: _duration,
        curve: Curves.easeInSine,
        onEnd: _implicitReset,
      ),
    );
  }

  Widget _buildHero(BuildContext context) {
    return Hero(
      tag: HERO_TAG,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HeroDestPage(),
            ),
          );
        },
        child: SizedBox(
          width: 100,
          height: 60,
          child: Image.asset("images/flutter_bg.png", fit: BoxFit.cover),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("AnimationDemo"),
        ),
        body: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("CustomMovingBox"),
                SizedBox(height: 5),
                _customMovingBox(),
                SizedBox(height: 40),
                Text("AnimatedContainer"),
                SizedBox(height: 5),
                _implicitAnimMovingBox(),
                SizedBox(height: 40),
                Text("HeroAnimation"),
                _buildHero(context),
              ],
            ),
          ),
        ));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

class HeroDestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("HeroDest")),
      body: Align(
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Hero(
              tag: HERO_TAG,
              child: SizedBox(
                width: 300,
                height: 200,
                child: Image.asset("images/flutter_bg.png", fit: BoxFit.cover),
              ),
            ),
            SizedBox(height: 10),
            Text("This is a Hero animation"),
          ],
        ),
      ),
    );
  }
}
