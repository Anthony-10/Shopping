/*
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class BuyLocalController extends GetxController {
  void getMarkers(double lat, double long) {
    MarkerId markerId = MarkerId(lat.toString() + long.toString());
    Marker _marker = Marker(
        markerId: markerId,
        position: LatLng(lat, long),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        infoWindow: InfoWindow(title: addressLocation));
    setState(() {
      markers[markerId] = _marker;
    });
  }

  void getCurrentLocation() async {
    Position currentPosition =
        await GeolocatorPlatform.instance.getCurrentPosition();
    setState(() {
      position = currentPosition;
    });
  }

  void getCurrentAddress() async {
    final coordinated =
        new geoCo.Coordinates(position.latitude, position.longitude);
    var address =
        await geoCo.Geocoder.local.findAddressesFromCoordinates(coordinated);
    var firstAddress1 = address.first;
    getMarkers(position.latitude, position.longitude);
    setState(() {
      country = firstAddress1.countryName;
      postalCode = firstAddress1.postalCode;
      addressLocation = firstAddress1.addressLine;
      print(
          '????????????????????????????????????????$country$postalCode$addressLocation$firstAddress1');
    });
  }
}
*/
