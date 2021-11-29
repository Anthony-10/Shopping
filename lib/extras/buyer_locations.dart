/*import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
*/ /*import 'package:geocoder/geocoder.dart' as geoCo;*/ /*
import 'package:google_maps_flutter/google_maps_flutter.dart';

class BuyerLocations extends StatefulWidget {
  const BuyerLocations({Key key}) : super(key: key);

  @override
  _BuyerLocationsState createState() => _BuyerLocationsState();
}

class _BuyerLocationsState extends State<BuyerLocations> {
  GoogleMapController googleMapController;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  Position position;
  String addressLocation;
  String country;
  String postalCode;
  String country1;

  void getMarkers(double lat, double long) {
    MarkerId markerId = MarkerId(lat.toString() + long.toString());
    Marker _marker = Marker(
        markerId: markerId,
        position: LatLng(lat, long),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
        infoWindow: InfoWindow(snippet: addressLocation));
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

  @override
  void initState() {
    // TODO: implement initState
    getCurrentLocation();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            myLocationEnabled: true,
            onTap: (tapped) async {
              final coordinated =
                  new geoCo.Coordinates(tapped.latitude, tapped.longitude);
              var address = await geoCo.Geocoder.local
                  .findAddressesFromCoordinates(coordinated);
              var firstAddress = address.first;
              getMarkers(tapped.latitude, tapped.longitude);
              */ /*var firstAddress1 = address.first;
              getCurrentLocation();*/ /*
              await FirebaseFirestore.instance.collection('location').add({
                'latitude': tapped.latitude,
                'longitude': tapped.longitude,
                'Address': firstAddress.addressLine,
                'Country': firstAddress.countryName,
                'PostalCode': firstAddress.postalCode
              });
              setState(() {
                country = firstAddress.countryName;
                postalCode = firstAddress.postalCode;
                addressLocation = firstAddress.addressLine;
                //country1 = firstAddress1.countryName;
              });
            },
            compassEnabled: true,
            trafficEnabled: true,
            onMapCreated: (GoogleMapController controller) {
              setState(() {
                googleMapController = controller;
              });
            },
            initialCameraPosition: CameraPosition(
                target: LatLng(position.latitude.toDouble(),
                    position.longitude.toDouble()),
                zoom: 15.0),
            markers: Set<Marker>.of(markers.values),
          ),
          Positioned(
            bottom: 40.0,
            right: 20.0,
            left: 20.0,
            child: Container(
              color: Colors.blue,
              child: Column(children: [
                Text('Address : $addressLocation'),
                Text('Postal : $postalCode'),
                Text('Country : $country'),
                Text('Current Place : $position'),
                //Text('Country : $country1'),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}*/
