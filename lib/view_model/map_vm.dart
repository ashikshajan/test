
import 'package:ateam_map/apputil/app_util.dart';
import 'package:ateam_map/models/map_search_res.dart';
import 'package:ateam_map/repository/api_repo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geotypes/src/geojson.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart' as map;

class MapVM extends ChangeNotifier {
  map.MapboxMap? mapboxMap;

  onMapCreated(map.MapboxMap mapboxMap) {
    this.mapboxMap = mapboxMap;
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

    mapboxMap?.coordinateBoundsForCamera(map.CameraOptions(
        center: map.Point(
            coordinates: Position(
          latLong.lng,
          latLong.lng,
        )),
        padding: map.MbxEdgeInsets(top: 1, left: 2, bottom: 3, right: 4),
        anchor: map.ScreenCoordinate(x: 1, y: 1),
        zoom: 10,
        bearing: 20,
        pitch: 30));

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
    Log.print(endLocation.text, other: "");
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
}
