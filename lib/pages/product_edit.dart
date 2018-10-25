import 'package:flutter/material.dart';

class ProductEditPage extends StatefulWidget {
  final Function addProduct;
  final Function updateProduct;
  final Map<String, dynamic> product;
  final int productIndex;

  ProductEditPage(
      {this.addProduct, this.updateProduct, this.product, this.productIndex});

  @override
  State<StatefulWidget> createState() {
    return _ProductEditState();
  }
}

class _ProductEditState extends State<ProductEditPage> {
  Map<String, dynamic> _formData = {
    'title': null,
    'subTitle': null,
    'description': null,
    'price': null,
    'image': 'assets/images/helal.png',
  };

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildTitleTextField() {
    return TextFormField(
      autofocus: true,
      decoration: InputDecoration(labelText: 'Product Title'),
      //autovalidate: true,
      validator: (String value) {
        if (value.isEmpty) return 'Ürün başlığı gerekli';
      },
      initialValue: widget.product == null ? '' : widget.product['title'],
      onSaved: (String value) {
        _formData['title'] = value;
      },
    );
  }

  Widget _buildSubTitleTextField() {
    return TextFormField(
      autofocus: true,
      decoration: InputDecoration(labelText: 'Product Sub Title'),
      initialValue: widget.product == null ? '' : widget.product['subTitle'],
      onSaved: (String value) {
        _formData['subTitle'] = value;
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
      initialValue: widget.product == null ? '' : widget.product['description'],
      onSaved: (String value) {
        _formData['description'] = value;
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
      initialValue:
          widget.product == null ? '' : widget.product['price'].toString(),
      onSaved: (String value) {
        _formData['price'] = double.parse(value);
      },
    );
  }

  void _submitForm() {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    if (widget.product == null) {
      widget.addProduct(_formData);
    } else {
      widget.updateProduct(widget.productIndex, _formData);
    }
    Navigator.pushReplacementNamed(context, '/products');
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWith = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95;
    final double targetPadding = deviceWidth - targetWith;
    final Widget pageContent = GestureDetector(
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
      ),
    );

    if (widget.product == null) {
      return pageContent;
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text('Edit Product'),
        ),
        body: pageContent,
      );
    }
  }
}
