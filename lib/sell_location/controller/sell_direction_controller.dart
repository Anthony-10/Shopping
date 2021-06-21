import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DirectionRepository {
  static const String _baseUrl =
      'https://maps.googleapis.com/maps/api/directions/outputFormat/json?';

  final Dio _dio;

  DirectionRepository({Dio dio}) : _dio = dio ?? Dio();

  /*Future<Directions> getDirections({
  @required LatLng origin,
    @required LatLng destination,
}) async {

  }*/




}
