import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:presentation/state/Product.dart';

class CartState with ChangeNotifier {
  final Map<int, Product> _products = {};

  // 购物车中所有商品（不可变列表）
  UnmodifiableListView<Product> get products =>
      UnmodifiableListView(_products.values);

  // 计算购物车商品总价
  double get totalPrice => _products.values.fold(0, (sum, p) => sum + p.price);

  // 购物车商品数量
  int get count => _products.length;

  // 购物车中是否有此商品
  bool isContain(Product product) {
    return _products.containsKey(product.id);
  }

  // 向购物车中添加商品
  void add(Product p) {
    if (isContain(p)) {
      return;
    }
    _products[p.id] = p;
    // 通知所有相关组件更新数据
    notifyListeners();
  }

  // 删除购物车中商品
  void remove(Product p) {
    _products.remove(p.id);
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    print("CartState dispose called");
  }
}
