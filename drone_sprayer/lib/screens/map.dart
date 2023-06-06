import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../widgets/drawer.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => LocationState();
}

class LocationState extends State<Location> {
  final Completer<GoogleMapController> completer = Completer();
  GoogleMapController? mapController;
  Set<Polygon> selectedPolygons = {};
  List<LatLng> selectedPoints = [];
  bool isSelectingArea = false;

  static const CameraPosition _uaf = CameraPosition(
    target: LatLng(31.4278, 73.0758),
    zoom: 14.4746,
  );

  final List<Marker> _marker = <Marker>[];

  

  @override
  void initState() {
    userLocation();
    super.initState();
  }

  @override
  void dispose() {
    userLocation();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map'),
      ),
      drawer: const MyDrawer(),
      body: Column(
        children: [
          Expanded(
            child: GoogleMap(
              minMaxZoomPreference: MinMaxZoomPreference.unbounded,
              compassEnabled: true,
              mapToolbarEnabled: false,
              zoomControlsEnabled: false,
              myLocationButtonEnabled: false,
              myLocationEnabled: true,
              mapType: MapType.hybrid,
              initialCameraPosition: _uaf,
              markers: Set<Marker>.of(_marker),
              onMapCreated: (GoogleMapController controller) {
                completer.complete(controller);
                setState(() {
                  mapController = controller;
                });
              },
              polygons: selectedPolygons,
              onTap: (LatLng latLng) {
                if (isSelectingArea = true) {
                  setState(() {
                    selectedPoints.add(latLng);
                    _updateSelectedPolygon();
                  });
                }
              },
            ),
          ),
          Container(
            alignment: Alignment.center,
            color: Colors.white54,
            height: 40,
            child: const Text('Tap on the map to select your field area'),
          ),
          Container(
            height: 60,
            color: Colors.teal,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      _toggleSelectingArea();
                    },
                    icon: const Icon(Icons.delete),
                    label: const Text('Delete'),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.teal),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          userLocation();
        },
        foregroundColor: Colors.teal,
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.my_location,
        ),
      ),
    );
  }

  void _toggleSelectingArea() {
    setState(() {
      isSelectingArea = !isSelectingArea;
      if (!isSelectingArea) {
        selectedPoints.clear();
        selectedPolygons.clear();
      }
    });
  }

  void _updateSelectedPolygon() {
      List<LatLng> convexHull = _calculateConvexHull();

      setState(() {
        selectedPolygons.clear();
        selectedPolygons.add(
          Polygon(
            polygonId: const PolygonId('selected_area'),
            points: convexHull,
            strokeWidth: 2,
            strokeColor: Colors.red,
            fillColor: Colors.red.withOpacity(0.3),
          ),
        );
      });
    
  }

  List<LatLng> _calculateConvexHull() {
    List<LatLng> convexHull = [];

    // Find the leftmost point
    LatLng leftmostPoint =
        selectedPoints.reduce((a, b) => a.longitude < b.longitude ? a : b);

    LatLng currentPoint = leftmostPoint;
    LatLng? nextPoint;

    do {
      convexHull.add(currentPoint);

      nextPoint = selectedPoints[0];

      for (int i = 1; i < selectedPoints.length; i++) {
        if (nextPoint == currentPoint ||
            _isLeft(currentPoint, nextPoint!, selectedPoints[i]) > 0) {
          nextPoint = selectedPoints[i];
        }
      }

      currentPoint = nextPoint!;
    } while (currentPoint != leftmostPoint);

    return convexHull;
  }

  double _isLeft(LatLng a, LatLng b, LatLng c) {
    return (b.longitude - a.longitude) * (c.latitude - a.latitude) -
        (c.longitude - a.longitude) * (b.latitude - a.latitude);
  }
  

  void userLocation() {
    _getCurrentLocation().then((value) async {
      CameraPosition newPosition = CameraPosition(
        zoom: 16,
        target: LatLng(value.latitude, value.longitude),
      );

      final GoogleMapController controller = await completer.future;

      controller.animateCamera(CameraUpdate.newCameraPosition(newPosition));

      setState(() {});
    });
  }

  Future<Position> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }
}
