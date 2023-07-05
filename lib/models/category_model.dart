import 'package:flutter/foundation.dart';

class Categorymodel{
  String name;
  int id;
  String image;

  Categorymodel({required this.name, required this.id, required this.image});

  factory Categorymodel.fromJson(Map<String, dynamic> json) => Categorymodel(
    name: json["Name"],
    id: json["ID"],
    image: json["Images"],
  );
}