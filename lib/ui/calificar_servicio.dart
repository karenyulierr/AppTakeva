import 'package:flutter/material.dart';
import 'package:tp/ui/denunciar.dart';
import 'package:tp/ui/felicitar.dart';

class CalificarElServicioMain extends StatelessWidget {
  const CalificarElServicioMain({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFF53576e),
      appBar: AppBar(
        title: Text('Calificar el servicio'),
        backgroundColor: Color(0xFF2a2e43),
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 44),
        //scrollDirection: Axis.vertical,
        children: <Widget>[
          Container(
            child: Center(
              child: Container(
                  height: _screenSize.height * 0.45,
                  width: _screenSize.width * 0.55,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Felicitar()));
                    },
                    child: Card(
                        elevation: 10.0,
                        color: Color(0xFFE1E2E1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            AspectRatio(
                              aspectRatio: 12 / 9.0,
                              child: Image.asset('assets/felicitar1.png'),
                            ),
                            SizedBox(
                              height: 18.0,
                            ),
                            Text("Felicitar",
                                style: TextStyle(
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF00031c))),
                          ],
                        )),
                  )),
            ),
          ),
          SizedBox(
            height: 25.0,
          ),
          Container(
            child: Center(
              child: Container(
                 height: _screenSize.height * 0.45,
                  width: _screenSize.width * 0.55,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Denunciar()));
                    },
                    child: Card(
                        elevation: 10.0,
                        color: Color(0xFFE1E2E1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            AspectRatio(
                              aspectRatio: 12 / 9.0,
                              child: Image.asset('assets/denunciar1.png'),
                            ),
                            SizedBox(
                              height: 18.0,
                            ),
                            Text("Denunciar",
                                style: TextStyle(
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF00031c))),
                          ],
                        )),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
