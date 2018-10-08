import 'package:flutter/material.dart';
//import './pages/product.dart';

/// Ürünlerin listesi olması için eklendi aynı zamanda sınıf dokümantasyonu için.
/// Örnek Kod:
/// ```dart
///     Products(
///       List<Map<String, String>> products,
///       Function deleteProduct,
///     )
/// ```
class Products extends StatelessWidget {
  final List<Map<String, String>> products;
  final Function deleteProduct;

  Products(this.products, this.deleteProduct);

  Widget _buildProduct(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(products[index]['image']),
          Text(products[index]['title']),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                color: Colors.blue,
                textColor: Colors.white,
                child: Text('Detay'),
                onPressed: () => Navigator.pushNamed<bool>(
                      context, '/product/' + index.toString(),
                      // MaterialPageRoute(
                      //   builder: (BuildContext context) => ProductPage(
                      //       products[index]['title'], products[index]['image']),
                      // ),
                    ).then((bool value) {
                      if (value) {
                        deleteProduct(index);
                      }
                    }),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildProductList() {
    Widget productCard;
    if (products.length > 0) {
      productCard = ListView.builder(
        itemBuilder: _buildProduct,
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
