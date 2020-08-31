import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';



//no need to Stateful but insert it
class Abtus extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new AboutUs_page();
  }
}

class AboutUs_page extends  State<Abtus>{

  @override
  Widget build(BuildContext context) {

    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95;
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
        title: Text('About Us'),//tabName
        backgroundColor: Colors.purple[700]
    ),
    body:/* Container(
      padding: EdgeInsets.only(top: 10, right: 20, left: 20),
      child: ListView(
        padding: EdgeInsets.all(0.8),
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                Text("Who are we....", textAlign: TextAlign.center,style: TextStyle(fontSize: 25,fontStyle: FontStyle.normal),),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10,bottom: 10),
            child: Row(
              children: <Widget>[
                Text("WANA is a application while is solely created to reduce \ndeforestation in the country. Deforestation can involve\nconversion of forest land to farms, ranches, or urban\nuse. The most concentrated deforestation occurs in\ntropical rainforests. About 31% of Earth's land surface\nis covered by forests. The removal of trees without\nsufficient reforestation has resulted in habitat damage,\nbiodiversity loss, and aridity. It has adverse impacts\non biosequestration of atmospheric carbon dioxide.\nSo our mission is to prevent people from deforestation\nand encourage them to preserve trees and engage\nin reforestation.", textAlign: TextAlign.center, style: TextStyle(fontSize: 15,fontStyle: FontStyle.normal),),
              ],
            ),
          ),
          Divider(indent: 1.0),
          /*Container(
            child: Row(
              children: <Widget>[
                Text("Our Team", textAlign: TextAlign.center,style: TextStyle(fontSize: 25,fontStyle: FontStyle.normal),),
              ],
            ),
          ),*/*/
          Container(
            width: targetWidth,
            height: 770,
            padding: EdgeInsets.only(top: 10,bottom: 10),
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("Assets/aboutus Tree.png")),
            ),
          ),
        //],
     // ),
   // ),



    );


  }

}