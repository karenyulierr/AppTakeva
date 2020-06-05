import 'package:flutter/material.dart';

class Felicitar extends StatefulWidget {
  @override
  _FelicitarState createState() => _FelicitarState();
}

bool item1 = false;
bool item2 = false;
bool item3 = false;
bool item4 = false;
bool item5 = false;
bool item6 = false;

class _FelicitarState extends State<Felicitar> {
  TextStyle estiloTexto = new TextStyle(fontSize: 18, color: Color(0xFF00031c));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF53576e),
        appBar: AppBar(
          title: Text('Felicitar'),
          backgroundColor: Color(0xFF2a2e43),
        ),
        body: ListView(children: <Widget>[
          Container(
              padding: const EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
              height: 690,
              child: Card(
                color: Color(0xFFE1E2E1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  children: <Widget>[
                    // [Monday] checkbox
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
                    ),
                    SizedBox(
                      height: 18.0,
                    ),
                    AspectRatio(
                      aspectRatio: 24 / 8.0,
                      child: Image.asset('assets/felicitar.png'),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Flexible(
                    child: Text(
                      'Seleccione los ítems necesarios para calificar el servicio: ',
                      style: estiloTexto,textAlign: TextAlign.center,
                    ),),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: <Widget>[
                        Checkbox(
                          value: item1,
                          onChanged: (bool value) {
                            setState(() {
                              item1 = value;
                            });
                          },
                        ),
                       Flexible(
                        child:Text(
                          "Trato amable y cordial",
                          style: estiloTexto,
                        ),),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // [Tuesday] checkbox
                    Row(
                      children: <Widget>[
                        Checkbox(
                          value: item2,
                          onChanged: (bool value) {
                            setState(() {
                              item2 = value;
                            });
                          },
                        ),
                          Flexible(
                        child:Text(
                          "Conduce con prudencia",
                          style: estiloTexto,
                        ),),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[
                        Checkbox(
                          value: item3,
                          onChanged: (bool value) {
                            setState(() {
                              item3 = value;
                            });
                          },
                        ),
                          Flexible(
                        child:Text(
                          "Respeta las señales de tránsito",
                          style: estiloTexto,
                        ),),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[
                        Checkbox(
                          value: item4,
                          onChanged: (bool value) {
                            setState(() {
                              item4 = value;
                            });
                          },
                        ),
                         Flexible(
                        child:Text(
                          "Vehículo limpio",
                          style: estiloTexto,
                        ),),
                      ],
                    ),

                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[
                        Checkbox(
                          value: item5,
                          onChanged: (bool value) {
                            setState(() {
                              item5 = value;
                            });
                          },
                        ),
                          Flexible(
                        child:Text(
                          "Viaje agradable, tranquilo y seguro",
                          style: estiloTexto,
                        ),),
                      ],
                    ),

                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TextFormField(
                        maxLines: 4,
                        decoration: InputDecoration(
                          hintText: 'Añadir otra calificación',
                          fillColor: Colors.white,
                        ),
                      ),
                    ),

                    SizedBox(height: 12.0),
                    RaisedButton(
                      child: Text(
                        'FELICITAR',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      color: Color(0xFFffb900),
                      onPressed: () {
                        // TODO: Show the next page (101)
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ],
                ),
              ))
        ]));
  }
}
