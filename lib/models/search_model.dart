class Searchmodel{
  String name;
  int id;
  String image;
  String recipecateg;

  Searchmodel({required this.name, required this.id, required this.image,required this.recipecateg});

  factory Searchmodel.fromJson(Map<String, dynamic> json) => Searchmodel(
    name: json["Name"],
    id: json["ID"],
    image: json["Images"][0],
    recipecateg: json["RecipeCategory"],
  );

  Map<String, dynamic> toJson() => {
    "ID": id,
    "Name": name,
    "Images": image,
    "RecipeCategory":recipecateg,
  };
}