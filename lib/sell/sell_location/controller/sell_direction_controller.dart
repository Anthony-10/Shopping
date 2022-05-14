import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/sell/models/directions.dart';
import 'package:shopping_app/sell/sell_location/controller/.env.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DirectionRepository {
  static const String _baseUrl =
      'https://maps.googleapis.com/maps/api/directions/json?';

  final Dio _dio;

  DirectionRepository({Dio dio}) : _dio = dio ?? Dio();

  /* Future<Directions> getDirections({
    @required LatLng origin,
    @required LatLng destination,
  }) async {
    final response = await _dio.get(_baseUrl, queryParameters: {
      'origin': '${origin.latitude},${origin.longitude}',
      'destination': '${destination.latitude},${destination.longitude}',
      'key': googleAPIKey,
    });

    //Check if the response is successful
    if (response.statusCode == 200) {
      return Directions.fromMap(response.data);
    }
    return null;
  }*/
}
