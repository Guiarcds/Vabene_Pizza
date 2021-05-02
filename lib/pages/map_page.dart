import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  double latitude;
  double longitude;

  MapPage({this.latitude, this.longitude});

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Completer<GoogleMapController> _controller = Completer();
  List<Marker> markers = [];
  static CameraPosition _kGooglePlex;

  @override
  void initState() {
    super.initState();
    _kGooglePlex = CameraPosition(
      target: LatLng(widget.latitude, widget.longitude),
      zoom: 14.4746,
    );
    markers.add(Marker(
      markerId: MarkerId('myMarker'),
      draggable: false,
      onTap: () {
        print('Tap');
      },
      position: LatLng(widget.latitude, widget.longitude),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: mapButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      body: mapArea(),
    );
  }

  mapArea() {
    return SafeArea(
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        markers: Set.from(markers),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }

  mapButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        backgroundColor: Color(0xffDE0D18),
        elevation: 10,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
