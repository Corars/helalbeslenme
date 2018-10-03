import 'package:flutter/material.dart';

class ProductControl extends StatelessWidget {
  final Function addProduct;

  ProductControl(this.addProduct);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RaisedButton(
      onPressed: () {
        addProduct({'title': 'Çikolata', 'image': 'assets/images/helal.png'});
      },
      child: Text('Yeni Ekle'),
    );
  }
}
