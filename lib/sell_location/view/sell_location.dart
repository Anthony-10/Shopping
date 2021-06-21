import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SellLocation extends StatefulWidget {
  const SellLocation({Key key}) : super(key: key);

  @override
  _SellLocationState createState() => _SellLocationState();
}

class _SellLocationState extends State<SellLocation> {
  static const _initialCameraPosition =
      CameraPosition(target: LatLng(37.773972, -122.431297), zoom: 11.5);

  GoogleMapController _googleMapController;
  Marker _origin;
  Marker _destination;

  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        myLocationButtonEnabled: false,
        zoomControlsEnabled: false,
        initialCameraPosition: _initialCameraPosition,
        onMapCreated: (controller) => _googleMapController = controller,
        markers: {
          if (_origin != null) _origin,
          if (_destination != null) _destination
        },
        onLongPress: _addMarker,
        //onTap: _zoomIn
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          onPressed: () => _googleMapController.animateCamera(
                CameraUpdate.newCameraPosition(_initialCameraPosition),
              ),
          child: const Icon(Icons.center_focus_strong)),
    );
  }

  void _addMarker(LatLng argument) {
    if (_origin == null || (_origin != null && _destination != null)) {
      setState(() {
        _origin = Marker(
          markerId: const MarkerId('origin'),
          infoWindow: const InfoWindow(title: 'origin'),
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
          position: argument,
          onTap: _zoomOrigin,
        );
        _destination = null;
      });
    } else {
      setState(() {
        _destination = Marker(
            markerId: const MarkerId('destination'),
            infoWindow: const InfoWindow(title: 'Destination'),
            icon:
                BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
            position: argument,
          onTap: _zoomDestination,
        );
      });
    }
  }

  void _zoomOrigin() {
    _googleMapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: _origin.position,
          zoom: 15.0,
          tilt: 50.0,
        ),
      ),
    );
  }

  void _zoomDestination() {
    _googleMapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: _destination.position,
          zoom: 15.0,
          tilt: 50.0,
        ),
      ),
    );
  }
}
