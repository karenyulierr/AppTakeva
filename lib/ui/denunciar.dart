import 'package:flutter/material.dart';
import 'package:tp/Models/FormularioDenunciarModel.dart';

class Denunciar extends StatefulWidget {
  @override
  _CalificarElServcioMainState createState() => _CalificarElServcioMainState();
}

class _CalificarElServcioMainState extends State<Denunciar> {
  List<FormularioDenunciarModel> denunciasList;
  FormularioDenunciarModel selectedDenuncia;

  setFormularioDenunciarModel(FormularioDenunciarModel denuncia) {
    setState(() {
      selectedDenuncia = denuncia;
    });
  }

  @override
  void initState() {
    super.initState();
    denunciasList = FormularioDenunciarModel.getDenuncias();
  }

  List<Widget> createRadioListDenuncias() {
    List<Widget> widgets = [];
    for (FormularioDenunciarModel denuncia in denunciasList) {
      widgets.add(
        RadioListTile(
          value: denuncia,
          groupValue: selectedDenuncia,
          title: Text(denuncia.name),
          onChanged: (current) {
            setFormularioDenunciarModel(current);
          },
          selected: selectedDenuncia == denuncia,
          activeColor: Colors.orangeAccent,
        ),
      );
    }
    return widgets;
  }

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
                    Column(
                      children: createRadioListDenuncias(),
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
