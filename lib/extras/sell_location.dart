/*
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class SellLocation extends StatefulWidget {
  const SellLocation({Key key}) : super(key: key);

  @override
  _SellLocationState createState() => _SellLocationState();
}

class _SellLocationState extends State<SellLocation> {
  GoogleMapController mapController;
  final LatLng _center = const LatLng(45.521563, -122.677433);
  Location _location = Location();

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    _location.onLocationChanged.listen((event) {
      mapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
              target: LatLng(event.latitude, event.longitude), zoom: 18),
        ),
      );
    });
    //setPolylines();
  }

  Set<Polyline> _polyline = Set<Polyline>();
  List<LatLng> polylineCoordinates = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    polylinePoints = PolylinePoints();
  }

  PolylinePoints polylinePoints = PolylinePoints();
  */
/*static const _initialCameraPosition =
      CameraPosition(target: LatLng(37.773972, -122.431297), zoom: 11.5);*/ /*


  */
/*GoogleMapController _googleMapController;
  Marker _origin;
  Marker _destination;
  Directions _info;*/ /*


  */
/* @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }*/ /*


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            compassEnabled: true,
            trafficEnabled: true,
            myLocationEnabled: true,
            //trafficEnabled: true,
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 10,
            ),
            polylines: _polyline,
          ),
          Positioned(
            top: 50,
            left: 20,
            right: 20,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Enter location',
                    suffixIcon: Icon(Icons.search),
                    contentPadding:
                    const EdgeInsets.only(left: 20, bottom: 5, right: 5),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(color: Colors.white)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.white))),
              ),
            ),
          ),
          Positioned(
              bottom: 50,
              left: 20,
              right: 20,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 70.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.black),
                  child: Text('Save'),
                ),
              ))
        ],
      ),
      */
/*SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            GoogleMap(
              //mapType: MapType.satellite,
              myLocationButtonEnabled: true,
              zoomControlsEnabled: false,
              initialCameraPosition: _initialCameraPosition,
              onMapCreated: (controller) => _googleMapController = controller,
              markers: {
                if (_origin != null) _origin,
                if (_destination != null) _destination
              },
              polylines: {
                if (_info != null)
                  Polyline(
                      polylineId: const PolylineId('overview_polyline'),
                      color: Colors.red,
                      width: 5,
                      points: _info.polylinePoints
                          .map((e) => LatLng(e.latitude, e.longitude))
                          .toList()),
              },
              onLongPress: _addMarker,
            ),
            if (_info != null)
              Positioned(
                  top: 20.0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 6.0, horizontal: 12.0),
                    decoration: BoxDecoration(
                      color: Colors.yellowAccent,
                      borderRadius: BorderRadius.circular(20.0),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 2),
                          blurRadius: 6.0,
                        )
                      ],
                    ),
                    child: Text(
                      '${_info.totalDistance}, ${_info.totalDuration}',
                      style: const TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w600),
                    ),
                  )),

            // Button that creates a marker when tapped
            Positioned(
              top: 10.0,
              right: 1.0,
              child: IconButton(
                icon: Icon(Icons.pin_drop),
                color: Colors.purple,
                iconSize: 40.0,
                onPressed: () => _addMarker,
              ),
            )
          ],
        ),
      ),*/ /*

      */
/*floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          onPressed: () => _googleMapController.animateCamera(
                _info != null
                    ? CameraUpdate.newLatLngBounds(_info.bounds, 100.0)
                    : CameraUpdate.newCameraPosition(_initialCameraPosition),
              ),
          child: const Icon(Icons.center_focus_strong)),*/ /*

    );
  }
*/
/* void setPolylines() async {
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(googleApiKey, origin, destination)
  }
*/ /*

*/
/* void _addMarker(LatLng pos) async {
    if (_origin == null || (_origin != null && _destination != null)) {
      setState(() {
        _origin = Marker(
          markerId: const MarkerId('origin'),
          infoWindow: const InfoWindow(title: 'origin'),
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
          position: pos,
          onTap: _zoomOrigin,
        );
        _destination = null;

        // Reset info
        //_info = null;
      });
    } else {
      setState(() {
        _destination = Marker(
          markerId: const MarkerId('destination'),
          infoWindow: const InfoWindow(title: 'Destination'),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
          position: pos,
          onTap: _zoomDestination,
        );
      });

      // Get directions
      final directions = await DirectionRepository()
          .getDirections(origin: _origin.position, destination: pos);
      setState(() => _info = directions);
    }
  }*/ /*

*/
/*void _zoomOrigin() {
    _googleMapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: _origin.position,
          zoom: 15.0,
          tilt: 50.0,
        ),
      ),
    );
  }*/ /*

*/
/*void _zoomDestination() {
    _googleMapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: _destination.position,
          zoom: 15.0,
          tilt: 50.0,
        ),
      ),
    );
  }*/ /*

}
*/
