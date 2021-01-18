import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Location {
  double longitude;
  double lattitude;

  Future<void> getCurrentLoc() async {
    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
          longitude = position.longitude;
          lattitude = position.latitude;
      print(position);
    } catch (e) {
      print(e);
    }
  }
}
