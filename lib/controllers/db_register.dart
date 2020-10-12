import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class DbRegister {
  String serverUrl = "http://192.168.0.106:8000/api/register";

  var status;
  var token;

  registerUser(String _nameController, String _emailController,
      String _passwordController) async {
        int idTercero=1;
    String myUrl = "$serverUrl";
    final response = await http.post(myUrl, headers: {
      'Accept': 'application/json'
    }, body: {
      "idTercero": "$idTercero",
      "name": "$_nameController",
      "email": "$_emailController",
      "password": "$_passwordController"
    });
    status = response.body.contains('error');

    var data = json.decode(response.body);

    if (status) {
      print('data : ${data["error"]}');
    } else {
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
