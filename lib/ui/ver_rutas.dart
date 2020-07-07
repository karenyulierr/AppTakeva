import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class VerRutas extends StatefulWidget {
  VerRutas({Key key}) : super(key: key);

  @override
  _VerRutasState createState() => _VerRutasState();
}

class _VerRutasState extends State<VerRutas> {
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

  GoogleMapController mapController;

  String buscarDireccion;
  //Funcion que creamos para busqueda por direccion
 final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(2.92994034, -75.28075934),
    zoom: 15.0,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF53576e),
        appBar: AppBar(
          title: Text('Rutas'),
          backgroundColor: Color(0xFF2a2e43),
        ),
        body: ListView(
          children: <Widget>[
            Container(
              height: 260.0,
              //scrollDirection: Axis.vertical,
              child: Stack(
                children: <Widget>[
                  GoogleMap(
                    onMapCreated: onMapCreated,
                    initialCameraPosition: _kGooglePlex,
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
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
                      )),
                    ),
                    onChanged: (val) {
                      setState(() {
                        buscarDireccion = val + 'neiva';
                      });
                    }),
              ),
            ),
            SizedBox(height: 8.0),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                children: <Widget>[
                  Card(
                    elevation: 10.0,
                    child: ListTile(
                      title: Text('Ruta 1',
                          style: TextStyle(
                            color: Color(0xFF2a2e43),
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          )),
                      leading: Icon(Icons.directions_bus),
                      subtitle: Text('Vía Fortalecillas'),
                      trailing: Icon(
                        // Add the lines from here...
                        Icons.favorite_border,
                      ), // ... to here.
                    ),
                  ),
                  Card(
                    elevation: 10.0,
                    child: ListTile(
                      title: Text('Ruta 2',
                          style: TextStyle(
                            color: Color(0xFF2a2e43),
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          )),
                      leading: Icon(Icons.directions_bus),
                      subtitle: Text('Vía comuneros'),
                      trailing: Icon(
                        // Add the lines from here...
                        Icons.favorite,
                        color: Colors.red,
                      ), // ... to here.
                    ),
                  ),
                  Card(
                    elevation: 10.0,
                    child: ListTile(
                      title: Text('Ruta 3 ',
                          style: TextStyle(
                            color: Color(0xFF2a2e43),
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          )),
                      leading: Icon(Icons.directions_bus),
                      subtitle: Text('Vía Norte'),
                      trailing: Icon(
                        // Add the lines from here...
                        Icons.favorite_border,
                      ), // ... to here.
                    ),
                  ),
                  Card(
                    elevation: 10.0,
                    child: ListTile(
                      title: Text('Ruta 4 ',
                          style: TextStyle(
                            color: Color(0xFF2a2e43),
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          )),
                      leading: Icon(Icons.directions_bus),
                      subtitle: Text('Vía Norte'),
                      trailing: Icon(
                        // Add the lines from here...
                        Icons.favorite_border,
                      ), // ... to here.
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
