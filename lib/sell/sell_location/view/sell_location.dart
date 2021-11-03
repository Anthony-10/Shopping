/*
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoder/geocoder.dart' as geoCo;
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

  Position position;
  String addressLocation;
  String country;
  String postalCode;
  String country1;
  String address1;
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
    });
  }

  */
/*void getCurrentAddress() async {
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
  }*/ /*


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

            */
/*(GoogleMapController controller) {

              setState(() {
                googleMapController = controller;
              });
            },*/ /*

            initialCameraPosition: CameraPosition(
                target: _center
                */
/*LatLng(position.latitude.toDouble(),
                    position.longitude.toDouble())*/ /*

                ,
                zoom: 18.0),
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
                    final coordinated = new geoCo.Coordinates(
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
*/
