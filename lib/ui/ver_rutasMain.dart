import 'package:flutter/material.dart';
import 'package:tp/ui/rutas_fav.dart';
import 'package:tp/ui/ver_rutas.dart';

class VerRutasMain extends StatelessWidget {
  const VerRutasMain({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Raleway',
      ),
      home: MyBottomNavigatonBar(),
    );
  }
}

class MyBottomNavigatonBar extends StatefulWidget {
  MyBottomNavigatonBar({Key key}) : super(key: key);

  @override
  _MyBottomNavigatonBarState createState() => _MyBottomNavigatonBarState();
}

class _MyBottomNavigatonBarState extends State<MyBottomNavigatonBar> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    ListRutas(),
    Container(),
  ];
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
  Widget buildWidgeet(context){
    if(_currentIndex == 1){
      return RutasFav.create(context: context);
    }else{
      return _children[_currentIndex];
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildWidgeet(context),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: onTabTapped,
          fixedColor: Color(0xFFffb900),
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.directions_bus),
              title: Text('Rutas'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              title: Text('Favoritas'),
            ),
          ]),
    );
  }
}
