import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class VerRutas extends StatefulWidget {
  VerRutas({Key key}) : super(key: key);

  @override
  _VerRutasState createState() => _VerRutasState();
}

class _VerRutasState extends State<VerRutas> {
  final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
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
                    initialCameraPosition: _kGooglePlex,
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.0),
            Padding(
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
                      "Busca tu ruta",
                      style: TextStyle(color: Colors.grey, fontSize: 19),
                    )
                  ],
                ),
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
