import 'package:flutter/material.dart';

class ProductCreatePage extends StatefulWidget {
  final Function addProduct;

  ProductCreatePage(this.addProduct);

  @override
  State<StatefulWidget> createState() {
    return _ProductCreateState();
  }
}

class _ProductCreateState extends State<ProductCreatePage> {
  String _titleValue;
  String _description;
  double _priceValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: ListView(
        children: <Widget>[
          TextField(
            autofocus: true,
            decoration: InputDecoration(labelText: 'Product Title'),
            onChanged: (String value) {
              setState(() {
                _titleValue = value;
              });
            },
          ),
          TextField(
            maxLines: 4,
            decoration: InputDecoration(labelText: 'Product Description'),
            onChanged: (String value) {
              setState(() {
                _description = value;
              });
            },
          ),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Product Price'),
            onChanged: (String value) {
              setState(() {
                _priceValue = double.parse(value);
              });
            },
          ),
          SizedBox(
            height: 10.0,
          ),
          RaisedButton(
            color: Theme.of(context).accentColor,
            textColor: Colors.white,
            child: Text('Kaydet'),
            onPressed: () {
              final Map<String, dynamic> product = {
                "title": _titleValue,
                "description": _description,
                "price": _priceValue,
                "image": "assets/images/helal.png"
              };
              widget.addProduct(product);
              Navigator.pushReplacementNamed(context, '/products');
            },
          )
        ],
      ),

      // Center(
      //   child: RaisedButton(
      //     child: Text('Kaydet'),
      //     onPressed: () {
      //       showModalBottomSheet(
      //           context: context,
      //           builder: (BuildContext context) {
      //             return Center(
      //               child: Text('Ürün Oluştu'),
      //             );
      //           });
      //     },
      //   ),
      // ),
    );
  }
}
