import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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
  GoogleMapController _mapController;
  final Set<Polyline> _polyline = {};
 /*  List<LatLng> latlngSegment1 = List();
  List<LatLng> latlngSegment2 = List(); */

  @override
  Widget build(BuildContext context) {
   /*  LatLng lat1 = (widget.list[widget.index]['rutaIniLatitud'].toDouble(),
        widget.list[widget.index]['rutaIniLongitud'].toDouble());
    LatLng lat2 = (widget.list[widget.index]['rutaFinLatitud'].toDouble(),
        widget.list[widget.index]['rutaFinLongitud'].toDouble()); */

   /*  latlngSegment1.add(lat1);
    //line segment 2
    latlngSegment2.add(lat2); */
    return Scaffold(
      appBar: AppBar(
        title: Text('Fasty - Delivery'),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: widget.list[widget.index]['rutaIniLatitud'],
          zoom: 12,
        ),
        markers: _createMarkers(),
        /* polylines: _polyline, */
        /* onMapCreated: _onMapCreated, */
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
        position: LatLng(widget.list[widget.index]['rutaIniLatitud'],
            widget.list[widget.index]['rutaIniLongitud']),
        infoWindow: InfoWindow(title: "Pizzeria"),
      ),
    );
    /* _polyline.add(Polyline(
      polylineId: PolylineId('fromPoint'),
      visible: true,
      //latlng is List<LatLng>
      points: latlngSegment1,
      width: 2,
      color: Colors.blue,
    )); */
    tmp.add(
      Marker(
        markerId: MarkerId("toPoint"),
        position: LatLng(widget.list[widget.index]['rutaFinLatitud'],
            widget.list[widget.index]['rutaFinLongitud']),
        infoWindow: InfoWindow(title: "Roca 123"),
      ),
    );
    /* _polyline.add(Polyline(
      polylineId: PolylineId('fromPoint'),
      visible: true,
      points: latlngSegment2,
      width: 2,
      color: Colors.blue,
    )); */
    return tmp;
  }

  /* void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    _centerView();
        
  }
  _centerView() async {
    await _mapController.getVisibleRegion();

  } */

}
