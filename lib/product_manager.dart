import 'package:flutter/material.dart';

import './products.dart';
import './product_control.dart';

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

  final List<Map<String, String>> products;
  final Function addProduct;
  final Function deleteProduct;

  ProductManager(this.products, this.addProduct, this.deleteProduct);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(10.0),
          child: ProductControl(addProduct),
        ),
        Expanded(
            child: Products(
          products,
          deleteProduct,
        )),
      ],
    );
  }
}
