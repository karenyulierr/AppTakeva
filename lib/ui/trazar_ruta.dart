import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as maps;
import 'package:google_maps_webservice/directions.dart';

class DirectionProvider {
  GoogleMapsDirections directionsApi =
      GoogleMapsDirections(apiKey: "AIzaSyDNeemffjVc_VKcOThJ-6f8sBKUdS8QSsY");

  Set<maps.Polyline> _route = Set();

  Set<maps.Polyline> get currentRoute => _route;

  findDirections(maps.LatLng iniLa, maps.LatLng iniLo, maps.LatLng finLa,
      maps.LatLng finLo) async {
    var origin = Location(iniLa.latitude, iniLo.longitude);
    var destination = Location(finLa.latitude, finLo.longitude);

    var result = await directionsApi.directionsWithLocation(
      origin,
      destination,
      travelMode: TravelMode.driving,
    );

    Set<maps.Polyline> newRoute = Set();

    if (result.isOkay) {
      var route = result.routes[0];
      var leg = route.legs[0];

      List<maps.LatLng> points = [];

      leg.steps.forEach((step) {
        points.add(maps.LatLng(step.startLocation.lat, step.startLocation.lng));
        points.add(maps.LatLng(step.endLocation.lat, step.endLocation.lng));
      });

      var line = maps.Polyline(
        points: points,
        polylineId: maps.PolylineId("mejor ruta"),
        color: Colors.red,
        width: 4,
      );
      newRoute.add(line);

      print(line);

      _route = newRoute;
    } else {
      print("ERRROR !!! ${result.status}");
    }
  }
}
