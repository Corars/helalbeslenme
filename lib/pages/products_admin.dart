import 'package:flutter/material.dart';

//import './products.dart';
import './product_create.dart';
import './product_list.dart';

class ProductsAdminPage extends StatelessWidget {
  final Function addProduct;
  final Function deleteProduct;

  ProductsAdminPage(this.addProduct, this.deleteProduct);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          drawer: Drawer(
            child: Column(
              children: <Widget>[
                AppBar(
                  automaticallyImplyLeading:
                      false, //başlığın solundaki icon kalkar
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
          ),
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
              ProductCreatePage(addProduct),
              ProductListPage(),
            ],
          )),
    );
  }
}
