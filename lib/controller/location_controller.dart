


import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationController extends GetxController{

  Completer<GoogleMapController> controllerGoogleMap = Completer();
  late GoogleMapController mcontroller;
  Rx<LatLng> currentLatLng=LatLng(37.42796133580664, -122.085749655962).obs;
  Rx<String> currentAddress="".obs;
  Rx<String> currentLocality="".obs;

  @override
  void onInit() {
    super.onInit();
   _getCurrentPosition();

  }

  Future<void> updateMap() async {
     mcontroller = await controllerGoogleMap.future;
     mcontroller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: currentLatLng.value,zoom: 14.0)));
  }
  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(const SnackBar(
          content: Text('Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(Get.context!).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(const SnackBar(
          content: Text('Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();
    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      currentLatLng.value=LatLng(position.latitude, position.longitude);
      _getAddressFromLatLng(position);
    }).catchError((e) {
      debugPrint(e);
    });
  }


  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(position.latitude, position.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      currentLocality.value=place.subLocality!;
      currentAddress.value = '${place.street}, ${place.subLocality},${place.subAdministrativeArea}, ${place.postalCode}';
      updateMap();
      update();
    }).catchError((e) {
      debugPrint(e);
    });
  }


}