import 'package:flutter/material.dart';
import 'package:tp/Models/DirectionInformation.dart';

class MapPinPillComponent extends StatefulWidget {
  final double pinPillPosition;
  final DirectionInformation currentlySelectedPin;

  MapPinPillComponent({this.pinPillPosition, this.currentlySelectedPin});
  @override
  _MapPinPillComponentState createState() => _MapPinPillComponentState();
}

class _MapPinPillComponentState extends State<MapPinPillComponent> {
  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
        bottom: widget.pinPillPosition,
        right: 0,
        left: 0,
        duration: Duration(milliseconds: 50),
        child: Align(
            alignment: Alignment.bottomCenter,
            child: Material(
              color: Colors.transparent,
              child: Container(
                  margin: EdgeInsets.all(20),
                  height: 70,
                  decoration: BoxDecoration(
                      color: Color(0xFF53576e),
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            blurRadius: 20,
                            offset: Offset.zero,
                            color: Colors.grey.withOpacity(0.5))
                      ]),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(left: 20),
                            child: Row(
                              children: <Widget>[
                                Container(
                                   decoration: BoxDecoration(
                                    image: DecorationImage(image: 
                                   AssetImage('assets/Alert.png'),fit: BoxFit.cover),
                                    shape: BoxShape.circle
                                  ), 
                                  width: 30,
                                  height: 30,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(widget.currentlySelectedPin.direction,
                                        style: TextStyle(
                                            fontSize: 15, color: Color(0xFFffb900),)),
                                    Text(
                                        'Distancia: ${widget.currentlySelectedPin.distance}',
                                        style: TextStyle(
                                            fontSize: 16, color: Color(0xFFffb900),)),
                                    Text(
                                        'Duración: ${ widget.currentlySelectedPin.duration}',
                                        style: TextStyle(
                                            fontSize: 17, color: Color(0xFFffb900),))
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ])),
            )));
  }
}
