import 'dart:async';
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:The_Hope/models/news.dart';
import 'package:The_Hope/scoped-models/conected_news.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:The_Hope/scoped-models/main.dart';
import 'package:firebase_database/firebase_database.dart';













class MapSetting extends StatefulWidget{


  final MainModel model;
  MapSetting(this.model);
  @override
  _MapSettingState createState() => _MapSettingState();
}

class _MapSettingState extends State<MapSetting> with SingleTickerProviderStateMixin{




  final List<LatLng> _makertLocations = [];


  GoogleMapController _controller;
  List<Marker> allMarkers = [];
  PageController _pageController;
  static const LatLng _center = const LatLng(6.9271, 79.8612);

  int prevPage;

  int index;

  @override
  void initSate() {
    widget.model.fetchProducts(onlyForUser: true);
    super.initState();

      allMarkers.add(Marker(
          markerId: MarkerId(widget.model.allproducts[index].id),
          draggable: false,
          position: LatLng(
              widget.model.allproducts[index].location.latitude, widget.model.allproducts[index].location.longitude)));
      _pageController = PageController(initialPage: 1, viewportFraction: 0.8);
    }



    @override
    Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model){
        return Scaffold(
          appBar: AppBar(
            title: Text('Maps'),
            centerTitle: true,
          ),
          body: Stack(
            children: <Widget>[
              Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height - 50.0,
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                child: GoogleMap(
                  initialCameraPosition: CameraPosition(
                      target: LatLng(6.9271, 79.8612), zoom: 7.0),
                  markers: Set<Marker>.of (allMarkers),                           //Set.from(allMarkers),
                  //onMapCreated: mapCreated,
                ),
              ),

            ],
          ));
      },);
    }
}










