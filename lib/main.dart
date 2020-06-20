import 'package:flutter/material.dart';
import 'package:tp/ui/principal.dart';
import 'package:tp/ui/registrar.dart';
import 'package:tp/ui/recuperar_contrasena.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
void main() {
  runApp(MaterialApp(
    home: HomeScreen(),
    theme: ThemeData(
      fontFamily: 'Raleway',
    ),
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/principal': (context) => PrincipalPasajero(),
      '/registrar': (context) => Registrar(),
      '/recuperar': (context) => RecuperarContrasena(),
    },
  ));
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color(0xFF2a2e43),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.fromLTRB(20.0, 0,20.0,0),
          children: <Widget>[
            Column(
              children: <Widget>[
                Image.asset('assets/logo.png'),
              ],
            ),
            SizedBox(height: 12.0),
            TextField(
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
            SizedBox(height: 12.0),
            TextField(
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
                    child: Text('Recuperar contraseña',
                    style: TextStyle(color: Colors.white),),
                    onPressed: () {
                      Navigator.pushNamed(context, "/recuperar");
                    },
                  ),
                  FlatButton(
                    child: Text(
                      'Registrarse',
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, "/registrar");
                    },
                  ),
                ],
              ),
            ),
            
            FlatButton(
              child: Text('INICIAR SESIÓN', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
              color: Color(0xFFffb900),
              onPressed: () {
                Navigator.pushNamed(context, "/principal");
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            SizedBox(height: 10.0),
            Text("- o -",style: TextStyle(color: Colors.white), textAlign: TextAlign.center),
            SizedBox(height: 10.0),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(child: SignInButton(
                      Buttons.Google,
                      text: "Google",
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),),
                  
                  Flexible(
                    child: SignInButton(
                      Buttons.Facebook,
                      text: "Facebook",
                      onPressed: () {},
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
}