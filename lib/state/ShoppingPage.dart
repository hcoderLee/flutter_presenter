import 'package:flutter/material.dart';
import 'package:presentation/state/Product.dart';
import 'package:provider/provider.dart';

import 'CartState.dart';
import 'ShoppingCartPage.dart';

class ShoppingPage extends StatelessWidget {
  List<Product> _allProducts;

  ShoppingPage() {
    _allProducts = mockProducts();
  }

  void _gotoShoppingCart(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ShoppingCart()),
    );
  }

  @override
  Widget build(BuildContext context) {
    int count = Provider.of<CartState>(context).count;
    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping"),
        actions: <Widget>[
          IconButton(
            icon: Badge(count: count, child: Icon(Icons.shopping_cart)),
            onPressed: () => this._gotoShoppingCart(context),
          ),
        ],
      ),
      body: SafeArea(
        child: GridView.builder(
          padding: EdgeInsets.all(2.5),
          itemCount: _allProducts.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 2.5,
            crossAxisSpacing: 2.5,
            childAspectRatio: 0.7,
          ),
          itemBuilder: (context, i) => ProductItem(product: _allProducts[i]),
        ),
      ),
    );
  }
}

class ProductItem extends StatefulWidget {
  final Product product;

  const ProductItem({Key key, this.product}) : super(key: key);

  @override
  _ProductItemState createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  CartState _cartState;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didUpdateWidget(ProductItem oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  void _flipCartState() {
    if (_cartState.isContain(widget.product)) {
      _cartState.remove(widget.product);
    } else {
      _cartState.add(widget.product);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_cartState == null) {
      _cartState = Provider.of<CartState>(context);
    }

    IconData _getCartIcon() {
      bool _isInCart = _cartState.isContain(widget.product);
      return _isInCart ? Icons.remove_shopping_cart : Icons.add_shopping_cart;
    }

    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Image.network(widget.product.imgUrl, fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Text(widget.product.name),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(
                    "￥${widget.product.price}",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                IconButton(
                  icon: Icon(_getCartIcon()),
                  onPressed: () => this._flipCartState(),
                ),
              ],
            )
          ],
        ));
  }
}

class Badge extends StatelessWidget {
  final Widget child;
  final int count;

  const Badge({
    Key key,
    @required this.child,
    this.count = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(5),
          child: child,
        ),
        if (count > 0)
          Positioned(
            right: 0,
            top: 0,
            child: Container(
              alignment: Alignment.center,
              width: 15,
              height: 15,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: Colors.red),
              child: Text(
                count.toString(),
                style: TextStyle(color: Colors.white, fontSize: 10),
              ),
            ),
          )
      ],
    );
  }
}
