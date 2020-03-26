// 变量，默认值为null
// Numbers
import 'dart:io';

import 'package:flutter/cupertino.dart';

void dart_demo() {
  int i1;
  double d1 = 0.0;

//模板字符串
  String s = "String${i1}";

  List<int> li = [];
  li.add(0);
  li.remove(0);

// 自动类型推断
  var a1 = 0;

// ----------const, final部分------------
// c1为常量不可修改
  const c1 = [1];
// c2中的值为常亮(数组[1])不可改变，但c2可重新赋值
  var c2 = const [1];

  //级联操作符
  DartTest(0, 1)
    ..a = 0
    ..c = 1
    ..fly();

  funcTest(0, b: 1);
}

// typedef
typedef int Compare(int a, int b);

Compare cmp = (int a, int b) => a > b ? 1 : 0;

// 可选参数
void funcTest(int a, {@required int b, int c = 0}) {}

// 异步方法
void asyncFuc() async {

  await sleep(Duration(seconds: 3));

}

class DartTest with Fly {
  // 私有
  int _a;

  // 公有
  int b;
  int c;

  // getter
  int get a => _a;

  // setter
  void set a(i) => _a = i;

  DartTest(this._a, this.b);
//  等同于
//  DartTest(int a, int b) {
//    this._a = a;
//    this._b = b;
//  }

}

mixin Fly on DartTest{
  void fly() {

  }
}
