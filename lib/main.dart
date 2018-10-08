import 'package:flutter/material.dart';

import './pages/auth.dart';
import './pages/products_admin.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.blueAccent[100],
        primarySwatch: Colors.deepOrange,
        accentColor: Colors.deepPurple,
      ),
      //home: AuthPage(), eğer routes kullanılır ve '/' eklenirse bununla aynı şey oluyor ikisi birlikte kullanılamaz.
      routes: {
        '/': (BuildContext context) => AuthPage(),
        '/admin': (BuildContext context) => ProductsAdminPage(),
      },
      onGenerateRoute: (RouteSettings settings){
        return MaterialPageRoute(builder: (BuildContext context) {
          
        });
      },
    );
  }
}
