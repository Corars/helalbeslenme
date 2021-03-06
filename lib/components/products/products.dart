import 'package:flutter/material.dart';

import './product_card.dart';

/// Ürünlerin listesi olması için eklendi aynı zamanda sınıf dokümantasyonu için.
/// Örnek Kod:
/// ```dart
///     Products(
///       List<Map<String, String>> products,
///       Function deleteProduct,
///     )
/// ```
class Products extends StatelessWidget {
  final List<Map<String, dynamic>> products;

  Products(this.products);

  Widget _buildProductList() {
    Widget productCard;
    if (products.length > 0) {
      productCard = ListView.builder(
        itemBuilder: (BuildContext context, int index) =>
            ProductCard(products[index], index),
        itemCount: products.length,
      );
    } else {
      productCard = Center(
        child: Text('Hiç ürün yok biraz ekleyin !'),
      );
      //productCard = Container(); //eğer null göndermek istemezsek boş bir container gönderilebilir.
    }
    return productCard;
  }

  @override
  Widget build(BuildContext context) {
    return _buildProductList();
  }
}
