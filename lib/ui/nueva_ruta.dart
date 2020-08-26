import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:google_maps_flutter/google_maps_flutter.dart';

class NuevaRuta extends StatefulWidget {
  @override
  _NuevaRutaState createState() => _NuevaRutaState();
  List list;
  int index;
  NuevaRuta({this.index, this.list});
}

class _NuevaRutaState extends State<NuevaRuta> {
  GoogleMapController _controller;
  Set<Marker> _markers = {};
  Set<Polyline> _polylines = {};
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();
  String googleAPIKey = "AIzaSyDNeemffjVc_VKcOThJ-6f8sBKUdS8QSsY";

  BitmapDescriptor sourceIcon;
  BitmapDescriptor destinationIcon;

  double pinPillPosition = -100;
/*   PinInformation currentlySelectedPin = PinInformation(
    pinPath: '',
    avatarPath: '',
    location: LatLng(0, 0),
    locationName: '',
    labelColor: Color(0xFFFF8A80),
  );
  PinInformation sourcePinInfo;
  PinInformation destinationPinInfo; */

  @override
  void initState() {
    super.initState();
    setSourceAndDestinationIcons();
  }

  void setSourceAndDestinationIcons() async {
    sourceIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5), "lib/images...");
    destinationIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5), "lib/images...");
  }

  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      SafeArea(
        child: GoogleMap(
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
          markers: _markers,
          initialCameraPosition: CameraPosition(
          target: LatLng(widget.list[widget.index]['rutaIniLatitud'],
              widget.list[widget.index]['rutaIniLongitud']),
          zoom: 10,
        ),
          polylines: _polylines,
          mapType: MapType.normal,
          zoomControlsEnabled: false,
          onMapCreated: _onMapCreated,
          /*onTap: (LatLng location) {
            setState(() {
              pinPillPosition = -100;
            });
          },*/
        ),
      ),
      /*   MapPinPillComponent(
          pinPillPosition: pinPillPosition,
          currentlySelectedPin: currentlySelectedPin) */
    ]);
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller = controller;
    setMapPins();
    setPolyline();
    _centrarMapa();
  }

  void setMapPins() {
    setState(() {
      _markers.add(Marker(
        markerId: MarkerId(widget.list[widget.index]['nombreRutaInicio']),
        position: LatLng(widget.list[widget.index]['rutaIniLatitud'],
            widget.list[widget.index]['rutaIniLongitud']),
                    infoWindow: InfoWindow(
            title: widget.list[widget.index]['nombreRutaInicio'].toString()),
        /*onTap: () {
          setState(() {
            print(pinPillPosition);
            // currentlySelectedPin = sourcePinInfo;
            pinPillPosition = 0;
          });
        },*/
      ));

      /*      sourcePinInfo = PinInformation(
          locationName: "StartLocation",
          location: SOURCE_LOCATION,
          pinPath: "lib/images/avatar",
          avatarPath: "libbb",
          labelColor: Colors.blueAccent); */

      //destino
      _markers.add(Marker(
        markerId: MarkerId(widget.list[widget.index]['nombreRutaFin']),
        position: LatLng(widget.list[widget.index]['rutaFinLatitud'],
            widget.list[widget.index]['rutaFinLongitud']),
                    infoWindow: InfoWindow(
            title: widget.list[widget.index]['nombreRutaFin'].toString()),
        /*onTap: () {
          setState(() {
            //  currentlySelectedPin = destinationPinInfo;
            pinPillPosition = 0;
          });
        },*/
      ));
      /*     destinationPinInfo = PinInformation(
          locationName: "End Location",
          location: DEST_LOCATION,
          pinPath: "lib/images/driving_pin.png",
          avatarPath: "lib/images/avatar_2.png",
          labelColor: Colors.purple); */
    });
  }

  void _centrarMapa() async {
    await _controller.getVisibleRegion();
    var left = min(LatLng(widget.list[widget.index]['rutaIniLatitud'],
            widget.list[widget.index]['rutaIniLongitud']).latitude, LatLng(widget.list[widget.index]['rutaFinLatitud'],
            widget.list[widget.index]['rutaFinLongitud']).latitude);
    var right = max(LatLng(widget.list[widget.index]['rutaIniLatitud'],
            widget.list[widget.index]['rutaIniLongitud']).latitude, LatLng(widget.list[widget.index]['rutaFinLatitud'],
            widget.list[widget.index]['rutaFinLongitud']).latitude);
    var top = max(LatLng(widget.list[widget.index]['rutaIniLatitud'],
            widget.list[widget.index]['rutaIniLongitud']).longitude, LatLng(widget.list[widget.index]['rutaFinLatitud'],
            widget.list[widget.index]['rutaFinLongitud']).longitude);
    var bottom = min(LatLng(widget.list[widget.index]['rutaIniLatitud'],
            widget.list[widget.index]['rutaIniLongitud']).longitude, LatLng(widget.list[widget.index]['rutaFinLatitud'],
            widget.list[widget.index]['rutaFinLongitud']).longitude);
    _controller.animateCamera(CameraUpdate.newLatLngBounds(
        LatLngBounds(
            southwest: LatLng(left, bottom), northeast: LatLng(right, top)),
        50));
  }

  void setPolyline() async {
    PolylineResult result = await polylinePoints?.getRouteBetweenCoordinates(
      googleAPIKey,
      PointLatLng(LatLng(widget.list[widget.index]['rutaIniLatitud'],
            widget.list[widget.index]['rutaIniLongitud']).latitude, LatLng(widget.list[widget.index]['rutaIniLatitud'],
            widget.list[widget.index]['rutaIniLongitud']).longitude),
      PointLatLng(LatLng(widget.list[widget.index]['rutaFinLatitud'],
            widget.list[widget.index]['rutaFinLongitud']).latitude, LatLng(widget.list[widget.index]['rutaFinLatitud'],
            widget.list[widget.index]['rutaFinLongitud']).longitude),
    );
    if (result.status.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }
    setState(() {
      Polyline polyline = Polyline(
        polylineId: PolylineId(widget.list[widget.index]['descripcion']),
        color: Color.fromARGB(255, 40, 122, 198),
        points: polylineCoordinates,
        endCap: Cap.roundCap,
        width: 4,
      ); //Polyline
      _polylines.add(polyline);
    });
  }
}
