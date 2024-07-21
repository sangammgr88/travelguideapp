import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import '../providers/destination_provider.dart';

class MapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DestinationProvider>(context);
    final destinations = provider.destinations;

    // Determine the initial camera position
    LatLng initialPosition =
        LatLng(0.0, 0.0); // Default position if no destinations are available

    if (destinations.isNotEmpty) {
      final firstDestination = destinations[0];
      // Ensure latitude and longitude are not null and have default values
      final latitude = firstDestination.latitude ?? 0.0;
      final longitude = firstDestination.longitude ?? 0.0;
      initialPosition = LatLng(latitude, longitude);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Map View'),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: initialPosition,
          zoom: 10,
        ),
        markers: destinations.map((destination) {
          final latitude = destination.latitude ?? 0.0;
          final longitude = destination.longitude ?? 0.0;
          return Marker(
            markerId: MarkerId(destination.id ?? 'default_id'),
            position: LatLng(latitude, longitude),
            infoWindow: InfoWindow(
              title: destination.name ?? 'No Name',
              snippet: destination.description ?? 'No Description',
            ),
          );
        }).toSet(),
      ),
    );
  }
}
