import 'package:flutter/material.dart';

import '../product_manager.dart';
//import './products_admin.dart';

class ProductsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            AppBar(
              automaticallyImplyLeading: false, //başlığın solundaki icon kalkar
              title: Text('Menü'),
            ),
            ListTile(
              title: Text('Ürün Yönetimi'),
              onTap: () {
                // Navigator.pushReplacement(
                //   context,
                //   MaterialPageRoute(
                //     builder: (BuildContext context) => ProductsAdminPage(),
                //   ),
                // );
                Navigator.pushReplacementNamed(context, '/admin');
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Ürünler'),
      ),
      body: ProductManager(),
    );
  }
}
