import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ürün Detayı'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/images/helal.png'),
            Container(
              child: Text('Ürün detay sayfası'),
              padding: EdgeInsets.all(10.0),
            ),
            Container(
              child: RaisedButton(
                child: Text('Geri'),
                onPressed: () => Navigator.pop(context),
              ),
              padding: EdgeInsets.all(10.0),
            ),
          ],
        ),
      ),
    );
  }
}
