import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class geoCurrentLocation{
  double latitude;
  double longtude;

  //geoLocation({this.latitude,this.longtude});

  Future<void> getCurrentLocation()
  async {
    try {
      Position position = await getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitude=position.latitude;
      longtude=position.longitude;

      print(position);
    }catch(e){
      print(e);
    }
  }
}