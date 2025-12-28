import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationMapSection extends StatefulWidget {
  final double latitude, longitude;
  const LocationMapSection({super.key, required this.latitude, required this.longitude});

  @override
  State<LocationMapSection> createState() => LocationMapSectionState();
}

class LocationMapSectionState extends State<LocationMapSection> {
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
      child: ClipRRect(
        borderRadius: BorderRadiusGeometry.circular(16),
        child: GoogleMap(
          mapType: MapType.terrain,
          initialCameraPosition: CameraPosition(target: LatLng(widget.latitude, widget.longitude), zoom: 14.4746),
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
      ),
    );
  }
}
