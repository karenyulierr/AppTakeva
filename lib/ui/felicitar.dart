import 'package:flutter/material.dart';

class Felicitar extends StatefulWidget {
  @override
  _FelicitarState createState() => _FelicitarState();
}

bool item6 = false;
bool item7 = false;
bool item8 = false;
bool item9 = false;
bool item10 = false;

int valor6=0;
int valor7=0;
int valor8=0;
int valor9=0;
int valor10=0;

class _FelicitarState extends State<Felicitar> {
  final TextEditingController _otraController = new TextEditingController();
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
                          value: item6,
                          onChanged: (bool value) {
                            //print(value);
                            setState(() {
                              if(value == true){
                                valor6 = 1;
                              }else{
                                valor6 = 0;
                              }
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
                          value: item7,
                          onChanged: (bool value) {
                            //print(value);
                            setState(() {
                              if(value == true){
                                valor7 = 1;
                              }else{
                                valor7 = 0;
                              }
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
                          value: item8,
                          onChanged: (bool value) {
                            //print(value);
                            setState(() {
                              if(value == true){
                                valor8 = 1;
                              }else{
                                valor8 = 0;
                              }
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
                          value: item9,
                          onChanged: (bool value) {
                            //print(value);
                            setState(() {
                              if(value == true){
                                valor9 = 1;
                              }else{
                                valor9 = 0;
                              }
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
                          value: item10,
                          onChanged: (bool value) {
                            //print(value);
                            setState(() {
                              if(value == true){
                                valor10 = 1;
                              }else{
                                valor10 = 0;
                              }
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
                        controller: _otraController,
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