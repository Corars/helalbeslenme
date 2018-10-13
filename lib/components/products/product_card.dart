import 'package:flutter/material.dart';

import './price_tag.dart';

class ProductCard extends StatelessWidget {
  final Map<String, dynamic> product;
  final int index;

  ProductCard(this.product, this.index);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(product['image']),
          Container(
            //color: Colors.red,
            padding: EdgeInsets.all(10.0), //.only(top: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  product['title'],
                  style: TextStyle(
                    //fontWeight: FontWeight.w800,
                    fontSize: 30.0,
                    fontFamily: 'Oswald',
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                PriceTag(product['price']),
              ],
            ),
          ),
          DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(width: 1.0, color: Colors.grey),
              color: Colors.yellow[100],
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
              child: Text(
                product['subTitle'],
              ),
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                color: Colors.blue,
                textColor: Colors.white,
                child: Row(
                  children: <Widget>[
                    Icon(Icons.info),
                    SizedBox(width: 5.0),
                    Text('Detay'),
                  ],
                ),
                onPressed: () => Navigator.pushNamed<bool>(
                      context,
                      '/product/' + index.toString(),
                      // MaterialPageRoute(
                      //   builder: (BuildContext context) => ProductPage(
                      //       products[index]['title'], products[index]['image']),
                      // ),
                    ),
              ),
              IconButton(
                icon: Icon(Icons.favorite_border),
                color: Colors.red,
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
    );
  }
}
