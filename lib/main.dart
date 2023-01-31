import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:gradproject/provider/auth/auth_provider.dart';
import 'package:gradproject/provider/control_provider.dart';
import 'package:gradproject/view/screens/auth/login_screen.dart';
import 'package:gradproject/view/screens/homescreen.dart';
import 'package:gradproject/view/widget/control_view.dart';
import 'package:provider/provider.dart';

void main()async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();


  runApp(MultiProvider(providers: [

    ChangeNotifierProvider(create: (context) => AuthProvider()),
    ChangeNotifierProvider(create: (context) => ControlProvider()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: Homescreen(),
    );
  }
}