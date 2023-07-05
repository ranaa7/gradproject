import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gradproject/models/category_model.dart';
import 'package:gradproject/models/relatedrecommendation_model.dart';
import 'package:gradproject/provider/category_provider.dart';
import 'package:gradproject/provider/relatedrecommendation_provider.dart';


class Categoryprovider extends ChangeNotifier {
  Categoryprovider(){}

  List<Categorymodel> categorymodel=[];

  Future getBreakfast() async {
    try {
      var response = await Dio().get("http://10.0.2.2:5000/category?category=Breakfast");
      categorymodel= List<Categorymodel>.from(response.data["recipes"].map((x)=>Categorymodel.fromJson(x)));
      notifyListeners();
    }
    catch (e) {
      print(e);
    }
  }


  Future getLunch() async {
    try {
      var response = await Dio().get("http://10.0.2.2:5000/category?category=Lunch/Snacks");
      categorymodel= List<Categorymodel>.from(response.data["recipes"].map((x)=>Categorymodel.fromJson(x)));
      notifyListeners();
    }
    catch (e) {
      print(e);
    }
  }


  Future getDessert() async {
    try {
      var response = await Dio().get("http://10.0.2.2:5000/category?category=Dessert");
      categorymodel= List<Categorymodel>.from(response.data["recipes"].map((x)=>Categorymodel.fromJson(x)));
      notifyListeners();
    }
    catch (e) {
      print(e);
    }
  }

}