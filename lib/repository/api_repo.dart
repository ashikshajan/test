import 'dart:convert';

import 'package:ateam_map/models/map_search_res.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../apputil/app_util.dart';

class ApiRepo {
  static Future getPlacesMap({required String place}) async {
    Log.print(place);
    try {
      final response = await http.get(Uri.parse(
          'https://api.mapbox.com/search/geocode/v6/forward?q=$place&access_token=${AppUtils.accessToken}'));

      return response.statusCode == 200
          ? MapSearchResponseModel.fromJson(jsonDecode(response.body))
          : MapSearchResponseModel.fromJson({});
    } catch (e) {
      debugPrint("Exception: $e");
      rethrow;
    }
  }
}
