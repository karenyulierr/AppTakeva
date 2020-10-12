import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';
import 'package:http/http.dart' as http;


import 'package:tp/ui/nueva_ruta.dart';

//ServerController _serverController = ServerController();

class ListRutas extends StatefulWidget {
  @override
  _ListRutasState createState() => _ListRutasState();
}

class _ListRutasState extends State<ListRutas> {
  List data;

  Future<List> getData() async {
    final response = await http.get("http://192.168.0.6:8000/api/rutas");
    return json.decode(response.body);
  }

  @override
  void initState() {
    super.initState();
    this.getData();
  }

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

  final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(2.92994034, -75.28075934),
    zoom: 15.0,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF53576e),
      appBar: AppBar(
        title: Text("Rutas"),
        backgroundColor: Color(0xFF2a2e43),
      ),
      body: FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? ItemList(
                  list: snapshot.data,
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
      //])
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;
  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return Container(
          padding: const EdgeInsets.all(10.0),
          child: GestureDetector(
            onTap: () => Navigator.of(context).push(
              new MaterialPageRoute(
                  builder: (BuildContext context) => new NuevaRuta(
                        list: list,
                        index: i,
                      )),
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Card(
                  elevation: 10.0,
                  child: ListTile(
                    title: Text(
                      "Ruta " +
                          list[i]['codigo'].toString() +
                          ": " +
                          list[i]['barrio_inicia']['descripcion'].toString() +
                          " - " +
                          list[i]['barrio_termina']['descripcion'].toString(),
                      style: TextStyle(
                        color: Color(0xFF2a2e43),
                        fontSize: 18.0,

                      ),
                    ),
                    leading:
                        Icon(Icons.directions_bus, color: Color(0xFFc78900)),
                    trailing: Icon(Icons.keyboard_arrow_right),
                  ),
                    ),
                ]),
          ),
        );
      },
    );
  }
}
