import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gradproject/models/relatedrecommendation_model.dart';
import 'package:gradproject/provider/relatedrecommendation_provider.dart';


class Relatedrecipeprovider extends ChangeNotifier {
  Relatedrecipeprovider(){}

  List<Relatedrecipemodel> relatedrecipe =[];

  Future getRelatedRecipe(String recipeName) async {
    try {
      var response = await Dio().get("http://10.0.2.2:5000/related?recipe=$recipeName");
      relatedrecipe= List<Relatedrecipemodel>.from(response.data["recipes"].map((x)=>Relatedrecipemodel.fromJson(x)));
      notifyListeners();
    }
    catch (e) {
      print(e);
    }
  }


}