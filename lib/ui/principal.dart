import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter/material.dart';
import 'package:tp/ui/calificar_servicio.dart';
import 'package:tp/ui/calcular_tiempo.dart';
import 'package:tp/ui/rutas_fav.dart';
import 'package:tp/ui/ver_rutas.dart';
import 'package:tp/ui/ver_rutasMain.dart';
import 'login.dart';
void mainPasajero() {
  MaterialApp(
     theme: ThemeData(
        fontFamily: 'Raleway',
      ),
    debugShowCheckedModeBanner: false,
  );
}

class PrincipalPasajero extends StatefulWidget {
  static final routeName = 'home';
  @override
  _PrincipalPasajeroState createState() => _PrincipalPasajeroState();
}

class _PrincipalPasajeroState extends State<PrincipalPasajero> {
  SharedPreferences sharedPreferences;

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString("token") == null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => LoginPage()),
          (Route<dynamic> route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF53576e),
      appBar: AppBar(
        title: Text('TAKEVA'),
        backgroundColor: Color(0xFF2a2e43),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.exit_to_app,
              color: Colors.white,
            ),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext buildcontext) {
                    return AlertDialog(
                      title: Text("Alerta"),
                      content: Text("¿Desea cerrar sesión?"),
                      actions: <Widget>[
                        FlatButton(
                          child: Text("Sí"),
                          onPressed: () {
                            //  Auth.instance.logOut();
                            sharedPreferences.clear();
                            sharedPreferences.commit();
                            Navigator.of(buildcontext).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (BuildContext buildcontext) =>
                                        LoginPage()),
                                (Route<dynamic> route) => false);
                          },
                        ),
                        FlatButton(
                          child: Text("No"),
                          onPressed: () {
                            Navigator.pop(context, false);
                          },
                        )
                      ],
                    );
                  });
            },
            iconSize: 30.0,
          ),
        ],
      ),
      drawer: Drawer(
        child: Container(
          color: Color(0xFF2a2e43),
          child: ListView(
            //padding: EdgeInsets.zero,
            children: <Widget>[
              /*DrawerHeader(
              child: Text('Perfil'),
              decoration: BoxDecoration(
                color: Colors.orange[800],
              ),
            ),*/
              SizedBox(
                height: 8.0,
              ),
              ListTile(
                leading: Icon(
                  Icons.home,
                  size: 28.0,
                  color: Color(0xFFffb900),
                ),
                title: Text(
                  'Inicio',
                  style: TextStyle(
                    fontSize: 19.0,
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              Divider(
                color: Color(0xFFffb900),
              ),
              SizedBox(
                height: 8.0,
              ),
              ListTile(
                leading: Icon(
                  Icons.rv_hookup,
                  size: 30.0,
                  color: Color(0xFFffb900),
                ),
                title: Text('Ver rutas',
                    style: TextStyle(
                      fontSize: 19.0,
                      color: Colors.white,
                    )),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => VerRutasMain()));
                },
              ),
              Divider(
                color: Color(0xFFffb900),
              ),
              SizedBox(
                height: 8.0,
              ),
              ListTile(
                leading: Icon(
                  Icons.favorite,
                  size: 28.0,
                  color: Color(0xFFffb900),
                ),
                title: Text(
                  'Rutas favoritas',
                  style: TextStyle(
                    fontSize: 19.0,
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RutasFav()));
                },
              ),
              Divider(
                color: Color(0xFFffb900),
              ),
              SizedBox(
                height: 8.0,
              ),
              ListTile(
                leading: Icon(Icons.departure_board,
                    size: 28.0, color: Color(0xFFffb900)),
                title: Text(
                  'Calcula tu tiempo',
                  style: TextStyle(
                    fontSize: 19.0,
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CalcularTiempo()));
                },
              ),
              Divider(
                color: Color(0xFFffb900),
              ),
              SizedBox(
                height: 8.0,
              ),
              ListTile(
                leading: Icon(
                  Icons.check_box,
                  size: 28.0,
                  color: Color(0xFFffb900),
                ),
                title: Text(
                  'Calificar servicio',
                  style: TextStyle(
                    fontSize: 19.0,
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CalificarElServicioMain()));
                },
              ),
              Divider(
                color: Color(0xFFffb900),
              ),
              SizedBox(
                height: 8.0,
              ),
              ListTile(
                leading: Icon(
                  Icons.exit_to_app,
                  size: 28.0,
                  color: Color(0xFFffb900),
                ),
                title: Text(
                  'Cerrar sesión',
                  style: TextStyle(
                    fontSize: 19.0,
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext buildcontext) {
                        return AlertDialog(
                          title: Text("Alerta"),
                          content: Text("¿Desea cerrar sesión?"),
                          actions: <Widget>[
                            FlatButton(
                              child: Text("Sí"),
                              onPressed: () {
                                //  Auth.instance.logOut();
                                sharedPreferences.clear();
                                sharedPreferences.commit();
                                Navigator.of(buildcontext).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (BuildContext buildcontext) =>
                                            LoginPage()),
                                    (Route<dynamic> route) => false);
                              },
                            ),
                            FlatButton(
                              child: Text("No"),
                              onPressed: () {
                                Navigator.pop(context, false);
                              },
                            )
                          ],
                        );
                      });
                },
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(14.0, 35.0, 14.0, 0),
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Container(
              height: 130,
              child: Card(
                  elevation: 10.0,
                  color: Color(0xFFE1E2E1),
                  child: Center(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ListRutas()));
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const ListTile(
                            leading: Flexible(
                              // fixed width and height
                              child: Image(
                                image: AssetImage('assets/rutas.png'),
                              ),
                            ),
                            title: Text(
                              'Ver rutas',
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF00031c)),
                            ),
                            subtitle: Text(
                              'Consulta las rutas y escoge tus favoritas.',
                              style: TextStyle(
                                  fontSize: 16.0, color: Color(0xFF00031c)),
                            ),
                            trailing: Icon(Icons.keyboard_arrow_right),
                          ),
                        ],
                      ),
                    ),
                  ))),
          SizedBox(
            height: 20.0,
          ),
          Divider(color: Color(0xFFffb900)),
          SizedBox(
            height: 20.0,
          ),
          Container(
              height: 130,
              child: Card(
                  elevation: 10.0,
                  color: Color(0xFFE1E2E1),
                  child: Center(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RutasFav()));
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const ListTile(
                            leading: Flexible(
                              // fixed width and height
                              child: Image(
                                image: AssetImage('assets/favorito.png'),
                              ),
                            ),
                            title: Text(
                              'Rutas favoritas',
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF00031c)),
                            ),
                            subtitle: Text(
                              'Todas tus rutas favoritas.',
                              style: TextStyle(
                                  fontSize: 16.0, color: Color(0xFF00031c)),
                            ),
                            trailing: Icon(Icons.keyboard_arrow_right),
                          ),
                        ],
                      ),
                    ),
                  ))),
          SizedBox(
            height: 20.0,
          ),
          Divider(color: Color(0xFFffb900)),
          SizedBox(
            height: 20.0,
          ),
          Container(
              height: 130,
              child: Card(
                  elevation: 10.0,
                  color: Color(0xFFE1E2E1),
                  child: Center(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CalcularTiempo()));
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const ListTile(
                            leading: Flexible(
                              // fixed width and height
                              child: Image(
                                width: 55.0,
                                image: AssetImage('assets/calcular_tiempo.png'),
                              ),
                            ),
                            title: Text(
                              'Calcula tu tiempo',
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF00031c)),
                            ),
                            subtitle: Text(
                              'Haz el cálculo de tu distacia y tiempo previo a tu destino.',
                              style: TextStyle(
                                  fontSize: 16.0, color: Color(0xFF00031c)),
                            ),
                            trailing: Icon(Icons.keyboard_arrow_right),
                          ),
                        ],
                      ),
                    ),
                  ))),
          SizedBox(
            height: 20.0,
          ),
          Divider(color: Color(0xFFffb900)),
          SizedBox(
            height: 20.0,
          ),
          Container(
              height: 130,
              child: Card(
                  elevation: 10.0,
                  color: Color(0xFFE1E2E1),
                  child: Center(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    CalificarElServicioMain()));
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const ListTile(
                            leading: Flexible(
                              // fixed width and height
                              child: Image(
                                image:
                                    AssetImage('assets/calificar_servicio.png'),
                              ),
                            ),
                            title: Text(
                              'Calificar servicio',
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF00031c)),
                            ),
                            subtitle: Text(
                              'Ayuda a mejorar el servicio.',
                              style: TextStyle(
                                  fontSize: 16.0, color: Color(0xFF00031c)),
                            ),
                            trailing: Icon(Icons.keyboard_arrow_right),
                          ),
                        ],
                      ),
                    ),
                  ))),
          SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }
}
