import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class Registrar extends StatefulWidget {
  @override
  _RegistrarState createState() => _RegistrarState();
}

class _RegistrarState extends State<Registrar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF53576e),
      appBar: AppBar(
        backgroundColor: Color(0xFF2a2e43),
        title: Text('Registrarse'),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal:20.0 ),
          children: <Widget>[
        
            Container(
              height: 100.0,
                //padding: const EdgeInsets.symmetric(horizontal:20.0 ),
                child: ClipRRect(
                  child: Image(
                    image: AssetImage('assets/logo.png'),
                  ),
                )),
            Text("Obtén Takeva en pocos minutos",
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
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
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

            SizedBox(height: 12.0),
            TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText: 'Nombres',
                icon: Icon(
                  Icons.edit,
                  color: (Colors.white),
                ),
              ),
            ),
// spacer
            SizedBox(height: 12.0),
            TextFormField(
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText: 'Apellidos',
                icon: Icon(
                  Icons.edit,
                  color: (Colors.white),
                ),
              ),
              obscureText: true,
            ),
            SizedBox(height: 12.0),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText: 'Correo electrónico',
                suffixIcon: Icon(
                  Icons.email,
                  color: (Colors.white),
                ),
              ),
              obscureText: true,
            ),
            SizedBox(height: 12.0),
            TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText: 'Número de celular',
                icon: Icon(
                  Icons.phone_android,
                  color: (Colors.white),
                ),
              ),
              obscureText: true,
            ),
            SizedBox(height: 12.0),
            TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText: 'Contraseña',
                icon: Icon(
                  Icons.lock,
                  color: (Colors.white),
                ),
              ),
              obscureText: true,
            ),
            SizedBox(height: 12.0),
            TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText: 'Confirmar contraseña',
                icon: Icon(
                  Icons.lock,
                  color: (Colors.white),
                ),
              ),
              obscureText: false,
            ),
            SizedBox(height: 12.0),
            
            RaisedButton(
              child: Text(
                'REGISTRARSE',
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
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
      ),
    );
  }
}
