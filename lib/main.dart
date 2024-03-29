import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:gradproject/provider/auth/auth_provider.dart';
import 'package:gradproject/provider/auth/fav_provider.dart';
import 'package:gradproject/provider/auth/rating_provider.dart';
import 'package:gradproject/provider/bottom_navy_provider.dart';
import 'package:gradproject/provider/category_provider.dart';
import 'package:gradproject/provider/control_provider.dart';
import 'package:gradproject/provider/detailed_provider.dart';
import 'package:gradproject/provider/recipe_provider.dart';
import 'package:gradproject/provider/relatedrecommendation_provider.dart';
import 'package:gradproject/provider/search_provider.dart';
import 'package:gradproject/view/screens/auth/login_screen.dart';
import 'package:gradproject/view/screens/auth/register_screen.dart';
import 'package:gradproject/view/screens/camerascreen.dart';
import 'package:gradproject/view/screens/checkboxscreen.dart';
import 'package:gradproject/view/screens/homescreen.dart';
import 'package:gradproject/view/screens/searchscreen.dart';
import 'package:gradproject/view/screens/user_profile_screen.dart';
import 'package:gradproject/view/screens/welcomescreen.dart';
import 'package:gradproject/view/widget/bottom_navy_screen.dart';
import 'package:gradproject/view/widget/control_view.dart';
import 'package:provider/provider.dart';

void main()async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();


  runApp(MultiProvider(providers: [

    ChangeNotifierProvider(create: (context) => AuthProvider()),
    ChangeNotifierProvider(create: (context) => RatingProvider()),
    ChangeNotifierProvider(create: (context) => FavProvider()),
    ChangeNotifierProvider(create: (context) => ControlProvider()),
    ChangeNotifierProvider(create: (context) => BottomNavyProvider()),
    ChangeNotifierProvider(create: (context) => Recipeprovider()),
    ChangeNotifierProvider(create: (context) => Recipeprovider()),
    ChangeNotifierProvider(create: (context) => Categoryprovider()),
    ChangeNotifierProvider(create: (context) => Searchprovider()),
    ChangeNotifierProvider(create: (context) => Detailedprovider()),
    ChangeNotifierProvider(create: (context) => Relatedrecipeprovider()),
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
      home: ControlView(),
    );
  }
}