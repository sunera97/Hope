import 'package:flutter/material.dart'; // entering the flutter framework
import 'package:flutter/widgets.dart'; // import the widgest
// default libs
class DonationPage extends StatelessWidget{
  //create a donation class and extend it as a state less which means no changes on the page
  //@override //this method run according to ealier parameters
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;// predefined method in flutter automatically detect the device display size
    final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95; //set the parameters less than the deice size
    // TODO: implement build
    return Scaffold(
      // whole screen size
      appBar: AppBar(
        title: Text('Donations'),// name of the page

      ),
      body: Container(
        padding: EdgeInsets.only(top: 20, right: 20, left: 20), //parameters of the container
        child: ListView(
          padding: EdgeInsets.all(0.8), // parameters of the child inside the edge
          children: <Widget>[
            Container( //
              child: Row(
                children: <Widget>[
                  Text("BANKS", textAlign: TextAlign.center,style: TextStyle(fontSize: 25,fontStyle: FontStyle.normal),),
                ],
              ),
            ),
            Container(// image container
              width: targetWidth, // same width and height as the scafold
              height: deviceWidth,

              decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage("Assets/bankpic.jpg"),fit: BoxFit.fill),
                  ),


            ),
                ],

              ),
            ),



        );

  }
}