import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:shopping_app/buy/buy_page/view/locations/.env.dart';
import 'package:shopping_app/buy/buy_page/view/locations/direction_model.dart';

class DirectionsRepository {
  static const String _baseUrl =
      'https:maps.googleapis.com/map/api/directions/json?';
  final Dio _dio;

  DirectionsRepository({Dio dio}) : _dio = dio ?? Dio();

  Future<Directions> getDirections(
      {@required LatLng origin, @required LatLng destination}) async {
    final response = await _dio.get(_baseUrl, queryParameters: {
      'origin': '${origin.latitude}, ${origin.longitude}',
      'destination': '${destination.latitude},${destination.longitude}',
      'key': googleAPIKey
    });

    // Check if response is successful
    if (response.statusCode == 200) {
      return Directions.fromMap(response.data);
    }
    return null;
  }
}
