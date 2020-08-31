import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:location/location.dart';

class LocationInput_new extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _locationInputState();
}

class _locationInputState extends State<LocationInput_new>{

  Map<String,double> currentLocation = new Map();
  StreamSubscription <Map<String,double>> locationSubscription;

  Location location = new Location();

  String error;


  @override
  void initState() {
    super.initState();

    currentLocation['latitude']=0.0;
    currentLocation['longitude']=0.0;

    initPlatformState();
    
    //locationSubscription = location.onLocationChanged().listen();

    
    
    



  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }

  void initPlatformState() {}
}