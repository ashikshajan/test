import 'package:ateam_test/apputil/app_util.dart';
import 'package:ateam_test/models/map_search_res.dart';
import 'package:ateam_test/repository/api_repo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart' as geo;

import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

class MapVM extends ChangeNotifier {
////
  ///

  MapboxMap? mapboxMap;

  onMapCreated(MapboxMap mapboxMap) {
    this.mapboxMap = mapboxMap;
  }

  geo.Position? _locationData;

  geo.Position? get currentLocation => _locationData;

  Future<void> getCurrentLocation() async {
    geo.Position position = await geo.Geolocator.getCurrentPosition(
        desiredAccuracy: geo.LocationAccuracy.high);

    _locationData = position;

    notifyListeners();
  }

//SETTING LOCATION AND LATLONG

  TextEditingController startLocation = TextEditingController();
  TextEditingController endLocation = TextEditingController();

  String? _mapTripStartLocation;
  String? get mapTripStartLocation => _mapTripStartLocation;
  Position? _startLatLong = Position(0, 0);
  Position? get startLatlong => _startLatLong;

  setmapTripStartLocation(String location, Position latLong) {
    startLocation.text = location;
    _mapTripStartLocation = location;
    _startLatLong = Position(latLong.lng, latLong.lat);
    Log.print("starttt-----");
    mapboxMap?.flyTo(
        CameraOptions(
            center: Point(coordinates: _startLatLong!),
            zoom: 17,
            bearing: 180,
            pitch: 30),
        MapAnimationOptions(duration: 2000, startDelay: 0));

    notifyListeners();
  }

  String? _mapTripEndLocation;
  String? get mapTripEndLocation => _mapTripEndLocation;
  Position? _endLatLong = Position(0, 0);
  Position? get endLatlong => _endLatLong;

  setmapTripEndLocation(String location, Position latLong) {
    endLocation.text = location;
    _mapTripEndLocation = location;
    _endLatLong = Position(latLong.lng, latLong.lat);
    Log.print("endd-----");
    mapboxMap?.flyTo(
        CameraOptions(
            center: Point(coordinates: _endLatLong!),
            zoom: 17,
            bearing: 180,
            pitch: 30),
        MapAnimationOptions(duration: 2000, startDelay: 0));
    notifyListeners();
  }

  // SEARCH ON MAP
  MapSearchResponseModel? _placeList;
  MapSearchResponseModel? get placeList => _placeList;

  Future<List<Features>> getMapPlaces(String place) async {
    try {
      final result = await ApiRepo.getPlacesMap(place: place);

      _placeList = result;

      if (_placeList != null) {
        return _placeList?.features ?? [];
      } else {
        return [];
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return [];
    }
  }

  cleardata(type) {
    type == "start" ? startLocation.clear() : endLocation.clear();
  }
}
