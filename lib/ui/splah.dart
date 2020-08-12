import 'package:flutter/material.dart';
import 'package:after_layout/after_layout.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tp/main.dart';
import 'package:tp/ui/request_permiss.dart';
class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with AfterLayoutMixin {
  @override
  void afterFirstLayout(BuildContext context) {
    this._check();
  }

  _check() async {
    final bool hasAccess = await Permission.locationWhenInUse.isGranted;
    if (hasAccess) {
      Navigator.pushReplacementNamed(context, MainPage.routeName);
    } else {
      Navigator.pushReplacementNamed(context, RequestPermissionPage.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF53576e),
      body: Center(
        child: CircularProgressIndicator(backgroundColor: Color(0xFFffb900),),
      ),
    );
  }
}