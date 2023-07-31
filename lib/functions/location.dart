import 'dart:developer';

import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class CurrentLocation {

  Future <Position> getCurrentLocation()async{
    // bool serviceEnabled =  await Geolocator.isLocationServiceEnabled();
    var serviceEnabled = await Permission.location.request();

    if (serviceEnabled.isDenied) {
      
      return Future.error("Location services are disabled");
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if(permission == LocationPermission.denied){
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error("Location Permission are denied");
        
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error("Location Permission are permanently denied, we cannot request");
      
    }
     Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
      );
      log(position.latitude.toString());
      log(position.longitude.toString());

    return await Geolocator.getCurrentPosition();
  
  }
  
}