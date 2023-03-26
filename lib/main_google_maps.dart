import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MainGoogleMaps extends StatefulWidget {
  const MainGoogleMaps({Key? key}) : super(key: key);

  @override
  _MainGoogleMapsState createState() => _MainGoogleMapsState();
}

class _MainGoogleMapsState extends State<MainGoogleMaps> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(-1.286389, 36.817223);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Maps Sample App'),
        backgroundColor: Colors.green[700],
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 11.0,
        ),
      ),
    );
  }
}