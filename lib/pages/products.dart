import 'package:flutter/material.dart';

import '../components/products/products.dart';
//import '../product_manager.dart';
//import './products_admin.dart';

class ProductsPage extends StatelessWidget {
  final List<Map<String, dynamic>> products;

  ProductsPage(this.products);

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
              leading: Icon(Icons.playlist_add_check),
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
            ListTile(
              leading: Icon(Icons.power_settings_new),
              title: Text('Çıkış'),
              onTap: () => Navigator.pushReplacementNamed(context, '/'),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Ürünler'),
        actions: <Widget>[
          IconButton(
            iconSize: 40.0,
            color: Colors.red,
            icon: Icon(Icons.favorite),
            onPressed: () {},
          ),
          SizedBox(width: 30.0),
        ],
      ),
      body: Column(
        children: [
          Container(
            child: Text(
              'Urunler',
              style: TextStyle(
                //fontWeight: FontWeight.w800,
                fontSize: 80.0,
                fontFamily: 'Monthelo',
              ),
            ),
          ),
          Expanded(
            child: Products(products),
          ),
        ],
      ),
    );
  }
}
