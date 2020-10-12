import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class DbRegisterEstadist {
  String serverUrl = "http://192.168.0.106:8000/api/estadisticas";

  var status;
  var token;

  registerEstadistiFelicitacion(int valor6, int valor7, int valor8, int valor9, int valor10, String _otraController) async{
    String myUrl="$serverUrl";
    final response = await http.post(myUrl, 
    headers: {
      'Accept': 'application/json'
    },
    body: {
      "trato_amable_cordial": "$valor6",
      "conduce_con_prudencia": "$valor7",
      "respeta_las_senales": "$valor8",
      "vehiculo_limpio": "$valor9",
      "viaje_agradable_limpio_seguro": "$valor10",
      "otra": "$_otraController"
    });
    status = response.body.contains('error');

    var data = json.decode(response.body);

    if(status){
      print('data : ${data["error"]}');
    }
    else{
      print('data : ${data["token"]}');
      _save(data["token"]);
    }
  }

  registerEstadistiDenuncia(int valor1, int valor2, int valor3, int valor4, int valor5, String _otraController) async{
    String myUrl="$serverUrl";
    final response = await http.post(myUrl, 
    headers: {
      'Accept': 'application/json'
    },
    body: {
      "exceso_de_velocidad": "$valor1",
      "habla_por_celular": "$valor2",
      "tanquea_con_pasajeros": "$valor3",
      "omite_senales": "$valor4",
      "conduce_brusco": "$valor5",
      "otra": "$_otraController"
    });
    status = response.body.contains('error');

    var data = json.decode(response.body);

    if(status){
      print('data : ${data["error"]}');
    }
    else{
      print('data : ${data["token"]}');
      _save(data["token"]);
    }
  }

  _save(String token) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = token;
    prefs.setString(key, value); 
  }
}