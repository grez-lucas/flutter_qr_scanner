import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../models/app_models.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  @override
  Widget build(BuildContext context) {
    final ScanModel? scan =
        ModalRoute.of(context)!.settings.arguments as ScanModel?;

    final scanCoordinates = scan!.value
        .substring(4)
        .split(',')
        .map((e) => double.parse(e))
        .toList();

    final CameraPosition _kGooglePlex = CameraPosition(
      target: LatLng(scanCoordinates[0], scanCoordinates[1]),
      zoom: 14.4746,
      tilt: 50,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Map'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.my_location),
          ),
        ],
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
