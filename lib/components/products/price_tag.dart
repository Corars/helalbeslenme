import 'package:flutter/material.dart';

class PriceTag extends StatelessWidget {
  final double value;

  PriceTag(this.value);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(10.0),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Text(
        '₺ ${value.toString()}', //dolar işaret için \$
        style: TextStyle(
          fontFamily: 'Oswald',
          fontSize: 20.0,
          color: Colors.white,
        ),
      ),
    );
  }
}
