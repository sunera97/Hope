import 'package:flutter/material.dart';

import './price_tag.dart';
import './address_tag.dart';
import '../ui_elements/title_default.dart';
import '../../models/news.dart';
import 'package:The_Hope/scoped-models/conected_news.dart';
import 'package:The_Hope/scoped-models/main.dart';
import 'package:scoped_model/scoped_model.dart';

class ProductCard extends StatelessWidget {
  final News product; // import from news model
  final int productIndex; // index


  ProductCard(this.product,this.productIndex); //constructor of the product card

  Widget _buildTitleStatusRow() {
    return Container(
      padding: EdgeInsets.only(top: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TitleDefault(product.title),
          SizedBox(
            width: 8.0,
          ),
          PriceTag(product.status.toString())
        ],
      ),
    );
  }

  //heart icon and other whatever
  Widget _buildActionButtons(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
        return ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              // info button
              IconButton(
                icon: Icon(Icons.info),
                color: Theme.of(context).accentColor,
                onPressed: () => Navigator
                    .pushNamed<bool>(context,
                    '/product/' + model.allproducts[productIndex].id),
              ),
              //heart button
              IconButton(
                icon: Icon(model.allproducts[productIndex].isFavorite
                    ? Icons.favorite
                    : Icons.favorite_border),
                color: Colors.red,
                onPressed: () {
                  model.selectProduct(model.allproducts[productIndex].id);
                  model.toggleProductFavoriteStatus();
                },
              ),
            ]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          FadeInImage( //the image the appers before loading the image
            image: NetworkImage(product.image),
            height: 300.0,
            fit: BoxFit.cover,
            placeholder: AssetImage('Assets/back.jpg'),//loading image
          ),
          _buildTitleStatusRow(),
          SizedBox(
            height: 8.0, //gap between defo and adress
          ),
          AddressTag(product.location.address), // need attention
          SizedBox(
            height: 8.0,
          ),
          Text(product.userEmail),
          _buildActionButtons(context)
        ],
      ),
    );

  }
}
