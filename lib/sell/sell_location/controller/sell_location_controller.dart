import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:geocoder/geocoder.dart' as geoCo;
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SellLocationController extends GetxController {
  Position position;
  RxString addressLocation;
  RxString country;
  RxString postalCode;
  String country1;
  String address1;
  GoogleMapController mapController;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{}.obs;

  void getMarkers(double lat, double long) {
    MarkerId markerId = MarkerId(lat.toString() + long.toString());
    Marker _marker = Marker(
        markerId: markerId,
        position: LatLng(lat, long),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        infoWindow: InfoWindow(snippet: addressLocation as String));

    markers[markerId] = _marker;
  }

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
    Geolocator.getPositionStream().listen((Position position) {
      mapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
              target: LatLng(
                  position.latitude.toDouble(), position.longitude.toDouble()),
              zoom: 18),
        ),
      );
    });
    //setPolylines();
  }

  void getCurrentLocation() async {
    Position currentPosition =
        await GeolocatorPlatform.instance.getCurrentPosition();

    position = currentPosition.obs as Position;
  }

  void addLocation() async {
    final coordinated =
        new geoCo.Coordinates(position.latitude, position.longitude);
    var address =
        await geoCo.Geocoder.local.findAddressesFromCoordinates(coordinated);
    var firstAddress1 = address.first;
    getMarkers(position.latitude, position.longitude);
    await FirebaseFirestore.instance.collection('location').add({
      'latitude': position.latitude,
      'longitude': position.longitude,
      'Address': firstAddress1.addressLine,
      'Country': firstAddress1.countryName,
    });
  }
}
