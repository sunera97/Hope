import 'package:flutter/material.dart';

import 'package:scoped_model/scoped_model.dart';

import './notification_card.dart';
import '../../../models/news.dart';
import 'package:The_Hope/scoped-models/main.dart';

class Notifications extends StatelessWidget {
  Widget _buildNotificationsList(List<News> products) {
    Widget notifiCard;
    if (products.length > 0) {//checking the number of products<=news
      notifiCard = Stack(children: <Widget>[//creating a stack where the latest notification comes to the top
      ListView.builder(//creating a list for the notifications
      itemBuilder: (BuildContext context, int index) =>
          NotificationCard(products[index], index),//passing the content from the products with respect to the index number
    itemCount: products.length,//number of notifications==number of products
    )
      ],);
    } else {
      notifiCard = Container();//if no products are included in the news tab no notifications
    }
    return notifiCard;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model) { //first method in all products main model
      return _buildNotificationsList(model.allproducts);
    });
  }
}
