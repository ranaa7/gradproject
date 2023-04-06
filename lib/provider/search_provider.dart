//
//
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:gradproject/models/search_model.dart';
// import 'package:gradproject/provider/auth/auth_provider.dart';
// import 'package:provider/provider.dart';
//
// class Searchprovider extends ChangeNotifier {
//
//   Recipeprovider() {
//   }
//   List<Searchmodel> searchmodel = [];
//
//
//   Future getAllSearchrecipe(String value,String keywords) async {
//     var response;
//
//     try {
//       if(keywords==null){
//          response = await Dio().get(
//             "http://10.0.2.2:5000/rec?ingredients=$value");
//       }
//       else{
//         response = await Dio().get(
//             "http://10.0.2.2:5000/rec?ingredients=$value&&keywords=$keywords");
//         print(keywords);
//
//       }
//       searchmodel = List<Searchmodel>.from(
//           response.data[
//           "recipes"].map((x) => Searchmodel.fromJson(x)));
//       notifyListeners();
//     } catch (e) {
//       print(e);
//     }
//   }
// }

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gradproject/models/search_model.dart';
import 'package:gradproject/provider/auth/auth_provider.dart';
import 'package:provider/provider.dart';

class Searchprovider extends ChangeNotifier {

  Recipeprovider() {
  }
  List<Searchmodel> searchmodel = [];


  Future getAllSearchrecipe(String value,List keywords) async {


    try {
      String newKeywords = keywords.join(',');
      print(newKeywords);
      var response = await Dio().get(
          "http://10.0.2.2:5000/rec?ingredients=$value&&keywords=$newKeywords");
      print(response.data["recipes"]);

          searchmodel = List<Searchmodel>.from(
      response.data[
      "recipes"].map((x) => Searchmodel.fromJson(x)));
    notifyListeners();
    } catch (e) {
    print(e);
    }
  }
}