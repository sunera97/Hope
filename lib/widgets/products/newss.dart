import 'package:flutter/material.dart';

import 'package:scoped_model/scoped_model.dart';

import './news_card.dart';
import '../../models/news.dart';
import 'package:The_Hope/scoped-models/main.dart';

class Products extends StatelessWidget {
  Widget _buildProductList(List<News> products) {
    Widget productCards;
    if (products.length > 0) {
      productCards = ListView.builder(
        itemBuilder: (BuildContext context, int index) =>
            ProductCard(products[index],index),
        itemCount: products.length,
      );
    } else {
      productCards = Container();
    }
    return productCards;

  }

  @override
  Widget build(BuildContext context) {
    print('[Products Widget] build()');
    return ScopedModelDescendant<MainModel>(builder: (BuildContext context, Widget child, MainModel model) {
      return  _buildProductList(model.displayedProducts);
    },);
  }
}
