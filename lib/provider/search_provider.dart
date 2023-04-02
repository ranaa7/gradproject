import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gradproject/models/search_model.dart';

class Searchprovider extends ChangeNotifier {

  Recipeprovider() {
  }
  List<Searchmodel> searchmodel = [];


  Future getAllSearchrecipe(String value) async {
    try {
      var response = await Dio().get(
          "http://10.0.2.2:5000/search?ingredients=$value");
      searchmodel = List<Searchmodel>.from(
          response.data[
          "recipes"].map((x) => Searchmodel.fromJson(x)));
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}