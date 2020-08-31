import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:The_Hope/models/location_data.dart';

import '../helpers/ensure_visible.dart';
import '../../models/news.dart';

class LocationInput extends StatefulWidget {
  final Function setLocation;
  final News product;

  LocationInput(this.setLocation, this.product);

  @override
  State<StatefulWidget> createState() {
    return _LocationInputState();
  }
}

class _LocationInputState extends State<LocationInput> {
  final FocusNode _addressInputFocusNode = FocusNode();
  final TextEditingController _addressInputController = TextEditingController();
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

  Position _currentPosition;
  List<Address> _addresses;

  _getCurrentLocation() {
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });
      _getAddressFromLatLng();
    }).catchError((e) {
      print(e);
    });
  }

  _getAddressFromLatLng() async {
    try {
      final coordinates =
          Coordinates(_currentPosition.latitude, _currentPosition.longitude);
      _addresses =
          await Geocoder.local.findAddressesFromCoordinates(coordinates);

      setState(() {
        _addressInputController.text = _addresses.first.addressLine;
      });
      widget.setLocation(LocationData_user(
          latitude: _currentPosition.latitude,
          longitude: _currentPosition.longitude,
          address: _addresses.first.addressLine));
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        EnsureVisibleWhenFocused(
          focusNode: _addressInputFocusNode,
          child: TextFormField(
            focusNode: _addressInputFocusNode,
            controller: _addressInputController,
            validator: (String value) {
              if (_currentPosition == null || value.isEmpty) {
                return 'No valid location found.';
              }
              return null;
            },
            decoration: InputDecoration(labelText: 'Address'),
          ),
        ),
        SizedBox(height: 10.0),
        FlatButton(
          child: Text('Locate User'),
          onPressed: _getCurrentLocation,
        ),
        SizedBox(
          height: 10.0,
        ),
        /*_staticMapUri == null
            ? Container()
            : Image.network(_staticMapUri.toString())*/
      ],
    );
  }
}
