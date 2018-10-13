import 'dart:async';

import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  final String title;
  final String subTitle;
  final String description;
  final double price;
  final String imageUrl;

  ProductPage(
      this.title, this.subTitle, this.description, this.price, this.imageUrl);

  _showWarningdialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Emin misiniz?'),
          content: Text('Bu işlem geri alınamaz !'),
          actions: <Widget>[
            FlatButton(
              child: Text('Evet Sil'),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context, true);
              },
            ),
            FlatButton(
              child: Text('İptal'),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context, false);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(imageUrl),
              Container(
                child: Text(
                  title,
                  style: TextStyle(fontSize: 30.0),
                ),
                padding: EdgeInsets.all(10.0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    subTitle,
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Text(
                    ' | ',
                    style: TextStyle(color: Colors.grey, fontSize: 25.0),
                  ),
                  Text(
                    '₺' + price.toString(),
                    style: TextStyle(fontSize: 20.0),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 5.0),
                child: Text(
                  description,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontFamily: 'Sans',
                    fontSize: 20.0,
                  ),
                ),
              ),
              Container(
                child: RaisedButton(
                  color: Colors.red,
                  textTheme: ButtonTextTheme.primary,
                  child: Text('Sil'),
                  onPressed: () {
                    //Navigator.pop(context, true);
                    _showWarningdialog(context);
                  },
                ),
                padding: EdgeInsets.all(10.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
