import 'package:flutter/material.dart';

import '../../../models/news.dart';
import 'package:The_Hope/scoped-models/main.dart';
import 'package:scoped_model/scoped_model.dart';
//the main card for notifications
class NotificationCard extends StatelessWidget {
  final News notifi;
  final int notifiIndex;

  NotificationCard(this.notifi, this.notifiIndex);
 //if the called method is prev used we  override the code by using @override
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(

      child: Column(//column-wise catogarization of the notification content
        children: <Widget>[
          ListTile(//inbuilt parameter
            leading: Icon(Icons.warning,color: Colors.red,),//icon in the notification
            title: Text("Alert" ,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),//main text of the notification
            subtitle: Text(notifi.userEmail + " is Add a post, Check it", //the subtext of the notification where it shows the email of the poster
             ),
          ),



        ],
      ),
    );
  }
}
