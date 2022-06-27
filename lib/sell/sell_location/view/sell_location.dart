import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shopping_app/core/service/data_base_service.dart';
import 'package:shopping_app/sell/add_products/controller/addproducts_controller.dart';
import 'package:shopping_app/sell/add_products/widget/bottom_sheet.dart';

class SellLocation extends StatefulWidget {
  const SellLocation({Key key}) : super(key: key);

  @override
  _SellLocationState createState() => _SellLocationState();
}

class _SellLocationState extends State<SellLocation> {
  //GoogleMapController googleMapController;
  final addProductsController = Get.put(AddProductsController());
  final DatabaseService databaseService = Get.put(DatabaseService());
  final bottomSheetView = Get.put(BottomSheetView());
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  final LatLng _center = const LatLng(45.521563, -122.677433);
  GoogleMapController mapController;
  String uid = FirebaseAuth.instance.currentUser.uid;
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  Position position;
  String addressLocation;
  String country;
  String postalCode;
  String country1;
  String address;
  Placemark place;
  //Geolocator _geolocator = Geolocator();
  var email;
  var firstName;
  var url;
  var distances;
  var userId;

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

  Future getAddressFromLatLong() async {
    print('getAddressFromLatLong,lllllllllllllllllllllllllllllllllllllllllll');
    List<Placemark> placemark = await GeocodingPlatform.instance
        .placemarkFromCoordinates(position.latitude, position.longitude,
            localeIdentifier: "en");

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
    getUserData();
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
      appBar: AppBar(),
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
                    /*showModalBottomSheet(
                        context: context,
                        builder: (context) => LocationBottomSheet(),
                        isScrollControlled: true,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        )));*/
                    if (postalCode.isEmpty) {
                      postalCode = 'N/B';
                    } else {
                      return;
                    }
                    await FirebaseFirestore.instance
                        .collection('location')
                        .doc(uid)
                        .set({
                      'latitude': position.latitude,
                      'longitude': position.longitude,
                      'Address': addressLocation,
                      'Country': country,
                      'postalCode': postalCode,
                      'uid': uid,
                    }).whenComplete(() => Get.snackbar(
                              "Success message",
                              'Location Added',
                            ));
                    {
                      upDateUserData(
                          email: email,
                          firstName: firstName,
                          url: url,
                          distances: distances,
                          latitude: position.latitude,
                          longitude: position.longitude,
                          userId: userId);
                    }
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

  void getUserData() async {
    try {
      await _fireStore
          .collection('Users')
          .doc(uid)
          .get()
          .then((DocumentSnapshot documentSnapshot) {
        if (documentSnapshot.exists) {
          setState(() {
            email = documentSnapshot.get('email');
            firstName = documentSnapshot.get('firstName');
            distances = documentSnapshot.get('distances');
            url = documentSnapshot.get('Url');
            userId = documentSnapshot.get('userId');
          });
        } else {
          print('wewe');
        }
      });
    } on FirebaseException catch (e) {
      print(e.message);
    }
  }

  void upDateUserData(
      {var email,
      var firstName,
      var url,
      var userId,
      var distances,
      var latitude,
      var longitude}) async {
    try {
      if (email != null &&
          firstName != null &&
          url != null &&
          userId != null &&
          distances != null) {
        await _fireStore.collection("Users").doc(uid).update({
          'email': email,
          'firstName': firstName,
          'Url': url,
          'userId': userId,
          'distances': distances,
          'latitude': latitude,
          'longitude': longitude,
        });
      } else {
        print('String empty');
      }
    } on FirebaseException catch (e) {
      print(e.message);
    }
  }
}
