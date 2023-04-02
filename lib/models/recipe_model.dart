class Recipemodel{
  String name;
  int id;
  String image;

  Recipemodel({required this.name, required this.id, required this.image});

  factory Recipemodel.fromJson(Map<String, dynamic> json) => Recipemodel(
      name: json["Name"],
      id: json["ID"],
      image: json["Images"]
  );

  Map<String, dynamic> toJson() => {
    "ID": id,
    "Name": name,
    "Images": image,
  };
}