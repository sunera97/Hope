import 'package:flutter/material.dart';

import 'package:scoped_model/scoped_model.dart';

import '../../scoped-models/main.dart';

class LogoutListTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder:(BuildContext context, Widget child, MainModel model){
        return ListTile(
          leading: Icon(Icons.exit_to_app, color: Colors.purple[800],),
          title: Text('LogOut', style: TextStyle(fontSize: 17,fontStyle: FontStyle.normal, color: Colors.purple[800],),),
          onTap: (){ 
            model.logout();
            
          },
        );


      }
    );
  }
}