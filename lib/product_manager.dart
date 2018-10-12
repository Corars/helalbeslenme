import 'package:flutter/material.dart';

import './products.dart';

class ProductManager extends StatelessWidget {
//   final Map startingProduct;

//   ProductManager({this.startingProduct});

//   @override
//   State<StatefulWidget> createState() {
//     return _ProductManagerState();
//   }
// }

// class _ProductManagerState extends State<ProductManager> {
//   List<Map<String, String>> _products = [];

//   @override
//   void initState() {
//     super.initState();
//     if (widget.startingProduct != null) {
//       _products.add(widget.startingProduct);
//     }
//   }

//   @override
//   void didUpdateWidget(ProductManager oldWidget) {
//     print('Product Manager güncellendi');
//     super.didUpdateWidget(oldWidget);
//   }

  // void _addProduct(Map<String, String> product) {
  //   setState(() {
  //     _products.add(product);
  //   });
  // }

  // void _deleteProduct(int index) {
  //   setState(() {
  //     _products.removeAt(index);
  //   });
  // }

  final List<Map<String, dynamic>> products;

  ///bunları veriyoruz çünkü [Products] bunu istiyor.
  ProductManager(this.products);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(),
        Expanded(child: Products(products)),
      ],
    );
  }
}
