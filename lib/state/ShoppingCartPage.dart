import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'CartState.dart';

class ShoppingCart extends StatelessWidget {
  Future init() async{

  }
  Widget _buildItem(BuildContext context, int i) {
    final cartState = Provider.of<CartState>(context);
    final product = cartState.products[i];
    return ListTile(
      leading: Image.network(product.imgUrl),
      title: Text(product.name, style: TextStyle(fontSize: 18)),
      subtitle: Text(
        "￥${product.price}",
        style: TextStyle(color: Colors.red),
      ),
      trailing: FlatButton(
        color: Colors.blue,
        textColor: Colors.white,
        child: Text("remove"),
        onPressed: () => cartState.remove(product),
      ),
    );
  }

  void test() async{
    var res =await Dio().request(path);
  }

  @override
  Widget build(BuildContext context) {
    final cartState = Provider.of<CartState>(context);
    return Scaffold(
      appBar: AppBar(title: Text("Shopping Cart")),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            FutureBuilder(
              future: init(),
              child: Expanded(
                child: ListView.separated(
                  itemCount: cartState.count,
                  separatorBuilder: (context, index) => Divider(),
                  itemBuilder: _buildItem,
                ),
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: "总价: ",
                          style: TextStyle(fontSize: 20, color: Colors.black87),
                        ),
                        TextSpan(
                          text: "￥${cartState.totalPrice}",
                          style: TextStyle(fontSize: 22, color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                  FlatButton(
                    color: Colors.blue,
                    disabledColor: Colors.grey,
                    disabledTextColor: Colors.white,
                    textColor: Colors.white,
                    child: Text("Pay"),
                    onPressed: cartState.totalPrice == 0 ? null : () {},
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
