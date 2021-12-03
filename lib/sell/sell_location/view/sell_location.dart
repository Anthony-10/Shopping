import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SellLocation extends StatefulWidget {
  const SellLocation({Key key}) : super(key: key);

  @override
  _SellLocationState createState() => _SellLocationState();
}

class _SellLocationState extends State<SellLocation> {
  //GoogleMapController googleMapController;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  final LatLng _center = const LatLng(45.521563, -122.677433);
  GoogleMapController mapController;
  String uid = FirebaseAuth.instance.currentUser.uid;

  Position position;
  String addressLocation;
  String country;
  String postalCode;
  String country1;
  String address;
  Placemark place;
  //Geolocator _geolocator = Geolocator();

  void getMarkers(double lat, double long) {
    MarkerId markerId = MarkerId(lat.toString() + long.toString());
    Marker _marker = Marker(
        markerId: markerId,
        position: LatLng(lat, long),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
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
      print('${position.longitude},${position.latitude}');
    });
    getAddressFromLatLong();
  }

  void getCurrentAddress() async {
    /*final coordinated =
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
    });*/
  }
  /*Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }
*/

  Future getAddressFromLatLong() async {
    print('getAddressFromLatLong,lllllllllllllllllllllllllllllllllllllllllll');
    print(
        '${position.longitude},${position.latitude},////////////////////////////////');
    List<Placemark> placemark = await GeocodingPlatform.instance
        .placemarkFromCoordinates(position.latitude, position.longitude,
            localeIdentifier: "en");
    print('getAddressFromLatLong,00000000000000000000000000000000000000000000');
    Placemark place = placemark[0];
    addressLocation = place.street;
    country = place.country;
    postalCode = place.postalCode;
    print('$addressLocation,$country,$postalCode');
    setState(() {});
  }

  void _onMapCreated(GoogleMapController controller) {
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

  @override
  void initState() {
    // TODO: implement initState
    getCurrentLocation();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            myLocationEnabled: true,
            compassEnabled: true,
            trafficEnabled: true,
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(target: _center, zoom: 18.0),
            markers: Set<Marker>.of(markers.values),
          ),
          Positioned(
            top: 60.0,
            right: 20.0,
            left: 20.0,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white60,
                  borderRadius: BorderRadius.circular(20.0)),
              child: Column(children: [
                Text(
                  'Address : $addressLocation',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('Postal : $postalCode',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text('Country : $country',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                //Text('Country : $country1'),
              ]),
            ),
          ),
          Positioned(
            bottom: 40.0,
            right: 20.0,
            left: 20.0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70.0),
              child: ElevatedButton(
                  onPressed: () async {
                    await FirebaseFirestore.instance
                        .collection('location')
                        .doc(uid)
                        .set({
                      'latitude': position.latitude,
                      'longitude': position.longitude,
                      'Address': addressLocation,
                      'Country': country,
                      'postalCode': postalCode,
                      /*final coordinated = new geoCo.Coordinates(
                        position.latitude, position.longitude);
                    var address = await geoCo.Geocoder.local
                        .findAddressesFromCoordinates(coordinated);
                    var firstAddress1 = address.first;
                    getMarkers(position.latitude, position.longitude);
                    await FirebaseFirestore.instance
                        .collection('location')
                        .add({
                      'latitude': position.latitude,
                      'longitude': position.longitude,
                      'Address': firstAddress1.addressLine,
                      'Country': firstAddress1.countryName,
                    });
                    setState(() {
                      country = firstAddress1.countryName;
                      postalCode = firstAddress1.postalCode;
                      addressLocation = firstAddress1.addressLine;
                      print(
                          '????????????????????????????????????????$country$postalCode$addressLocation$firstAddress1');
                    });*/
                    });
                  },
                  child: Text('Save'),
                  style: ElevatedButton.styleFrom(
                    side: BorderSide(width: 2), //border width and color
                    primary: Colors.black,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
