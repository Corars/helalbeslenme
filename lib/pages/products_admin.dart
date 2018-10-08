import 'package:flutter/material.dart';

//import './products.dart';
import './product_create.dart';
import './product_list.dart';

class ProductsAdminPage extends StatelessWidget {
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
                  title: Text('Tüm Ürünler'),
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/');
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
                icon: Icon(Icons.add),
              ),
              Tab(
                text: 'Ürünlerim',
                icon: Icon(Icons.apps),
              ),
            ]),
          ),
          body: TabBarView(
            children: <Widget>[
              ProductCreatePage(),
              ProductListPage(),
            ],
          )),
    );
  }
}
