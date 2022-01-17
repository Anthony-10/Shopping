import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shopping_app/buy/buy_page/controller/buy_controller.dart';
import 'package:shopping_app/buy/buy_page/view/locations/.env.dart';
import 'package:shopping_app/buy/buy_page/view/locations/direction_model.dart';

import 'directions_repository.dart';
//import 'package:shopping_app/core/service/.env.dart';

class Location extends StatefulWidget {
  const Location({Key key}) : super(key: key);

  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  final buyController = Get.put(BuyController());
  GoogleMapController mapController;
  final LatLng _center = const LatLng(-1.1530473, 36.9945471);
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  Set<Polyline> _polylines = Set<Polyline>();
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints;
  Position position;
  int length;
  Directions _info;

  void getCurrentLocation() async {
    Position currentPosition =
        await GeolocatorPlatform.instance.getCurrentPosition();
    setState(() {
      position = currentPosition;
      print('${position.longitude},${position.latitude}');
    });
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

  var wewe;
  var mimi;
  initMarker(specify, specifyId) async {
    var markerIdVal = specifyId;
    final MarkerId markerId = MarkerId(markerIdVal);
    final Marker marker = Marker(
      markerId: markerId,
      position: LatLng(wewe = specify['latitude'], mimi = specify['longitude']),
      infoWindow: InfoWindow(title: 'shop', snippet: specify['Address']),
    );
    setState(() {
      markers[markerId] = marker;
    });
  }

  getMarkerData() {
    FirebaseFirestore.instance
        .collection('location')
        .where("uid", isEqualTo: buyController.id)
        .get()
        .then((myData) {
      if (myData.docs.isNotEmpty) {
        setState(() {
          length = 1;
        });
        for (int i = 0; i < myData.docs.length; i++) {
          initMarker(myData.docs[i].data(), myData.docs[i].id);
        }
      } else {
        print('getMarkerData,wwwwwwwwwwwwwwwwwwwwwwww');
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState

    getCurrentLocation();
    getMarkerData();
    super.initState();
    polylinePoints = PolylinePoints();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Set<Marker> getMarker() {
      return <Marker>[
        Marker(
            markerId: MarkerId('Place'),
            position: LatLng(21.1458, 79.2882),
            icon:
                BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
            infoWindow: InfoWindow(title: 'Shop'))
      ].toSet();
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: const Text('Location'),
          actions: [
            if (position != null)
              TextButton(
                  onPressed: () => mapController.animateCamera(
                      CameraUpdate.newCameraPosition(CameraPosition(
                          target: LatLng(position.latitude.toDouble(),
                              position.longitude.toDouble()),
                          zoom: 18.0))),
                  child: Text(
                    'ORIGIN',
                    style: TextStyle(color: Colors.black),
                  )),
            if (length == 1)
              TextButton(
                  onPressed: () => mapController.animateCamera(
                      CameraUpdate.newCameraPosition(CameraPosition(
                          target: LatLng(buyController.lat, buyController.long),
                          zoom: 18.0))),
                  child: Text('DESTINATION',
                      style: TextStyle(color: Colors.black)))
          ],
        ),
        body: Stack(
          children: [
            GoogleMap(
              myLocationEnabled: true,
              compassEnabled: true,
              trafficEnabled: true,
              polylines: _polylines,
              onMapCreated: (GoogleMapController controller) {
                mapController = controller;
                setPolylines();
              },
              initialCameraPosition:
                  CameraPosition(target: _center, zoom: 18.0),
              markers: Set<Marker>.of(markers.values),
            ),
            /*Positioned(
                top: Get.height * .03,
                left: Get.width * .03,
                child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Get.back();
                  },
                ))*/
          ],
        ),
        /*floatingActionButton:FloatingActionButton(
backgroundColor:  Theme.of(context).primaryColorDark,
            foregroundColor: Colors.black,
            onPressed: (){
              mapController.animateCamera(CameraUpdate.newCameraPosition(_onMapCreated()));
            },
          )*/
      ),
    );
  }

  void setPolylines() async {
    print('setPolylines,///////////////////////////////////////////////');
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        googleAPIKey,
        PointLatLng(
            position.latitude.toDouble(), position.longitude.toDouble()),
        PointLatLng(wewe, mimi),
        travelMode: TravelMode.walking);
    print('${result.errorMessage},[[[[[[[[[[[[[[[[[[[[[[[[[[[');
    print(
        "${position.latitude},${position.longitude},ppppppppppppppppppppppppppppppppppppppp");
    print("$googleAPIKey,fffffffffffffffffffffffffffffffffffffffffffffffffff");
    print("$wewe,$mimi,kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk");
    print('${result.status}, ggggggggggggggggggggggggggggggggggggggg');
    if (result.status == "OK") {
      print('${result.status},wwwwwwwwwwwwwwwwwwwwwwwwwww');
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
      setState(() {
        _polylines.add(Polyline(
            width: 10,
            polylineId: PolylineId('poliLine'),
            color: Colors.blue,
            points: polylineCoordinates));
      });
    } else {
      print(
          'Error setPolylines, wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww');
    }
  }
  // Get directions

}
