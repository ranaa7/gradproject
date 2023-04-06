import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gradproject/models/recipe_model.dart';

class Recipeprovider extends ChangeNotifier {

  Recipeprovider(){
    getRecipe();
  }
  List<Recipemodel> recipemodel =[];

  Future getRecipe() async {
    try {
      var response = await Dio().get("http://10.0.2.2:5000/trending");
      recipemodel= List<Recipemodel>.from(response.data["recipes"].map((x)=>Recipemodel.fromJson(x)));
      notifyListeners();
    }
    catch (e) {
      print(e);
    }
  }

  Future getRelatedRecipe(String recipeName) async {
    try {
      var response = await Dio().get("http://10.0.2.2:5000/related?recipe=$recipeName");
      recipemodel= List<Recipemodel>.from(response.data["recipes"].map((x)=>Recipemodel.fromJson(x)));
      notifyListeners();
    }
    catch (e) {
      print(e);
    }
  }


}