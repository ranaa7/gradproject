import 'package:flutter/material.dart';
import 'package:gradproject/view/screens/camerascreen.dart';
import 'package:gradproject/view/screens/favoritesscreen.dart';
import 'package:gradproject/view/screens/homescreen.dart';
import 'package:gradproject/view/screens/meal_plan_screen.dart';
import 'package:gradproject/view/screens/user_profile_screen.dart';

class BottomNavyProvider extends ChangeNotifier{
  int currentindex=0;

  Widget currentscreen=Homescreen();

  void changescreen(int index){
    currentindex=index;
    switch(index){
      case 0:
        currentscreen=Homescreen();
        break;
      case 2:
        currentscreen=CameraScreen();
        break;
      case 2:
        currentscreen=MealPlanScreen();
        break;
      case 3:
        currentscreen=FavoritesScreen();
        break;
      case 4:
        currentscreen=ProfileScreen();
        break;
    }
    notifyListeners();

  }
}