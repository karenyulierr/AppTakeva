import 'package:flutter/material.dart';
import 'package:tp/controllers/db_estadist.dart';

class Denunciar extends StatefulWidget {
  @override
  _CalificarElServcioMainState createState() => _CalificarElServcioMainState();
}

class _CalificarElServcioMainState extends State<Denunciar> {

   DbRegisterEstadist registerEstadist= new DbRegisterEstadist();
  final _formKey = GlobalKey<FormState>();
  bool item1 = false;
  bool item2 = false;
  bool item3 = false;
  bool item4 = false;
  bool item5 = false;

  int valor1=0;
  int valor2=0;
  int valor3=0;
  int valor4=0;
  int valor5=0;
  final snackBar = SnackBar(content: Text('Registro exitoso!'));
  
 final TextEditingController _otraController = new TextEditingController();
  TextStyle estiloTexto = new TextStyle(fontSize: 18, color: Color(0xFF00031c));
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
        backgroundColor: Color(0xFF53576e),
        appBar: AppBar(
          title: Text('Denunciar'),
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
                      child: Image.asset('assets/denunciar.png'),
                    ),
                    Flexible(
                      child: Text(
                        'Seleccione los ítems según la inconformidad: ',
                        style: estiloTexto,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: <Widget>[
                        Checkbox(
                          value: item1,
                          onChanged: (bool value) {
                            //print(value);
                           value=true;
                          },
                        ),
                        Flexible(
                          child: Text(
                            "Exceso de velocidad",
                            style: estiloTexto,
                          ),
                        ),
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
                            //print(value);
                            setState(() {
                              if(value == true){
                                valor2 = 1;
                              }else{
                                valor2 = 0;
                              }
                            });
                          },
                        ),
                        Flexible(
                          child: Text(
                            "Habla por celular",
                            style: estiloTexto,
                          ),
                        ),
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
                            //print(value);
                            setState(() {
                              if(value == true){
                                valor3 = 1;
                              }else{
                                valor3 = 0;
                              }
                            });
                          },
                        ),
                        Flexible(
                          child: Text(
                            "Tanquea con pasajeros a bordo",
                            style: estiloTexto,
                          ),
                        ),
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
                            //print(value);
                            setState(() {
                              if(value == true){
                                valor4 = 1;
                              }else{
                                valor4 = 0;
                              }
                            });
                          },
                        ),
                        Flexible(
                          child: Text(
                            "Omite señales de tránsito",
                            style: estiloTexto,
                          ),
                        ),
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
                            //print(value);
                            setState(() {
                              if(value == true){
                                valor5 = 1;
                              }else{
                                valor5 = 0;
                              }
                            });
                          },
                        ),
                        Flexible(
                          child: Text(
                            "Conduce con brusquedad",
                            style: estiloTexto,
                          ),
                        ),
                      ],
                    ),

                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TextFormField(
                        controller: _otraController,
                        maxLines: 4,
                        decoration: InputDecoration(
                          hintText: 'Añadir otra denuncia',
                          fillColor: Colors.white,
                        ),
                      ),
                    ),

                    SizedBox(height: 12.0),
                    RaisedButton(
                      child: Text(
                        'DENUNCIAR',
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