import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class CalcularTiempo extends StatefulWidget {
  @override
  _CalcularTiempoState createState() => _CalcularTiempoState();
}

class _CalcularTiempoState extends State<CalcularTiempo> {
  barraBusqueda() {
    Geolocator().placemarkFromAddress(buscarDireccion).then((result) {
      mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
          target:
              LatLng(result[0].position.latitude, result[0].position.longitude),
          zoom: 18.0)));
    });
  }

  void onMapCreated(controller) {
    setState(() {
      mapController = controller;
    });
  }

  final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(2.92994034, -75.28075934),
    zoom: 15.0,
  );
  GoogleMapController mapController;

  String buscarDireccion;
  //Funcion que creamos para busqueda por direccion

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF53576e),
      appBar: AppBar(
        title: Text('Calcula tu tiempo'),
        backgroundColor: Color(0xFF2a2e43),
      ),
      body: Scaffold(
        body:
            //scrollDirection: Axis.vertical,
            //children: <Widget>[
            Container(
          height: 500.0,
          width: double.infinity,
          //scrollDirection: Axis.vertical,
          child: Stack(
            children: <Widget>[
              GoogleMap(
                onMapCreated: onMapCreated,
                initialCameraPosition: _kGooglePlex,
              ),
              Positioned(
                top: 30.0,
                right: 15.0,
                left: 15.0,
                child: Container(
                  height: 50.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white),
                  child: TextField(
                      decoration: InputDecoration(
                        hintText: 'A dónde quieres ir?',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(left: 15.0, top: 15.0),
                        suffixIcon: IconButton(
                            icon: IconButton(
                          icon: Icon(Icons.search),
                          onPressed: barraBusqueda,
                          iconSize: 30.0,
                        ), onPressed: () {  },),
                      ),
                      onChanged: (val) {
                        setState(() {
                          buscarDireccion = val + 'neiva';
                        });
                      }),
                ),
              )
            ],
          ),
        ),
        /*  SizedBox(
            height: 20.0,
          ), */
        /*  Container(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: Container(
                padding: EdgeInsets.all(14.0),
                height: 50,
                decoration: BoxDecoration(
                    color: Color(0xffEFEFEF),
                    borderRadius: BorderRadius.circular(14)),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(14.0),
                    ),
                    Icon(Icons.search),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "A dónde quieres ir?",
                      style: TextStyle(color: Colors.grey, fontSize: 19),
                    )
                  ],
                ),
              ),
            ),
          ),     /* SizedBox(
            height: 20.0,
          ), */
          Row(
            children: <Widget>[
              Container(
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      AspectRatio(
                          aspectRatio: 28.0 / 6.0,
                          child: Icon(Icons.departure_board,
                              size: 30.0, color: Color(0xFFc78900))),
                      Padding(
                        padding: EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: '00:00',
                                fillColor: Colors.white,
                              ),
                              obscureText: false,
                            ),
                            // SizedBox(height: 5.0),
                            Text(
                              'Llegada del bus al paradero',
                              style: TextStyle(
                                fontSize: 10.0,
                                color: Color(0xFF00031c),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //padding: EdgeInsets.only(left: 22),

              Container(
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      AspectRatio(
                          aspectRatio: 22.0 / 9.0,
                          child: Icon(Icons.access_time,
                              size: 30.0, color: Color(0xFFc78900))),
                      Padding(
                        padding: EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: '00:00',
                                fillColor: Colors.white,
                              ),
                              obscureText: false,
                            ),
                            SizedBox(height: 13.0),
                            Text(
                              'Tiempo de desplazamiento',
                              style: TextStyle(
                                fontSize: 15.0,
                                color: Color(0xFF00031c),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Container(
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      AspectRatio(
                          aspectRatio: 22.0 / 9.0,
                          child: Icon(Icons.transfer_within_a_station,
                              size: 30.0, color: Color(0xFFc78900))),
                      Padding(
                        padding: EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: '250m',
                                fillColor: Colors.white,
                              ),
                              obscureText: false,
                            ),
                            SizedBox(height: 13.0),
                            Text(
                              'Distancia en metros',
                              style: TextStyle(
                                fontSize: 15.0,
                                color: Color(0xFF00031c),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ), */
        //],
      ),
    );
  }
}
