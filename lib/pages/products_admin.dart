import 'package:flutter/material.dart';

//import './products.dart';
import './product_edit.dart';
import './product_list.dart';

class ProductsAdminPage extends StatelessWidget {
  final Function addProduct;
  final Function deleteProduct;
  final Function updateProduct;
  final List<Map<String, dynamic>> products;

  ProductsAdminPage(
      this.addProduct, this.updateProduct, this.deleteProduct, this.products);

  Widget _buildSideDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            automaticallyImplyLeading: false, //başlığın solundaki icon kalkar
            title: Text('Menü'),
          ),
          ListTile(
            leading: Icon(Icons.apps),
            title: Text('Tüm Ürünler'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/products');
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          drawer: _buildSideDrawer(context),
          appBar: AppBar(
            title: Text('Ürün Yönetimi'),
            bottom: TabBar(tabs: <Widget>[
              Tab(
                text: 'Ürün Oluştur',
                icon: Icon(Icons.add_box),
              ),
              Tab(
                text: 'Ürünlerim',
                icon: Icon(Icons.shopping_basket),
              ),
            ]),
          ),
          body: TabBarView(
            children: <Widget>[
              ProductEditPage(addProduct: addProduct),
              ProductListPage(products, updateProduct),
            ],
          )),
    );
  }
}
