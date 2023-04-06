class Relatedrecipemodel{
  String name;
  int id;
  String image;

  Relatedrecipemodel({required this.name, required this.id, required this.image});

  factory Relatedrecipemodel.fromJson(Map<String, dynamic> json) => Relatedrecipemodel(
      name: json["Name"],
      id: json["ID"],
      image: json["Images"][0],
  );
}