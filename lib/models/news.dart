import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import './location_data.dart';


//userClass
class News {
  final String id;
  final String title;
  final String description;
  final String status;
  final String image;
  final String imagePath;
  final bool isFavorite;
  final String userEmail;
  final String userId;
  final LocationData_user location;


  //Constructor
  News(

      {@required this.id,
        @required this.title,
      @required this.description,
      @required this.status,
      @required this.userEmail,
      @required this.userId,
      @required this.image,
      @required this.imagePath,
        @required this.location,
      this.isFavorite = false});
}

