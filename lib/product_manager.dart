import 'package:flutter/material.dart';

import './products.dart';

class ProductManager extends StatefulWidget {
  final String startingProduct;

  ProductManager({this.startingProduct = 'ilk değer'});

  @override
  State<StatefulWidget> createState() {
    return _ProductManagerState();
  }
}

class _ProductManagerState extends State<ProductManager> {
  List<String> _products = [];

  @override
  void initState() {
    super.initState();
    _products.add(widget.startingProduct);
  }

  @override
    void didUpdateWidget(ProductManager oldWidget) {
      print('Product Manager güncellendi');
      super.didUpdateWidget(oldWidget);
    }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(10.0),
          child: RaisedButton(
            onPressed: () {
              setState(() {
                //_products.clear();
                _products.add('Yemekler');
                //print(_products);
              });
            },
            child: Text('Tıkla'),
          ),
        ),
        Products(_products),
      ],
    );
  }
}
