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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildTitleTextField() {
    return TextFormField(
      autofocus: true,
      decoration: InputDecoration(labelText: 'Product Title'),
      //autovalidate: true,
      validator: (String value) {
        if (value.isEmpty) return 'Ürün başlığı gerekli';
      },
      onSaved: (String value) {
        setState(() {
          _titleValue = value;
        });
      },
    );
  }

  Widget _buildSubTitleTextField() {
    return TextFormField(
      autofocus: true,
      decoration: InputDecoration(labelText: 'Product Sub Title'),
      onSaved: (String value) {
        setState(() {
          _subTitleValue = value;
        });
      },
    );
  }

  Widget _buildDescriptionTextField() {
    return TextFormField(
      maxLines: 4,
      decoration: InputDecoration(labelText: 'Product Description'),
      validator: (String value) {
        if (value.length < 10) {
          return 'En az 10 karakter olmalı';
        }
      },
      onSaved: (String value) {
        setState(() {
          _description = value;
        });
      },
    );
  }

  Widget _buildPriceTextField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: 'Product Price'),
      validator: (String value) {
        if (!RegExp(r'^([1-9]\d*(\.)\d*|0?(\.)\d*[1-9]\d*|[1-9]\d*)$')
            .hasMatch(value)) {
          return 'Sayı giriniz';
        }
      },
      onSaved: (String value) {
        setState(() {
          _priceValue = double.parse(value);
        });
      },
    );
  }

  void _submitForm() {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    final Map<String, dynamic> product = {
      "title": _titleValue,
      "subTitle": _subTitleValue,
      "description": _description,
      "price": _priceValue,
      "image": "assets/images/helal.png"
    };
    widget.addProduct(product);
    Navigator.pushReplacementNamed(context, '/products');
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWith = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95;
    final double targetPadding = deviceWidth - targetWith;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context)
            .requestFocus(FocusNode()); //klavyeyi kapatmak için
      },
      child: Container(
        margin: EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: targetPadding / 2),
            children: <Widget>[
              _buildTitleTextField(),
              _buildSubTitleTextField(),
              _buildDescriptionTextField(),
              _buildPriceTextField(),
              SizedBox(
                height: 10.0,
              ),
              RaisedButton(
                color: Theme.of(context).accentColor,
                textColor: Colors.white,
                child: Text('Kaydet'),
                onPressed: _submitForm,
              )
            ],
          ),
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
      ),
    );
  }
}
