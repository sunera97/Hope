import 'package:flutter/material.dart';

class PriceTag extends StatelessWidget {
  final String status;

  PriceTag(this.status);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.5),
      decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(5.0)),
      child: Text(
        status,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
