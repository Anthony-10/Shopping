import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class BuyerLocation extends StatefulWidget {
  const BuyerLocation({Key key}) : super(key: key);

  @override
  _BuyerLocationState createState() => _BuyerLocationState();
}

class _BuyerLocationState extends State<BuyerLocation> {
  GoogleMapController mapController;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  initMarker(specify, specifyId) async {
    var markerIdVal = specifyId;
    final MarkerId markerId = MarkerId(markerIdVal);
    final Marker marker = Marker(
      markerId: markerId,
      position: LatLng(specify['latitude'], specify['longitude']),
      infoWindow: InfoWindow(title: 'shop', snippet: specify['Address']),
    );
    setState(() {
      markers[markerId] = marker;
    });
  }

  getMarkerData() {
    FirebaseFirestore.instance.collection('location').get().then((myData) {
      if (myData.docs.isNotEmpty) {
        for (int i = 0; i < myData.docs.length; i++) {
          initMarker(myData.docs[i].data(), myData.docs[i].id);
        }
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getMarkerData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Set<Marker> getMarker() {
      return <Marker>[
        Marker(
            markerId: MarkerId('Place'),
            position: LatLng(21.1458, 79.2882),
            icon: BitmapDescriptor.defaultMarker,
            infoWindow: InfoWindow(title: 'Shop'))
      ].toSet();
    }

    return Scaffold(
      body: GoogleMap(
          markers: Set<Marker>.of(markers.values),
          mapType: MapType.normal,
          initialCameraPosition: CameraPosition(
              target: LatLng(-1.1530473, 36.9945471), zoom: 18.0),
          onMapCreated: (GoogleMapController controller) {
            mapController = controller;
          }),
    );
  }
}
