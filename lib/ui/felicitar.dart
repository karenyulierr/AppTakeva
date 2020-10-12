import 'package:flutter/material.dart';
import 'package:tp/Models/FormularioFelicitarModel.dart';

class Felicitar extends StatefulWidget {
  @override
  _FelicitarState createState() => _FelicitarState();
}

class _FelicitarState extends State<Felicitar> {
  List<FormularioFelicitarModel> felicitarList;
  FormularioFelicitarModel selectedFelicitar;

  setFormularioFelicitarModel(FormularioFelicitarModel felicitar) {
    setState(() {
      selectedFelicitar = felicitar;
    });
  }

  @override
  void initState() {
    super.initState();
    felicitarList = FormularioFelicitarModel.getFelicitar();
  }

  List<Widget> createRadioListFelicitar() {
    List<Widget> widgets = [];
    for (FormularioFelicitarModel felicitar in felicitarList) {
      widgets.add(
        RadioListTile(
          value: felicitar,
          groupValue: selectedFelicitar,
          title: Text(felicitar.name),
          onChanged: (current) {
            setFormularioFelicitarModel(current);
          },
          selected: selectedFelicitar == felicitar,
          activeColor: Colors.orangeAccent,
        ),
      );
    }
    return widgets;
  }

  final TextEditingController _otraController = new TextEditingController();
  TextStyle estiloTexto = new TextStyle(fontSize: 18, color: Color(0xFF00031c));

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
                        style: estiloTexto,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                       Column(
                      children: createRadioListFelicitar(),
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
