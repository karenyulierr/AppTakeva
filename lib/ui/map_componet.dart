/*import 'package:flutter/material.dart';

class MapComponet extends StatefulWidget {
  double pinPillPosition;
  pinInformation currentlySeletedPin;

  MapComponet({this.pinPillPosition, this.currentlySeletedPin});
  @override
  _MapComponetState createState() => _MapComponetState();
}

class _MapComponetState extends State<MapComponet> {
  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      bottom: widget.pinPillPosition,
      right: 0,
      left: 0,
      duration: Duration(milliseconds: 200),
      child: Align(
          alignment: Alignment.bottomCenter,
          child: Material(
            color: Colors.transparent,
            child: Column(children: <Widget>[
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(20),
                  height: 70,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            blurRadius: 20,
                            offset: Offset.zero,
                            color: Colors.grey.withOpacity(0.5)),
                      ]),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(widget.currentlySeletedPin.locationName,
                          style: TextStyle(
                              fontSize: 12,
                              color: widget.currentlySeletedPin.labelColor)),
                      Text(
                          'Latitude: ${widget.currentlySeletedPin.location.latitude.toString()}',
                          style: TextStyle(fontSize: 6, color: Colors.grey)),
                      Text(
                          'Longitud: ${widget.currentlySeletedPin.location.longitude.toString()}',
                          style: TextStyle(fontSize: 6, color: Colors.grey)),
                    ],
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.all(15),
                  child: Image.asset(widget.currentlySeletedPin.pinPath,
                      width: 50, height: 50))
            ]),
          )),
    );
  }
}
*/