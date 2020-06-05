import 'package:flutter/material.dart';

class RecuperarContrasena extends StatefulWidget {
  RecuperarContrasena({Key key}) : super(key: key);

  @override
  _RecuperarContrasenaState createState() => _RecuperarContrasenaState();
}

class _RecuperarContrasenaState extends State<RecuperarContrasena> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF53576e),
      appBar: AppBar(
        title: Text('Recuperar contraseña'),
        backgroundColor: Color(0xFF2a2e43),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(10.0, 85.0, 10.0, 0),
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Container(
            child: Card(
                color: Color(0xFFE1E2E1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                //padding: EdgeInsets.fromLTRB(25.0, 0, 16.0, 13.0),
                child: Center(
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 18.0),
                      AspectRatio(
                        aspectRatio: 22.0 / 8.0,
                        child: Image.asset('assets/recuperar.png'),
                      ),
                       SizedBox(height: 18.0),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              '¿Olvidaste la contraseña?',
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Color(0xFF00031c),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 28.0),
                            Text(
                              'Introduce el correo electrónico con el que accedes a Takeva. En unos minutos recibirás un correo para realizar el cambio.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 15.0,
                                color: Color(0xFF00031c),
                              ),
                            ),
                            SizedBox(height: 38.0),
                            TextFormField(
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                labelText: 'Correo electrónico',
                                icon: Icon(
                                  Icons.email,
                                  color: Color(0xFFc78900),
                                ),
                              ),
                              
                            ),
                          SizedBox(height: 18.0),
                            RaisedButton(
                              child: Text(
                                'ENVIAR',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              color: Color(0xFFffb900),
                              onPressed: () {
                                // TODO: Show the next page (101)
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                             SizedBox(height: 18.0),
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
