import 'package:flutter/material.dart';
import 'package:google_map_polyline/google_map_polyline.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission/permission.dart';
import 'package:tp/controllers/db_rutas.dart';

class DetalleRutas extends StatefulWidget {
  /* final LatLng fromPoint = LatLng(-38.956176, -67.920666);
  final LatLng toPoint = LatLng(-38.953724, -67.923921); */
  List list;
  int index;

  //var positio=[list[index]['rutaIniLatitud'],];
  DetalleRutas({this.index, this.list});

  @override
  _DetalleRutasState createState() => _DetalleRutasState();
}

class _DetalleRutasState extends State<DetalleRutas> {
  //get markers => _createMarkers();
  GoogleMapController _mapController;

  final Set<Polyline> polyline = {};

  List<LatLng> routeCoords;
  GoogleMapPolyline googleMapPolyline =
      new GoogleMapPolyline(apiKey: "AIzaSyDuwZFznM7Mt1YfdTkxZRtla8kSNNpF5rc");
  void onMapCreated(controller) {
    setState(() {
      mapController = controller;
      getsomePoints();
    });
  }

  getsomePoints() async {
    var permissions =
        await Permission.getPermissionsStatus([PermissionName.Location]);
    if (permissions[0].permissionStatus == PermissionStatus.notAgain) {
      var askpermissions =
          await Permission.requestPermissions([PermissionName.Location]);
    } else {
      routeCoords = await googleMapPolyline.getCoordinatesWithLocation(
          origin: LatLng(2.90989454, -75.27603149),
          destination: LatLng(2.91723251, -75.27603149),
          mode: RouteMode.driving);
    }
  }

  final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(2.92994034, -75.28075934),
    zoom: 15.0,
  );
  GoogleMapController mapController;

  String buscarDireccion;
  DbRutas dbRutas = new DbRutas();

  @override
  Widget build(BuildContext context) {
    /* final latitud = widget.list[widget.index]['rutaFinLatitud'].toDouble();
    final longitud = widget.list[widget.index]['rutaFinLongitud']; */
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.list[widget.index]['descripcion']}"),
        backgroundColor: Color(0xFF2a2e43),
      ),
      body: GoogleMap(
        onMapCreated: onMapCreated,
        polylines: polyline,
        initialCameraPosition: _kGooglePlex,
        markers: _createMarkers(),
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
      ),
    );
  }

  Set<Marker> _createMarkers() {
    var tmp = Set<Marker>();

    tmp.add(
      Marker(
        markerId: MarkerId("fromPoint"),
        position: LatLng(widget.list[widget.index]['rutaIniLatitud'].toDouble(),
            widget.list[widget.index]['rutaIniLongitud'].toDouble()),
        infoWindow: InfoWindow(title: "Pizzeria"),
      ),
    );
    tmp.add(
      Marker(
        markerId: MarkerId("toPoint"),
        position: LatLng(widget.list[widget.index]['rutaFinLatitud'].toDouble(),
            widget.list[widget.index]['rutaFinLongitud'].toDouble()),
        infoWindow: InfoWindow(title: "Roca 123"),
      ),
    );
    return tmp;
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    polyline.add(Polyline(
        polylineId: PolylineId('route1'),
        visible: true,
        points: routeCoords,
        width: 4,
        color: Colors.blue,
        startCap: Cap.roundCap,
        endCap: Cap.buttCap));
  }
}
