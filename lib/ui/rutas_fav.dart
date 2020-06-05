import 'package:flutter/material.dart';

class RutasFav extends StatefulWidget {
  RutasFav({Key key}) : super(key: key);

  @override
  _RutasFavState createState() => _RutasFavState();
}

class _RutasFavState extends State<RutasFav> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF53576e),
        appBar: AppBar(
          title: Text('Rutas favoritas'),
          backgroundColor: Color(0xFF2a2e43),
        ),
        body: ListView(
          children: <Widget>[
            SizedBox(
              child: Image(
                image: AssetImage('assets/rutasFav.jpeg'),
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

                ],
              ),
            ),
          ],
        ));
  }
}
