import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';

import './pages/auth.dart';
import './pages/products_admin.dart';
import './pages/products.dart';
import './pages/product.dart';
import './pages/learning.dart';

void main() {
  // debugPaintSizeEnabled = true; //tasarımları debug modda gösterir oklar genişlikler falan.
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  List<Map<String, dynamic>> _products = [
    {
      'title': 'Adana Karpuzu',
      'subTitle': 'Yeşil renkli, içi kırmızı tatlı bir meyve.',
      'description':
          'Kansere karşı en etkili maddelerden olan likopen en çok domateste var sanılsa da aslında karpuzda domatesten çok daha fazla likopen vardır. 1776\'da Amerika\'da çıkan ilk yemek kitabında karpuz kabuğu turşusu tarifine yer verilmiştir.',
      'price': 25.56,
      'image': 'assets/images/adana_karpuzu.jpg'
    },
  ];
  //Map<String, dynamic> _user = {};
  void _addProduct(Map<String, dynamic> product) {
    setState(() {
      _products.add(product);
    });
  }

  void _deleteProduct(int index) {
    setState(() {
      _products.removeAt(index);
    });
  }

  void _updateProduct(int index, Map<String, dynamic> product) {
    setState(() {
      _products[index] = product;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Oswald',
        brightness: Brightness.light,
        primaryColor: Colors.blueAccent[100],
        primarySwatch: Colors.deepOrange,
        accentColor: Colors.deepPurple,
      ),
      //home: AuthPage(), eğer routes kullanılır ve '/' eklenirse bununla aynı şey oluyor ikisi birlikte kullanılamaz.
      routes: {
        '/': (BuildContext context) => AuthPage(),
        '/products': (BuildContext context) => ProductsPage(_products),
        '/admin': (BuildContext context) => ProductsAdminPage(
            _addProduct, _updateProduct, _deleteProduct, _products),
        '/learn': (BuildContext context) => LearnPage(),
      },
      onGenerateRoute: (RouteSettings settings) {
        final List<String> pathElements =
            settings.name.split('/'); // "/product/1"

        if (pathElements[0] != '') {
          return null;
        }

        if (pathElements[1] == 'product') {
          final int index = int.parse(pathElements[2]); // "/product/3255"
          return MaterialPageRoute<bool>(
            builder: (BuildContext context) => ProductPage(
                  _products[index]['title'],
                  _products[index]['subTitle'],
                  _products[index]['description'],
                  _products[index]['price'],
                  _products[index]['image'],
                ),
          );
        }

        return null; //eğer parametresi yada yolu yanlış birşey gelirse null döndürecek
      },
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          builder: (BuildContext context) => ProductsPage(_products),
        );
      },
    );
  }
}
