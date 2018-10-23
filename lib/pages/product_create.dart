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
  String _subTitleValue;
  String _description;
  double _priceValue;
  //String _imageUrl;

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWith = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95;
    final double targetPadding = deviceWidth - targetWith;

    return Container(
      margin: EdgeInsets.all(10.0),
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: targetPadding / 2),
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
            autofocus: true,
            decoration: InputDecoration(labelText: 'Product Sub Title'),
            onChanged: (String value) {
              setState(() {
                _subTitleValue = value;
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
                "subTitle": _subTitleValue,
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
