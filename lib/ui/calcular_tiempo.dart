import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CalcularTiempo extends StatefulWidget {
  @override
  _CalcularTiempoState createState() => _CalcularTiempoState();
}

class _CalcularTiempoState extends State<CalcularTiempo> {
  final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF53576e),
        appBar: AppBar(
          title: Text('Calcula tu tiempo'),
          backgroundColor: Color(0xFF2a2e43),
        ),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
         Container(
        
          height: 260.0,
          //scrollDirection: Axis.vertical,
          child: Stack(
             children: <Widget>[
               GoogleMap(
                initialCameraPosition: _kGooglePlex,
              ),
          ],),
        ),
            SizedBox(
              height: 8.0,
            ),
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
                      "A dónde quieres ir?",
                      style: TextStyle(color: Colors.grey, fontSize: 19),
                    )
                  ],
                ),
              ),
            ),

            /// Best Selling

            Container(
              height: 470,
              //padding: EdgeInsets.only(left: 22),
              child: GridView.count(
                crossAxisCount: 2,

                padding: EdgeInsets.all(14.0),
                childAspectRatio: 8.0 / 9.0,

                // TODO: Build a grid of cards (102)
                children: <Widget>[
                  Card(
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        AspectRatio(
                            aspectRatio: 22.0 / 9.0,
                            child: Icon(Icons.departure_board,
                                size: 48.0, color: Color(0xFFc78900))),
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
                                'Llegada del bus al paradero',
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
                  Card(
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        AspectRatio(
                            aspectRatio: 22.0 / 9.0,
                            child: Icon(Icons.access_time,
                                size: 48.0, color: Color(0xFFc78900))),
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
                  Card(
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        AspectRatio(
                            aspectRatio: 22.0 / 9.0,
                            child: Icon(Icons.transfer_within_a_station,
                                size: 48.0, color: Color(0xFFc78900))),
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
                ],
              ),
            ),
          ],
        ));
  }
}
