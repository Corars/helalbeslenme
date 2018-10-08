import 'dart:async';

import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  final String title;
  final String imageUrl;

  ProductPage(this.title, this.imageUrl);

  _showWarningdialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Emin misiniz?'),
          content: Text('Bu işlem geri alınmaaz !'),
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
                child: Text(title),
                padding: EdgeInsets.all(10.0),
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
