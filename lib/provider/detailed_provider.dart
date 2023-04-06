import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:gradproject/models/detailed_model.dart';
import 'package:gradproject/view/screens/detailedpagescreen.dart';

class Detailedprovider extends ChangeNotifier {

  Detailedprovider(){
  }
  List<Detailedmodel> detailedmodel = [];

  Future getdetails(int id) async {
    try {
      print(id);
      var response = await Dio().get("http://10.0.2.2:5000/recipe?id=$id");
      detailedmodel= List<Detailedmodel>.from(
          response.data[
          "recipe"].map((x) => Detailedmodel.fromJson(x)));

      notifyListeners();
      Get.to(() => DetailedScreen());
    }
    catch (e) {
      print(e);
    }
  }
}