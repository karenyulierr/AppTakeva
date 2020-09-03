import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tp/Models/pinInformation.dart';
import 'package:tp/conf/favorito.dart';


class NuevaRuta extends StatefulWidget {
 // ServerController serverController;
  @override
  _NuevaRutaState createState() => _NuevaRutaState();
  List list;
  int index;
  NuevaRuta({this.index, this.list, });
}

class _NuevaRutaState extends State<NuevaRuta> {
  bool favorito;
  GoogleMapController _controller;
  Set<Marker> _markers = {};
  Set<Polyline> _polylines = {};
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();
  String googleAPIKey = "AIzaSyDNeemffjVc_VKcOThJ-6f8sBKUdS8QSsY";

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF53576e),
        appBar: AppBar(
          title: Text(
            "Ruta " +
                widget.list[widget.index]['codigo'].toString() +
                ": " +
                widget.list[widget.index]['nombreRutaInicio'].toString() +
                " - " +
                widget.list[widget.index]['nombreRutaFin'].toString(),
          ),
          backgroundColor: Color(0xFF2a2e43),
          actions: <Widget>[
          // getFavoriteWidget(),
          ],
        ),
        body: Stack(children: <Widget>[
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
            ),
          ),
        ]));

  }
  
    
  void _onMapCreated(GoogleMapController controller) {
    _controller = controller;
    setMapPins();
    setPolylines();
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
      ));
      //destino
      _markers.add(Marker(
        markerId: MarkerId(widget.list[widget.index]['nombreRutaFin']),
        position: LatLng(widget.list[widget.index]['rutaFinLatitud'],
            widget.list[widget.index]['rutaFinLongitud']),
        infoWindow: InfoWindow(
            title: widget.list[widget.index]['nombreRutaFin'].toString()),
      ));
    });
  }

  void _centrarMapa() async {
    await _controller.getVisibleRegion();
    var left = min(
        LatLng(widget.list[widget.index]['rutaIniLatitud'],
                widget.list[widget.index]['rutaIniLongitud'])
            .latitude,
        LatLng(widget.list[widget.index]['rutaFinLatitud'],
                widget.list[widget.index]['rutaFinLongitud'])
            .latitude);
    var right = max(
        LatLng(widget.list[widget.index]['rutaIniLatitud'],
                widget.list[widget.index]['rutaIniLongitud'])
            .latitude,
        LatLng(widget.list[widget.index]['rutaFinLatitud'],
                widget.list[widget.index]['rutaFinLongitud'])
            .latitude);
    var top = max(
        LatLng(widget.list[widget.index]['rutaIniLatitud'],
                widget.list[widget.index]['rutaIniLongitud'])
            .longitude,
        LatLng(widget.list[widget.index]['rutaFinLatitud'],
                widget.list[widget.index]['rutaFinLongitud'])
            .longitude);
    var bottom = min(
        LatLng(widget.list[widget.index]['rutaIniLatitud'],
                widget.list[widget.index]['rutaIniLongitud'])
            .longitude,
        LatLng(widget.list[widget.index]['rutaFinLatitud'],
                widget.list[widget.index]['rutaFinLongitud'])
            .longitude);
    _controller.animateCamera(CameraUpdate.newLatLngBounds(
        LatLngBounds(
            southwest: LatLng(left, bottom), northeast: LatLng(right, top)),
        50));
  }

  void setPolylines() async {
    List<PointLatLng>  pathLines = polylinePoints?.decodePolyline(widget.list[widget.index]['ruta']);
    /*PolylineResult result = await polylinePoints?.getRouteBetweenCoordinates(
      googleAPIKey,
      PointLatLng(SOURCE_LOCATION.latitude, SOURCE_LOCATION.longitude),
      PointLatLng(DEST_LOCATION.latitude, DEST_LOCATION.longitude),
    );*/
    if (pathLines.length > 0) {
      // loop through all PointLatLng points and convert them
      // to a list of LatLng, required by the Polyline
      pathLines.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }
    setState(() {
      // create a Polyline instance
      // with an id, an RGB color and the list of LatLng pairs
      Polyline polyline = Polyline(
        polylineId: PolylineId("poly"),
        color: Color.fromARGB(255, 40, 122, 198),
        points: polylineCoordinates,
        endCap: Cap.roundCap,
        startCap: Cap.roundCap,
        width: 4,
      );

      // add the constructed polyline as a set of points
      // to the polyline set, which will eventually
      // end up showing up on the map
      _polylines.add(polyline);
    });
  }
 /*  Widget getFavoriteWidget() {
    if (favorito != null) {
      if (favorito) {
        return IconButton(
          icon: Icon(Icons.favorite),
          color: Colors.red,
          onPressed: () async {
            await widget.serverController.deleteFavorite(widget.recipe);
            setState(() {
              favorito = false;
            });
          },
        );
      } else {
        return IconButton(
          icon: Icon(Icons.favorite_border),
          color: Colors.white,
          onPressed: () async {
            await widget.serverController.addFavorite(widget.recipe);
            setState(() {
              favorito = true;
            });
          },
        );
      }
    } else {
      return Container(
          margin: EdgeInsets.all(15),
          width: 30,
          child: CircularProgressIndicator());
    }
  }
    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadState();
  }

  void loadState() async {
    final state = await widget.serverController.getIsFavorite(widget.recipe);
    setState(() {
      this.favorite = state;
    });
  } */

}
  