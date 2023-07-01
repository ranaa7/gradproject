import 'package:flutter/foundation.dart';

class Detailedmodel{
  int id;
  String name;
  String image;
  String cooktime;
  String calories;
  String ingredients;
  String instructions;
  String keywords;
  String quantities;
  String servings;
  double FatContent;
  double SaturatedFatContent;
  double CholesterolContent;
  double SodiumContent;
  double CarbohydrateContent;
  double FiberContent;
  double SugarContent;
  double ProteinContent;

  Detailedmodel({
   required this.id,
   required this.name,
   required this.image,
  required  this.cooktime,
   required this.calories,
    required this.ingredients,
   required this.instructions,
    required this.keywords,
    required this.quantities,
    required this.servings,
    required this.FatContent,
    required this.SaturatedFatContent,
    required this.CholesterolContent,
    required this.SodiumContent,
    required this.CarbohydrateContent,
    required this.FiberContent,
    required this.SugarContent,
    required this.ProteinContent,
}
   );
  factory Detailedmodel.fromJson(Map<String, dynamic> json) => Detailedmodel(
      id:json["ID"],
      name: json["Name"],
      image: json["Images"][0],
      cooktime: json["CookTime"],
      calories: json["Calories"],
      ingredients: json["Ingredients"],
      instructions: json["RecipeInstructions"],
      keywords: json["Keywords"],
      quantities:json["RecipeIngredientQuantities"],
      servings: json["RecipeServings"],

      FatContent: json["FatContent"],
      SaturatedFatContent: json["SaturatedFatContent"],
      CholesterolContent: json["CholesterolContent"],
      SodiumContent: json["SodiumContent"],
      CarbohydrateContent: json["CarbohydrateContent"],
      FiberContent: json["FiberContent"],
      SugarContent: json["SugarContent"],
      ProteinContent: json["ProteinContent"]

  );

}