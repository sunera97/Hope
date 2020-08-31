import 'dart:async';

import 'package:location/location.dart';
import '../../models/location_data.dart';




/*
class LocationService{

  LocationData_user _currentLocation;  // Keep track of current Location
  Location location = new Location();

  StreamController<LocationData_user> _locationController =
  StreamController<LocationData_user>.broadcast();


  LocationService(){
    location.requestPermission().then((granted){
      if(granted){
        location.onLocationChanged().listen((locationData){
          if(locationData != null){
            _locationController.add(LocationData_user(
              latitude: locationData.latitude,
              longitude: locationData.longitude,

            ));
          }
        });
      }
    });
  }

  Stream<LocationData_user> get locationStream => _locationController.stream;
  Future<LocationData_user> getLocation() async {
    try {
      var userLocation = await location.getLocation();
      _currentLocation = LocationData_user(
        latitude: userLocation.latitude,
        longitude: userLocation.longitude,
      );
    } catch (e) {
      print('Could not get the location: $e');
    }

    return _currentLocation;
  }





}*/
