import 'package:flutter/material.dart';

import '../../models/location_data.dart';
import '../helpers/ensure_visible.dart';
import './loc_call.dart';



class LocationCall extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _locCallState();
  }
}

class _locCallState extends State<LocationCall>{


  final FocusNode _addressInputFocusNode = FocusNode();
  final TextEditingController _addressInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Column(
      children: <Widget>[
        EnsureVisibleWhenFocused(
          focusNode: _addressInputFocusNode,
          child: TextFormField(
            focusNode: _addressInputFocusNode,
            controller: _addressInputController,

            /*validator: (String value){
              if(_locationData == null || value.isEmpty){
                return 'No valid location found';
              }
            },*/
            decoration: InputDecoration(labelText: 'Address'),
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        FlatButton(
          child: Text('Locate User'),
          onPressed: (){},
        ),
        SizedBox(
          height: 10.0,
        ),




      ],
    );
  }
}



