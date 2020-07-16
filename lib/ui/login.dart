import 'dart:convert';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:tp/libs/auth.dart';
import 'package:tp/ui/principal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tp/ui/recuperar_contrasena.dart';
import 'package:tp/ui/registrar.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLoading = false;
  bool _isCorrect = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF2a2e43),
        child: _isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView(
                children: <Widget>[
                  headerSection(),
                  textSection(),
                ],
              ),
      ),
    );
  }

  signIn(String email, pass) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map data = {'email': email, 'password': pass};
    var jsonResponse = null;

    var response =
        await http.post("http://192.168.100.35:8000/api/login", body: data);
    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (jsonResponse != null) {
        setState(() {
          _isLoading = false;
        });
        sharedPreferences.setString("token", jsonResponse['token']);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (BuildContext context) => PrincipalPasajero()),
            (Route<dynamic> route) => false);
      }
    } else {
      setState(() {
        _isLoading = false;
        _isCorrect = true;
      });
      print(response.body);
    }
  }

  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  Container textSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return 'Este campo no puede estar vacío';
                }
                String p = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
                    "\\@" +
                    "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
                    "(" +
                    "\\." +
                    "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
                    ")+";
                RegExp regExp = new RegExp(p);
                if (regExp.hasMatch(value)) {
                  return null;
                }
                return 'Email suministrado no válido. Intente otro correo electrónico';
              },

              controller: emailController,
              //validator: validateEmail,
              keyboardType: TextInputType.emailAddress,

              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText: 'Correo electrónico',
                icon: Icon(
                  Icons.email,
                  color: (Colors.white),
                ),
              ),
            ),
            SizedBox(height: 30.0),
            TextFormField(
              controller: passwordController,
              /* validator: validatePassword, */
              validator: (value) {
                if (value.isEmpty) {
                  return 'Este campo no puede estar vacío';
                }
                return null;
              },
              decoration: InputDecoration(
                filled: true,
                labelText: 'Contraseña',
                fillColor: Colors.white,
                icon: Icon(
                  Icons.lock,
                  color: (Colors.white),
                ),
              ),
              obscureText: true,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    child: Text(
                      'Recuperar contraseña',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => RecuperarContrasena(),
                      ));
                    },
                  ),
                  FlatButton(
                    child: Text(
                      'Registrarse',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Registrar(),
                      ));
                    },
                  ),
                ],
              ),
            ),
            RaisedButton(
              onPressed:
                  /*emailController.text == "" || passwordController.text == ""
                    ? null
                    : */
                  () {
                setState(() {
                  if (_formKey.currentState.validate()) {
                    _isLoading = false;

                    if (_isCorrect == true) {
                      showDialog(
                          context: context,
                          builder: (BuildContext buildcontext) {
                            return AlertDialog(
                                title: Text("Advertencia"),
                                content: Text(
                                    "El correo o la contraseña son incorrectos."),
                                actions: <Widget>[
                                  FlatButton(
                                    child: Text("Ok"),
                                    onPressed: () {
                                      Navigator.of(buildcontext)
                                          .pushAndRemoveUntil(
                                              MaterialPageRoute(
                                                  builder: (BuildContext
                                                          buildcontext) =>
                                                      LoginPage()),
                                              (Route<dynamic> route) => true);
                                    },
                                  ),
                                ]);
                          });
                    } else {}
                  }
                });
                signIn(emailController.text, passwordController.text);
              },
              child: Text('INICIAR SESIÓN',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
              color: Color(0xFFffb900),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            SizedBox(height: 10.0),
            Text("- o -",
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center),
            SizedBox(height: 10.0),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                    child: SignInButton(
                      Buttons.Google,
                      text: "Google",
                      onPressed: () async {
                        await Auth.instance.google();
                        print("listo");
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  Flexible(
                    child: SignInButton(
                      Buttons.Facebook,
                      text: "Facebook",
                      onPressed: () async {
                        Auth.instance.facebook();
                        print("listo");
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container headerSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: <Widget>[
          Image.asset('assets/logo.png'),
        ],
      ),
    );
  }
}
