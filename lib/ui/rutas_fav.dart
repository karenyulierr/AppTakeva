import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp/controllers/favoritosProvider.dart';
import 'package:tp/ui/nueva_ruta.dart';

class RutasFav extends StatefulWidget {
  final FavoritosProvider favoritosProvider;
  RutasFav({Key key,this.favoritosProvider}) : super(key: key);
  
  static create({BuildContext context}) {
    final providerFav = Provider.of<FavoritosProvider>(context);
    return RutasFav(
      favoritosProvider: providerFav,
    );
  }

  @override
  _RutasFavState createState() => _RutasFavState();
}

class _RutasFavState extends State<RutasFav> {
  FavoritosProvider _favoritosProvider;
  List dataFavoritos = [];
  List nuevoData = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _favoritosProvider = widget.favoritosProvider;
    dataFavoritos = _favoritosProvider.favoritos;
  }

  @override
  Widget build(BuildContext context) {
    //_favoritosProvider = Provider.of<FavoritosProvider>(context);
    //dataFavoritos = _favoritosProvider.favoritos;
    return Scaffold(
      backgroundColor: Color(0xFF53576e),
      appBar: AppBar(
        title: Text('Rutas favoritas'),
        backgroundColor: Color(0xFF2a2e43),
      ),
      body: listaFavoritos(),
    );
  }

  Widget listaFavoritos() {
    Widget widget;
    List favoritoList = dataFavoritos;

    if (favoritoList.isEmpty) {
      widget = ListView(
        children: <Widget>[
          textFieldBuscar(context),
          SizedBox(height:23),
          Container(
            height: MediaQuery.of(context).size.height*0.6 ,
            child: Center(
              child: Text(
                "No hay favoritos",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      );
    } else {
      widget = ListView.builder(
          itemCount: favoritoList.length,
          itemBuilder: (context, i) {
            if (i == 0) {
              return Column(
                children: <Widget>[
                  textFieldBuscar(context),
                  SizedBox(height:23),
                  cardFavorito(favoritoList[i], i, context)
                ],
              );
            }
            return cardFavorito(favoritoList[i], i, context);
          });
    }
    /*
    for (var ruta in favoritos.favoritos) {
      widgetList.add(Container(
        padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
        child: Column(
          children: <Widget>[
            Card(
              elevation: 10.0,
              child: ListTile(
                  title: Text(
                      "Ruta " +
                          ruta['codigo'].toString() +
                          ": " +
                          ruta['barrio_inicia']['descripcion'].toString() +
                          " - " +
                          ruta['barrio_termina']['descripcion'].toString(),
                      style: TextStyle(
                        color: Color(0xFF2a2e43),
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      )),
                  leading: Icon(Icons.directions_bus),
                  subtitle: Text(ruta['descripcion']),
                  trailing: IconButton(
                    icon: Icon(Icons.favorite),
                    color: Colors.red,
                    onPressed: () {
                      favoritos.gestionarFavorito(ruta);
                    },
                  ),
                  onTap: () => Navigator.of(context).push(
                        new MaterialPageRoute(
                            builder: (BuildContext context) => new NuevaRuta(
                                  list: [ruta],
                                  index: 0,
                                )),
                      )),
            ),
          ],
        ),
      ));
    }*/

    return widget;
  }

  Container textFieldBuscar(BuildContext context) {
    return Container(
                  height: 50.0,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white),
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey[400],
                          width: 2,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                        borderSide: BorderSide(
                          color: Colors.blue[300],
                          width: 2,
                        ),
                      ),
                      hintText: "Ingresa la direccion",
                    ),
                    onChanged: (String value) {
                      if(value.isEmpty)
                        dataFavoritos = _favoritosProvider.favoritos;
                      else
                        dataFavoritos = _favoritosProvider.favoritos.where((val) => ("Ruta " + val['codigo'].toString()+ " "+val['descripcion']).toLowerCase().contains(value.toLowerCase())).toList();
                      if(dataFavoritos.isEmpty)
                        dataFavoritos = _favoritosProvider.favoritos;

                      setState(() {
                      });
                    },
                  ),
                );
  }

  Container cardFavorito(Map favorito, int i, BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
      child: Column(
        children: <Widget>[
          Card(
            elevation: 10.0,
            child: ListTile(
                title: Text("Ruta " + favorito['codigo'].toString(),
                    style: TextStyle(
                      color: Color(0xFF2a2e43),
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    )),
                leading: Icon(Icons.directions_bus),
                subtitle: Text(
                  favorito['descripcion'],
                  style: TextStyle(fontSize: 13),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.favorite),
                  color: Colors.red,
                  onPressed: () {
                    _favoritosProvider.gestionarFavorito(favorito);
                    dataFavoritos = _favoritosProvider.favoritos;
                    setState(() {
                      
                    });
                  },
                ),
                onTap: () => Navigator.of(context).push(
                      new MaterialPageRoute(
                          builder: (BuildContext context) => new NuevaRuta(
                                list: [favorito],
                                index: 0,
                              )),
                    )),
          ),
        ],
      ),
    );
  }
}
