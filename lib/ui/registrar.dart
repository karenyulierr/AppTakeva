import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:tp/controllers/db_register.dart';
import 'package:tp/libs/auth.dart';
import 'package:tp/ui/login.dart';

class Registrar extends StatefulWidget {
  Registrar({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _RegistrarState createState() => _RegistrarState();
}

class _RegistrarState extends State<Registrar> {
  DbRegister dbregister = new DbRegister();
  final TextEditingController _nameController = new TextEditingController();
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();

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
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
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

            SizedBox(height: 26.0),
            TextFormField(
              controller: _nameController,
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
            /* SizedBox(height: 12.0),
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
            ), */
            SizedBox(height: 12.0),
            TextFormField(
              controller: _emailController,
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
              obscureText: false,
            ),
            SizedBox(height: 12.0),
            /* TextFormField(
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
            SizedBox(height: 12.0), */
            TextFormField(
              controller: _passwordController,
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
            /* SizedBox(height: 12.0),
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
            ), */
            SizedBox(height: 15.0),

            RaisedButton(
              child: Text(
                'REGISTRARSE',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              color: Color(0xFFffb900),
              onPressed: () {
                dbregister.registerUser(
                    _nameController.text.trim(),
                    _emailController.text.trim(),
                    _passwordController.text.trim());
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => LoginPage(),
                ));
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
