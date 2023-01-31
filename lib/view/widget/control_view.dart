
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/control_provider.dart';
import '../screens/auth/login_screen.dart';
import '../screens/homescreen.dart';

class ControlView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ControlProvider>(builder: (context,provider,child){
      return provider.uId==null? LoginScreen():Homescreen();
    });
  }
}
