import 'package:flutter/material.dart';

import './products.dart';

class ProductsAdminPage extends StatelessWidget {
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
              title: Text('Tüm Ürünler'),
              onTap: () {
                Navigator.pushReplacement(
                  context, 
                  MaterialPageRoute(
                    builder: (BuildContext context) => ProductsPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Ürün Yönetimi'),
      ),
      body: Center(
        child: Text('içeriği düzenle'),  
      ),
    );
  }
}
