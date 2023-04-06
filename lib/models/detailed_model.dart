import 'package:flutter/foundation.dart';

class Detailedmodel{
  int id;
  String name;
  String image;
  String cooktime;
  double calories;
  String ingredients;
  String instructions;
  String keywords;
  String quantities;
  double servings;

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
      servings: json["RecipeServings"]
  );

}